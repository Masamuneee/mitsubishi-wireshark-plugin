--------------------------------------------------------------------------
--
-- CC-Link SLMP(SeamLess Message Protocol) Plug-in for Wireshark
--
-- revision : 03.1
-- date     : 2024/5/15
--
-- Copyright(C) CC-Link Partner Association All Rights Reserved     
--------------------------------------------------------------------------


-- ############################### Option ################################
-- Command data Analyze
-- 	Example1) local cmddata_analyze  = true  <= Analyzed SLMP Command data
-- 	Example2) local cmddata_analyze  = false <= Not Analyzed SLMP Command data
local cmddata_analyze  = true

-- Port Number Check Flag
-- 	Example1) local portNumber_check  = true  <= Each SLMP Command Checked Port Number
-- 	Example2) local portNumber_check  = false <= Each SLMP Command Not Checked Port Number
local portNumber_check = true

-- Get Communication Setting2 Port Number
--	 Example1) local user_specific_port = {  45239        }  <= Checked 45239
--	 Example2) local user_specific_port = {  45238,45239  }  <= Checked 45238 or 45239
--	 Example3) local user_specific_port = nil                <= Not Checked
user_specific_port = { 45239 }

-- Protocol-specific port definitions
local SLMP_PORT = 2000
local MELSEC_PORT = 5562
-- ###########################################################################

-- Add bit manipulation library compatibility
-- This allows the script to work with both Lua 5.1 (bit) and Lua 5.2+ (bit32)
if not bit32 then
    bit32 = {}
    
    -- Check if we have the bit module (LuaJIT or Lua 5.1 with bitop)
    if bit then
        bit32.band = bit.band
        bit32.bor = bit.bor
        bit32.bxor = bit.bxor
        bit32.lshift = bit.lshift
        bit32.rshift = bit.rshift
        bit32.arshift = bit.arshift
        bit32.bnot = bit.bnot
        bit32.extract = bit.extract
    else
        -- If neither bit32 nor bit is available, create simple implementations
        -- Warning: these are not optimized and may not handle all edge cases
        function bit32.band(a, b) return a & b end
        function bit32.bor(a, b) return a | b end
        function bit32.bxor(a, b) return a ~ b end
        function bit32.lshift(a, b) return a << b end
        function bit32.rshift(a, b) return a >> b end
        function bit32.bnot(a) return ~a end
    end
end

-- Protocol name mapping to display in Wireshark
local protocol_port_names = {
    [SLMP_PORT] = "SLMP",
    [MELSEC_PORT] = "MELSEC"
}

if(cmddata_analyze) then
	dofile(DATA_DIR.."/plugins/SLMP_com_Rev03.lua")	-- [SLMP_com.lua] Directory path
end

-- First try to load the MELSEC helper module
local melsec_helper_loaded = pcall(function() 
    dofile(DATA_DIR.."/plugins/melsec_helper.lua")
end)

-- Create a fallback if melsec_helper.lua couldn't be loaded
if not melsec_helper_loaded then
    -- Create minimal MELSEC support
    if not MelsecCommands then
        MelsecCommands = {
            [0x0401] = "Device Read",
            [0x1401] = "Device Write",
            [0x0157] = "Read Module Type"
        }
    end
end

local slm_proto = Proto("slmp", "SeamLess Message Protocol")

-- Field Object
Fs ={}
	-- (1) Binary
	Fs[ "slmp.b.st_header"      ] = ProtoField.string(  "slmp.b.st_header"      ,   "slmpSTHeader         "                              ) -- Frame type(ST Frame)
	Fs[ "slmp.b.mt_header"      ] = ProtoField.bytes(   "slmp.b.mt_header"      ,   "slmpMTHeader         "                              ) -- Frame type(MT Frame)
	Fs[ "slmp.b.emt_header"     ] = ProtoField.bytes(   "slmp.b.emt_header"     ,   "slmpEMTHeader        "                              ) -- Frame type(EMT Frame)
	Fs[ "slmp.b.sub_header"     ] = ProtoField.bytes(   "slmp.b.sub_header"     ,   "slmpSubHeader        "                              ) -- SlmpSubHeader
	Fs[ "slmp.b.sub_lmt_header" ] = ProtoField.bytes(   "slmp.b.sub_lmt_header" ,   "slmpSubLMTHeader     "                              ) -- SlmpSubLMTHeader
	Fs[ "slmp.b.sub_emt_header" ] = ProtoField.bytes(   "slmp.b.sub_emt_header" ,   "slmpSubEMTHeader     "                              ) -- SlmpSubEMTHeader
	Fs[ "slmp.b.sub1"           ] = ProtoField.uint16(  "slmp.b.sub1"           ,   "fType                "  ,   base.HEX                ) -- Frame type(MT/LMT Frame)[47:32]
	Fs[ "slmp.b.ftype"          ] = ProtoField.string(  "slmp.b.ftype"          ,   "fType                "                              ) -- Frame type(MT/LMT Frame)[47:32]
	Fs[ "slmp.b.serial"         ] = ProtoField.uint16(  "slmp.b.serial"         ,   "serialNo             "  ,   base.HEX                ) -- Serial number(MT/LMT Frame)[31:16]
	Fs[ "slmp.b.sub2"           ] = ProtoField.uint16(  "slmp.b.sub2"           ,   "reserved2            "  ,   base.HEX                ) -- For future expansion(MT/LMT Frame)[15:0]
	Fs[ "slmp.b.net_num"        ] = ProtoField.uint8(   "slmp.b.net_num"        ,   "netNo                "  ,   base.HEX                ) -- Network number of request destination station
	Fs[ "slmp.b.dst_net_num"    ] = ProtoField.uint8(   "slmp.b.dst_net_num"    ,   "dstNetNo             "  ,   base.HEX                ) -- Network number of request destination station
	Fs[ "slmp.b.src_net_num"    ] = ProtoField.uint8(   "slmp.b.src_net_num"    ,   "srcNetNo             "  ,   base.HEX                ) -- Network number of request destination station
	Fs[ "slmp.b.unit_num"       ] = ProtoField.uint8(   "slmp.b.unit_num"       ,   "nodeNo               "  ,   base.HEX                ) -- Station number of request destination station
	Fs[ "slmp.b.node_num"       ] = ProtoField.string(  "slmp.b.node_num"       ,   "nodeNo               "                              ) -- Station number of request destination station
	Fs[ "slmp.b.dst_node_num"   ] = ProtoField.string(  "slmp.b.dst_node_num"   ,   "dstNodeNo            "                              ) -- Station number of request destination station
	Fs[ "slmp.b.src_node_num"   ] = ProtoField.string(  "slmp.b.src_node_num"   ,   "srcNodeNo            "                              ) -- Station number of request destination station
	Fs[ "slmp.b.io_num"         ] = ProtoField.uint16(  "slmp.b.io_num"         ,   "dstProcNo            "  ,   base.HEX                ) -- Processor number of request destination station
	Fs[ "slmp.b.dstproc_num"    ] = ProtoField.string(  "slmp.b.dstproc_num"    ,   "dstProcNo            "                              ) -- Processor number of request destination station
	Fs[ "slmp.b.srcproc_num"    ] = ProtoField.string(  "slmp.b.srcproc_num"    ,   "srcProcNo            "                              ) -- Processor number of request destination station
	Fs[ "slmp.b.pkt_type"       ] = ProtoField.string(  "slmp.b.pkt_type"       ,   "pktType              "                              ) -- Packet type
	Fs[ "slmp.b.length"         ] = ProtoField.uint16(  "slmp.b.length"         ,   "dl                   "  ,   base.HEX                ) -- Request data length
	Fs[ "slmp.b.timer"          ] = ProtoField.string(  "slmp.b.timer"          ,   "timer                "                              ) -- Timer
	Fs[ "slmp.b.flgm"           ] = ProtoField.uint16(  "slmp.b.flgm"           ,   "flgm                 "  ,   base.HEX                ) -- Division information
	Fs[ "slmp.b.exit_code"      ] = ProtoField.uint16(  "slmp.b.exit_code"      ,   "endCode              "  ,   base.HEX    ,   ExitCode) -- End code
	Fs[ "slmp.b.cmd"            ] = ProtoField.uint16(  "slmp.b.cmd"            ,   "command              "  ,   base.HEX                ) -- Command
	Fs[ "slmp.b.sub_cmd"        ] = ProtoField.uint16(  "slmp.b.sub_cmd"        ,   "subCommand           "  ,   base.HEX                ) -- Sub-command
	Fs[ "slmp.b.mltdrop"        ] = ProtoField.uint8(   "slmp.b.mltdrop"        ,   "reserved1            "  ,   base.HEX                ) -- For future expansion
	Fs[ "slmp.b.fxvalue"        ] = ProtoField.uint8(   "slmp.b.fxvalue"        ,   "reserved3            "  ,   base.HEX                ) -- For future expansion
	Fs[ "slmp.b.ext_num"        ] = ProtoField.uint16(  "slmp.b.ext_num"        ,   "largeNodeNo          "  ,   base.HEX                ) -- Request target station extended station number
	Fs[ "slmp.b.res"            ] = ProtoField.uint8(   "slmp.b.res"            ,   "reserved             "  ,   base.HEX                ) -- reserved
	Fs[ "slmp.b.split_id"       ] = ProtoField.uint8(   "slmp.b.split_id"       ,   "req/resDataId        "  ,   base.HEX                ) -- Message identification value
	Fs[ "slmp.b.req_dataid"     ] = ProtoField.uint8(   "slmp.b.req_dataid"     ,   "reqDataId            "  ,   base.HEX                ) -- Message identification value
	Fs[ "slmp.b.res_dataid"     ] = ProtoField.uint8(   "slmp.b.res_dataid"     ,   "resDataId            "  ,   base.HEX                ) -- Message identification value
	Fs[ "slmp.b.split_num"      ] = ProtoField.uint16(  "slmp.b.split_num"      ,   "req/resDataDevideNum "  ,   base.HEX                ) -- Total division number
	Fs[ "slmp.b.req_devnum"     ] = ProtoField.uint16(  "slmp.b.req_devnum"     ,   "reqDataDevideNum     "  ,   base.HEX                ) -- Total division number
	Fs[ "slmp.b.res_devnum"     ] = ProtoField.uint16(  "slmp.b.res_devnum"     ,   "resDataDevideNum     "  ,   base.HEX                ) -- Total division number
	Fs[ "slmp.b.seq_no"         ] = ProtoField.uint16(  "slmp.b.seq_no"         ,   "req/resDataNumber    "  ,   base.HEX                ) -- Divided data number
	Fs[ "slmp.b.req_datano"     ] = ProtoField.uint16(  "slmp.b.req_datano"     ,   "reqDataNumber        "  ,   base.HEX                ) -- Divided data number
	Fs[ "slmp.b.res_datano"     ] = ProtoField.uint16(  "slmp.b.res_datano"     ,   "resDataNumber        "  ,   base.HEX                ) -- Divided data number
	Fs[ "slmp.b.reqdata"        ] = ProtoField.bytes(   "slmp.b.reqdata"        ,   "reqData              "                              ) -- Request data
	Fs[ "slmp.b.resdata"        ] = ProtoField.bytes(   "slmp.b.resdata"        ,   "resData              "                              ) -- Response data
	Fs[ "slmp.b.errinfo"        ] = ProtoField.bytes(   "slmp.b.errinfo"        ,   "errInfo              "                              ) -- Error Info
	Fs[ "slmp.b.notif.code"     ] = ProtoField.uint16(  "slmp.b.notif.code"     ,   "notificationCode     "  ,   base.HEX                ) -- Notification code
	Fs[ "slmp.b.reserved1"      ] = ProtoField.uint8(   "slmp.b.reserved1"      ,   "reserved1            "  ,   base.HEX                ) -- For future expansion
	Fs[ "slmp.b.reserved1-1"    ] = ProtoField.uint8(   "slmp.b.reserved1-1"    ,   "reserved1-1          "  ,   base.HEX                ) -- For future expansion
	Fs[ "slmp.b.reserved1-2"    ] = ProtoField.uint8(   "slmp.b.reserved1-2"    ,   "reserved1-2          "  ,   base.HEX                ) -- For future expansion
	Fs[ "slmp.b.reserved2"      ] = ProtoField.uint16(  "slmp.b.reserved2"      ,   "reserved2            "  ,   base.HEX                ) -- For future expansion
	Fs[ "slmp.b.reserved3"      ] = ProtoField.uint8(   "slmp.b.reserved3"      ,   "reserved3            "  ,   base.HEX                ) -- For future expansion
	Fs[ "slmp.b.reserved3-1"    ] = ProtoField.uint8(   "slmp.b.reserved3-1"    ,   "reserved3-1          "  ,   base.HEX                ) -- For future expansion
	Fs[ "slmp.b.reserved3-2"    ] = ProtoField.uint8(   "slmp.b.reserved3-2"    ,   "reserved3-2          "  ,   base.HEX                ) -- For future expansion
	Fs[ "slmp.b.reserved4"      ] = ProtoField.uint8(   "slmp.b.reserved4"      ,   "reserved4            "  ,   base.HEX                ) -- For future expansion
	Fs[ "slmp.b.dstProcSubNo"   ] = ProtoField.uint8(   "slmp.b.dstProcSubNo"   ,   "dstProcSubNo         "  ,   base.HEX                ) -- Processor subnumber of request destination station
	Fs[ "slmp.b.reserved1_02"   ] = ProtoField.uint16(  "slmp.b.reserved1_02"   ,   "reserved1            "  ,   base.HEX                ) -- For future expansion
	Fs[ "slmp.b.reserved2_02"   ] = ProtoField.uint8(   "slmp.b.reserved2_02"   ,   "reserved2            "  ,   base.HEX                ) -- For future expansion
	Fs[ "slmp.b.reserved3_02"   ] = ProtoField.uint8(   "slmp.b.reserved3_02"   ,   "reserved3            "  ,   base.HEX                ) -- For future expansion


	-- (2) ASCII
	Fs[ "slmp.a.st_header"      ] = ProtoField.string(  "slmp.a.sub_header"     ,   "slmpSTHeader         "                              ) -- Frame type(ST Frame)
	Fs[ "slmp.a.mt_header"      ] = ProtoField.string(  "slmp.a.mt_header"      ,   "slmpMTHeader         "                              ) -- Frame type(MT Frame)
	Fs[ "slmp.a.emt_header"     ] = ProtoField.string(  "slmp.a.emt_header"     ,   "slmpEMTHeader        "                              ) -- Frame type(EMT Frame)
	Fs[ "slmp.a.sub_header"     ] = ProtoField.string(  "slmp.a.sub_header"     ,   "slmpSubHeader        "                              ) -- SlmpSubHeader
	Fs[ "slmp.a.sub_emt_header" ] = ProtoField.bytes(   "slmp.a.sub_emt_header" ,   "slmpSubEMTHeader     "                              ) -- SlmpSubEMTHeader
	Fs[ "slmp.a.sub1"           ] = ProtoField.string(  "slmp.a.sub1"           ,   "fType                "                              ) -- Frame type(MT Frame)[47:32]
	Fs[ "slmp.a.ftype"          ] = ProtoField.string(  "slmp.a.ftype"          ,   "fType                "                              ) -- Frame type(MT Frame)[47:32]
	Fs[ "slmp.a.serial"         ] = ProtoField.string(  "slmp.a.serial"         ,   "serialNo             "                              ) -- Serial number(MT Frame)[31:16]
	Fs[ "slmp.a.sub2"           ] = ProtoField.string(  "slmp.a.sub2"           ,   "reserved2            "                              ) -- For future expansion(MT Frame)[15:0]
	Fs[ "slmp.a.net_num"        ] = ProtoField.string(  "slmp.a.net_num"        ,   "netNo                "                              ) -- Network number of request destination station
	Fs[ "slmp.a.dst_net_num"    ] = ProtoField.string(  "slmp.a.dst_net_num"    ,   "dstNetNo             "                              ) -- Network number of request destination station
	Fs[ "slmp.a.src_net_num"    ] = ProtoField.string(  "slmp.a.src_net_num"    ,   "srcNetNo             "                              ) -- Network number of request destination station
	Fs[ "slmp.a.unit_num"       ] = ProtoField.string(  "slmp.a.unit_num"       ,   "nodeNo               "                              ) -- Station number of request destination station
	Fs[ "slmp.a.node_num"       ] = ProtoField.string(  "slmp.a.node_num"       ,   "nodeNo               "                              ) -- Station number of request destination station
	Fs[ "slmp.a.dst_node_num"   ] = ProtoField.string(  "slmp.a.dst_node_num"   ,   "dstNodeNo            "                              ) -- Station number of request destination station
	Fs[ "slmp.a.src_node_num"   ] = ProtoField.string(  "slmp.a.src_node_num"   ,   "srcNodeNo            "                              ) -- Station number of request destination station
	Fs[ "slmp.a.io_num"         ] = ProtoField.string(  "slmp.a.io_num"         ,   "dstProcNo            "                              ) -- Processor number of request destination station
	Fs[ "slmp.a.dstproc_num"    ] = ProtoField.string(  "slmp.a.dstporc_num"    ,   "dstProcNo            "                              ) -- Processor number of request destination station
	Fs[ "slmp.a.srcproc_num"    ] = ProtoField.string(  "slmp.a.srcporc_num"    ,   "srcProcNo            "                              ) -- Processor number of request destination station
	Fs[ "slmp.a.pkt_type"       ] = ProtoField.string(  "slmp.a.pkt_type"       ,   "pktType              "                              ) -- Packet type
	Fs[ "slmp.a.length"         ] = ProtoField.string(  "slmp.a.length"         ,   "dl                   "                              ) -- Request data length
	Fs[ "slmp.a.flgm"           ] = ProtoField.string(  "slmp.a.flgm"           ,   "flgm                 "                              ) -- Division information
	Fs[ "slmp.a.timer"          ] = ProtoField.string(  "slmp.a.timer"          ,   "timer                "                              ) -- Timer
	Fs[ "slmp.a.exit_code"      ] = ProtoField.string(  "slmp.a.exit_code"      ,   "endCode              "                              ) -- nd code
	Fs[ "slmp.a.cmd"            ] = ProtoField.string(  "slmp.a.cmd"            ,   "command              "                              ) -- Command
	Fs[ "slmp.a.sub_cmd"        ] = ProtoField.string(  "slmp.a.sub_cmd"        ,   "subCommand           "                              ) -- Sub-command
	Fs[ "slmp.a.data"           ] = ProtoField.string(  "slmp.a.data"           ,   "req/resData          "                              ) -- Request/Response data
	Fs[ "slmp.a.resdata"        ] = ProtoField.string(  "slmp.a.resdata"        ,   "resData              "                              ) -- Response data
	Fs[ "slmp.a.reqdata"        ] = ProtoField.string(  "slmp.a.reqdata"        ,   "reqData              "                              ) -- Request data
	Fs[ "slmp.a.errinfo"        ] = ProtoField.string(  "slmp.a.errinfo"        ,   "errInfo              "                              ) -- Error Info
	Fs[ "slmp.a.reserved1"      ] = ProtoField.string(  "slmp.a.reserved1"      ,   "reserved1            "                              ) -- For future expansion
	Fs[ "slmp.a.reserved1-1"    ] = ProtoField.string(  "slmp.a.reserved1-1"    ,   "reserved1-1          "                              ) -- For future expansion
	Fs[ "slmp.a.reserved1-2"    ] = ProtoField.string(  "slmp.a.reserved1-2"    ,   "reserved1-2          "                              ) -- For future expansion
	Fs[ "slmp.a.reserved2"      ] = ProtoField.string(  "slmp.a.reserved2"      ,   "reserved2            "                              ) -- For future expansion

	slm_proto.fields = {}
	for key,field in pairs(Fs) do
		slm_proto.fields[#slm_proto.fields + 1] = field 
	end

-- Add protocol coloring rule
slm_proto.prefs.colorize = Pref.bool("Colorize protocol", true, "Whether to colorize SLMP protocol packets")

function slm_proto.dissector(buffer,pinfo,tree)
    local subtree = tree:add(slm_proto,buffer())
    
    -- Update the protocol column with the specific protocol type if known
    local src_port = pinfo.src_port
    local dst_port = pinfo.dst_port
    local protocol_name = "SLMP"
    
    if protocol_port_names[src_port] then
        protocol_name = protocol_port_names[src_port]
    elseif protocol_port_names[dst_port] then
        protocol_name = protocol_port_names[dst_port]
    end
    
    pinfo.cols.protocol = protocol_name
    
    -- Special handling for MELSEC packets
    if src_port == MELSEC_PORT or dst_port == MELSEC_PORT then
        handle_melsec_packet(buffer, pinfo, subtree)
    else
        slmp_frame_analyze(buffer, pinfo, subtree, portNumber_check)
    end
    
    -- Apply colorization if enabled
    if slm_proto.prefs.colorize then
        apply_packet_colorization(pinfo)
    end
end

-- Handle MELSEC protocol packets (port 5562)
function handle_melsec_packet(buffer, pinfo, tree)
    if buffer:len() < 6 then
        tree:add_expert_info(expert.group.PROTOCOL, expert.severity.ERROR, "Packet too short for MELSEC")
        return
    end
    
    -- Add MELSEC header information
    local header_tree = tree:add(buffer(0, 6), "MELSEC Header")
    
    -- Extract MELSEC header fields
    local subheader = header_tree:add(buffer(0, 4), "Sub Header")
    local command_code = buffer(0, 2):le_uint()
    local command_name = get_melsec_command_name(command_code)
    local data_length = buffer(2, 2):le_uint()
    
    subheader:add(buffer(0, 2), string.format("Command Code: 0x%04x (%s)", command_code, command_name))
    subheader:add(buffer(2, 2), string.format("Data Length: %d bytes", data_length))
    
    -- Process MELSEC data based on command code
    process_melsec_command(buffer, pinfo, tree, command_code, data_length)
    
    -- Update info column with MELSEC command information
    pinfo.cols.info = string.format("MELSEC %s", command_name)
end

-- Get human-readable MELSEC command names using the MelsecCommands table if available
function get_melsec_command_name(code)
    if MelsecCommands and MelsecCommands[code] then
        return MelsecCommands[code]
    end
    
    -- Fallback for when melsec_helper.lua is not loaded
    local fallback_commands = {
        [0x0401] = "Device Read",
        [0x1401] = "Device Write",
        [0x0403] = "Device Read Random",
        [0x1402] = "Device Write Random",
        [0x0406] = "Device Read Block",
        [0x1406] = "Device Write Block",
        [0x0101] = "CPU Model Read",
        [0x0613] = "Memory Read",
        [0x1613] = "Memory Write",
        [0x0157] = "Read Module Type"
    }
    
    return fallback_commands[code] or string.format("Unknown (0x%04x)", code)
end

-- Process MELSEC commands based on command code
function process_melsec_command(buffer, pinfo, tree, command_code, data_length)
    if buffer:len() < 6 + data_length then
        tree:add_expert_info(expert.group.MALFORMED, expert.severity.ERROR, "Malformed MELSEC packet: insufficient data")
        return
    end
    
    local data_tree = tree:add(buffer(6, data_length), "MELSEC Data")
    
    -- If melsec_helper module is loaded, use its advanced parsing functions
    if parse_melsec_command then
        -- Determine if this is a request or response based on ports
        local is_request = pinfo.src_port ~= MELSEC_PORT
        parse_melsec_command(buffer(4, 2 + data_length), data_tree, is_request)
        return
    end
    
    -- Simple fallback handling for when melsec_helper.lua is not loaded
    -- Handle specific commands
    if command_code == 0x0401 then -- Device Read
        parse_melsec_device_read_basic(buffer(6, data_length), data_tree)
    elseif command_code == 0x1401 then -- Device Write
        parse_melsec_device_write_basic(buffer(6, data_length), data_tree)
    elseif command_code == 0x0157 then -- Read Module Type
        parse_melsec_module_type_basic(buffer(6, data_length), data_tree)
    else
        -- Generic data display for unknown commands
        data_tree:add(buffer(6, data_length), "Command Data")
    end
end

-- Basic fallback parsers when melsec_helper.lua is not available
function parse_melsec_device_read_basic(buffer, tree)
    if buffer:len() < 6 then return end
    
    local dev_code = buffer(0, 1):uint()
    local head_device = buffer(1, 3):le_uint()
    local device_count = buffer(4, 2):le_uint()
    
    tree:add(buffer(0, 1), string.format("Device Code: 0x%02x", dev_code))
    tree:add(buffer(1, 3), string.format("Head Device Number: %d", head_device))
    tree:add(buffer(4, 2), string.format("Device Count: %d", device_count))
end

function parse_melsec_device_write_basic(buffer, tree)
    if buffer:len() < 6 then return end
    
    local dev_code = buffer(0, 1):uint()
    local head_device = buffer(1, 3):le_uint()
    local device_count = buffer(4, 2):le_uint()
    
    tree:add(buffer(0, 1), string.format("Device Code: 0x%02x", dev_code))
    tree:add(buffer(1, 3), string.format("Head Device Number: %d", head_device))
    tree:add(buffer(4, 2), string.format("Device Count: %d", device_count))
    
    -- Display write data
    if buffer:len() >= 6 + device_count * 2 then
        local data_tree = tree:add(buffer(6, device_count * 2), "Write Data")
        for i = 0, device_count - 1 do
            data_tree:add(buffer(6 + i * 2, 2), string.format("Value[%d]: 0x%04x", 
                i, buffer(6 + i * 2, 2):le_uint()))
        end
    end
end

function parse_melsec_module_type_basic(buffer, tree)
    if buffer:len() < 20 then return end
    
    -- For Module Type Read command (0x0157)
    tree:add(buffer(0, 2), string.format("Module Type Code: 0x%04x", buffer(0, 2):le_uint()))
    
    -- Try to extract ASCII module name
    local module_name = ""
    for i=2, 17 do
        if buffer(i, 1):uint() >= 32 and buffer(i, 1):uint() < 127 then
            module_name = module_name .. string.char(buffer(i, 1):uint())
        end
    end
    tree:add(buffer(2, 16), string.format("Module Name: %s", module_name))
    
    -- Module version
    tree:add(buffer(18, 2), string.format("Module Version: %d.%d", 
        buffer(18, 1):uint(), buffer(19, 1):uint()))
end

-- Apply colorization based on packet type
function apply_packet_colorization(pinfo)
    -- Check for MELSEC packets
    if pinfo.src_port == MELSEC_PORT or pinfo.dst_port == MELSEC_PORT then
        -- Add protocol indicator to info column
        local current_info = tostring(pinfo.cols.info) or ""
        if not string.find(current_info, "MELSEC") then
            pinfo.cols.info = "[MELSEC] " .. current_info
        end
    -- Check for SLMP packets  
    elseif pinfo.src_port == SLMP_PORT or pinfo.dst_port == SLMP_PORT then
        -- Add protocol indicator to info column
        local current_info = tostring(pinfo.cols.info) or ""
        if not string.find(current_info, "SLMP") then
            pinfo.cols.info = "[SLMP] " .. current_info
        end
    end
end

-- Load "udp.port"&"tcp.port"Table
	udp_table = DissectorTable.get("udp.port")
	tcp_table = DissectorTable.get("tcp.port")

-------------------------------------------------------------------------- 
-- Port Number Setting
-------------------------------------------------------------------------- 

-- SLMP Analyze port list (UDP)
local portNo_udp_List = {
	5000,
	5005,
	5010,
	45237,
	45238,
	45239,
	61440,
	61443,
}
for i, port in ipairs(portNo_udp_List) do
    udp_table:add(port, slm_proto)
end

-- SLMP/MELSEC Analyze port list (TCP)
local portNo_tcp_List = {
	2000,       -- SLMP port
	MELSEC_PORT, -- MELSEC port
	5011,
	61442,
}
for i, port in ipairs(portNo_tcp_List) do
    tcp_table:add(port, slm_proto)
end

-- Register preference settings
slm_proto.prefs.detailed_melsec = Pref.bool("Detailed MELSEC Analysis", true, 
    "Whether to show detailed analysis for MELSEC packets")
slm_proto.prefs.detailed_slmp = Pref.bool("Detailed SLMP Analysis", true,
    "Whether to show detailed analysis for SLMP packets")

