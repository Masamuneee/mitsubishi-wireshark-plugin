-- #############################################################################
-- =============================================================================
--
-- CC-Link IE TSN Protocol lua script
-- 	Rev 03 : (2023/8/1)

--
--
-- Copyright(C) CC-Link Partner Association All Rights Reserved     
-- =============================================================================
-- #############################################################################

local CCIETSN_PRIO				= 0xC0
local CCIETSN_DETECT			= 0xC1
local CCIETSN_DETECT_ACK		= 0xC2
local CCIETSN_TRANSIENT			= 0xC3
local CCIETSN_CYCLIC_MS			= 0xC4
local CCIETSN_CYCLIC_SS			= 0xC5
local CCIETSN_TESTDATA			= 0x11
local CCIETSN_TESTDATA_ACK		= 0x12

local CCIETSN_HEADER_SZ			= 10
local CCIETSN_HEADER_PRIO_SZ	= 14
local CCIETSN_HEADER_DETECT_SZ	= 2
local CCIETSN_PDUHDR_SZ			= 5
local CCIETSN_PDUPLHDR_SZ		= 11
local CCIETSN_SDCRC_SZ			= 4
local CCIETSN_HEADER_DATA_SZ	= 6
local CCIETSN_HEADER_TEST		= 14

dofile(DATA_DIR.."/plugins/SLMP_com_Rev03.lua")	-- [SLMP_com.lua] Directory path

function bitval(num, d)
	local mask = bit.lshift(0x1, d)
	local tmp = bit.band(0x1, bit.rshift(bit.band(mask, num),d))
	return tmp
end

do
	--// Create a new dissector
	ccietsn_proto = Proto("CCIETSN","CC-Link IE TSN")

	--==========================================================================
	-- Templete
	--==========================================================================
	local L_arNFType = {
		--// CCIETSN
		[CCIETSN_PRIO]			= "Priority",
		[CCIETSN_DETECT]		= "Detection",
		[CCIETSN_DETECT_ACK]	= "DetectionAck",
		[CCIETSN_TRANSIENT]		= "AcyclicData",
		[CCIETSN_CYCLIC_MS]		= "Cyclic M / Ms",
		[CCIETSN_CYCLIC_SS]		= "Cyclic S / Ss",
		[CCIETSN_TESTDATA]		= "TestData",
		[CCIETSN_TESTDATA_ACK]	= "TestDataAck"
	}

	--// List of Protocol Version
	local L_pro_Version = {
		[0x00] = "ccieField & ControlSingleMaster",
		[0x01] = "ccieField & ControlMultiMaster",
		[0x02] = "ccieTsn",
		[0x03] = "ccieTsn & FieldSingleMaster",
		[0x04] = "reserved"
	}

	--// List of Protocol Type
	local L_pro_Type = {
		[0x00] = "ccieControl",
		[0x01] = "ccieField",
		[0x02] = "reserved",
		[0x03] = "ccieTsn",
		[0x04] = "reserved"
	}
	
	--==========================================================================
	-- Frame Field
	--==========================================================================
	--// IE Header
	local arNFType			= ProtoField.uint8("ccietsn.header.frameType",			"frameType       ", base.HEX, L_arNFType)
	local dataType 			= ProtoField.uint8("ccietsn.header.dataType",			"dataType        ", base.HEX)
	local protocolVerType	= ProtoField.uint8("ccietsn.header.protocolVerType",	"protocolVerType ", base.HEX)
	local pro_Version		= ProtoField.uint8("ccietsn.header.protocolVerType.protocolVer",		"protocolVer     ", nil, L_pro_Version, 0xF0)
	local pro_Type			= ProtoField.uint8("ccietsn.header.protocolVerType.protocolType", 		"protocolType    ", nil, L_pro_Type, 0x0F)
	local srcNodeNumber		= ProtoField.uint16("ccietsn.header.srcNodeNumber",	"srcNodeNumber   ", base.HEX)
	local persPriority		= ProtoField.uint24("ccietsn.header.persPriority",		"persPriority    ", base.HEX)
	local hec				= ProtoField.uint32("ccietsn.header.hec",				"hec             ", base.HEX)

	--// Register Frame Field
	--[memo] Up to 60 can be registered
	ccietsn_proto.fields = {dataType,srcNodeNumber,
						protocolVerType,pro_Version,pro_Type,
						hec,persPriority,
						arNFType
						}

	--==========================================================================
	-- main
	--==========================================================================
	--// The dissector function
	function ccietsn_proto.dissector(buffer,pinfo,tree)
		local tmp_FType = buffer(0,1):uint()

		if (L_arNFType[tmp_FType]) then
			--// CCIETSN
			local subtree
			local ftype = buffer(0,1):uint()
			if (ftype == CCIETSN_CYCLIC_MS or ftype == CCIETSN_CYCLIC_SS) then
				subtree = tree:add(buffer(0, CCIETSN_HEADER_SZ),			"CC-Link IE TSN [cyclicMsSsHeader]")
			elseif (ftype == CCIETSN_PRIO) then
				subtree = tree:add(buffer(0, CCIETSN_HEADER_PRIO_SZ),		"CC-Link IE TSN [acyclicPriorityHeader]")
			elseif (ftype == CCIETSN_DETECT or ftype == CCIETSN_DETECT_ACK) then
				subtree = tree:add(buffer(0, CCIETSN_HEADER_DETECT_SZ),		"CC-Link IE TSN [acyclicDetectionHeader]")
			elseif (ftype == CCIETSN_TRANSIENT) then
				subtree = tree:add(buffer(0, CCIETSN_HEADER_DATA_SZ),		"CC-Link IE TSN [acyclicDataHeader]")
			elseif (ftype == CCIETSN_TESTDATA or CCIETSN_TESTDATA_ACK) then
				subtree = tree:add(buffer(0, CCIETSN_HEADER_TEST),			"CC-Link IE TSN [acyclicTestDataHeader]")
			end


			--============================================================
			--CC-Link IE TSN Header
			--============================================================
			--// Disp CC-Link IE TSN Header
			subtree:add(arNFType, buffer(0,1))

			--// Cyclic Ms or M or Ss or S
			if (ftype == CCIETSN_CYCLIC_MS or ftype == CCIETSN_CYCLIC_SS) then

				local cnum_raw = buffer(1,1):uint()
				local cnum = bit.band(cnum_raw, 0x7F)
				local cignr = bitval(cnum_raw, 7)
				local str_cignr =  {
					[0] = "enable" ,
					[1] = "disable" }
				local subsubtree = subtree:add(buffer(1,1),
					string.format("cyclicNo        : %d", cnum))
				subsubtree:add(buffer(1,1), string.format(".%d%d%d %d%d%d%d = identifiedCycleNo : 0x%02x",
					bitval(cnum, 6), bitval(cnum, 5), bitval(cnum, 4), bitval(cnum, 3),
					bitval(cnum, 2), bitval(cnum, 1), bitval(cnum, 0), cnum))
				subsubtree:add(buffer(1,1), string.format("%d... .... = cyclicNoCheckFlag : %s (0x%x)",
					cignr,str_cignr[cignr],cignr))

				if (ftype == CCIETSN_CYCLIC_MS) then
					subtree:add(buffer(2,2),
						string.format("sa              : xx.xx.%d.%d (0x%04x)",
							buffer(2,1):uint(), buffer(3,1):uint(), buffer(2,2):uint()))
				elseif (ftype == CCIETSN_CYCLIC_SS) then
					subtree:add(buffer(2,2),
						string.format("da              : xx.xx.%d.%d (0x%04x)",
							buffer(2,1):uint(), buffer(3,1):uint(), buffer(2,2):uint()))
				end
				subtree:add(buffer(4,2), string.format("reserved        : 0x%04x",
					buffer(4,2):uint()))

					subtree:add(hec, buffer(6,4))
			elseif (ftype == CCIETSN_PRIO) then
				subtree:add(buffer(1,9), string.format("reserved        : 0x%02x%08x%08x",
					buffer(1,1):uint(), buffer(2,4):uint(), buffer(6,4):uint()))
				subtree:add(hec, buffer(10,4))
			elseif (ftype == CCIETSN_DETECT or ftype == CCIETSN_DETECT_ACK) then
				subtree:add(buffer(1,1), string.format("reserved        : 0x%02x",
					buffer(1,1):uint()))

			elseif (ftype == CCIETSN_TRANSIENT) then
				subtree:add(buffer(1,1), string.format("reserved        : 0x%02x", buffer(1,1):uint()))
				subtree:add(buffer(2,2), string.format("da              : xx.xx.%d.%d (0x%04x)",	buffer(2,1):uint(), buffer(3,1):uint(), buffer(2,2):uint()))
				subtree:add(buffer(4,2), string.format("reserved1       : 0x%04x", buffer(4,2):uint()))

			elseif (ftype == CCIETSN_TESTDATA or ftype == CCIETSN_TESTDATA_ACK) then
				subtree:add(dataType, buffer(1,1))
				subtree:add(persPriority, buffer(2,3))
				subtree:add(buffer(5,1), string.format("nodeType        : 0x%02x", buffer(5,1):uint()))
				subtree:add(srcNodeNumber, buffer(6,2))
				local subtree1 = subtree:add(protocolVerType, buffer(8,1))
					subtree1:add(pro_Version,	buffer(8,1))
					subtree1:add(pro_Type,		buffer(8,1))
				subtree:add(buffer(9,1), string.format("reserved        : 0x%02x", buffer(9,1):uint()))
				subtree:add(hec, buffer(10,4))
			end

			--============================================================
			-- each subpayload
			--============================================================

			--// CCIETSN_CYCLIC Ms or M or Ss or S
			if (ftype == CCIETSN_CYCLIC_MS or ftype == CCIETSN_CYCLIC_SS) then
				Disp_ccietsn_cyc(buffer, pinfo, tree, ftype)
			elseif (ftype == CCIETSN_PRIO) then
				Disp_ccietsn_prio(buffer, pinfo, tree, ftype)
			elseif (ftype == CCIETSN_DETECT) then
				Disp_ccietsn_detect(buffer, pinfo, tree, ftype)
			elseif (ftype == CCIETSN_DETECT_ACK) then
				Disp_ccietsn_detect_ack(buffer, pinfo, tree, ftype)
			elseif (ftype == CCIETSN_TRANSIENT) then
				local acyclicDataSize = buffer:len() - CCIETSN_HEADER_DATA_SZ
				local acyclicDataBuffer = buffer(CCIETSN_HEADER_DATA_SZ, acyclicDataSize)
				local acyclicDataSubtree = tree:add(acyclicDataBuffer(),"CC-Link IE TSN [data]")
				acyclicDataSubtree:add(acyclicDataBuffer(),"data : " ..acyclicDataBuffer())
				local slmpSubtree = tree:add(acyclicDataBuffer(),"")
				slmp_frame_analyze(acyclicDataBuffer(),pinfo,slmpSubtree,false)
			elseif (ftype == CCIETSN_TESTDATA) then
				Disp_TestData(buffer(14,32):tvb(), pinfo, tree)
			elseif (ftype == CCIETSN_TESTDATA_ACK) then
				Disp_TestDataAck(buffer(14,32):tvb(), pinfo, tree)
			end
		end

		--==========================================================================
		-- Protocol Information
		--==========================================================================
		--// Set Protocol Information
		pinfo.cols.protocol = "CCIETSN"
		pinfo.cols.info = ""
		local tmp_str
		if (L_arNFType[tmp_FType]) then
			tmp_str = L_arNFType[tmp_FType]
			pinfo.cols.info:append(tmp_str)
		end
		
	end
	
	local etherframe = DissectorTable.get("ethertype")
	etherframe:add(0x890F,ccietsn_proto)
	
end

--==========================================================================
-- Disp Functions
--==========================================================================
function Disp_TestData(buffer, pinfo, tree)
	local subtree = tree:add(buffer(0, 6+1+1+1+1+2+4+4+8+4),
		"CC-Link IE TSN [acyclicTestDataData]")
	local cnum_raw1 = bit.band(buffer(8,1):uint(),0x01)
	local cnum_raw2 = bit.rshift(bit.band(buffer(8,1):uint(),0x02),1)
	local cnum_raw3 = bit.rshift(bit.band(buffer(8,1):uint(),0x04),2)

	local str_stack = {	[0] = "station",		[1] = "peripheral"	}
	local str_phase = {	[0] = "initial",		[1] = "operation"	}
	local str_ipTyp = {	[0] = "ipV4",			[1] = "ivV6"		}

	subtree:add( buffer(0,6),	string.format("macAddr      : %02x:%02x:%02x:%02x:%02x:%02x",
				 buffer(0,1):uint(), buffer(1,1):uint(), buffer(2,1):uint(),
				 buffer(3,1):uint(), buffer(4,1):uint(), buffer(5,1):uint()))
	subtree:add( buffer(6,1),	string.format("srcPort      : 0x%02x", buffer(6,1):uint()))
	subtree:add( buffer(7,1), 	string.format("reserved1    : 0x%02x", buffer(7,1):uint()))
	local subtree1 = subtree:add( buffer(8,1),	string.format("sendInfo     : 0x%02x", buffer(8,1):uint()))
	subtree1:add(buffer(8,1),	string.format(".... ...%d = sourceNodeType    : %s (0x%x)",	cnum_raw1, str_stack[cnum_raw1], cnum_raw1))
	subtree1:add(buffer(8,1),	string.format(".... ..%d. = commPhase         : %s (0x%x)",	cnum_raw2, str_phase[cnum_raw2], cnum_raw2))
	subtree1:add(buffer(8,1),	string.format(".... .%d.. = supportedIpAdress : %s (0x%x)",	cnum_raw3, str_ipTyp[cnum_raw3], cnum_raw3))
	subtree1:add(buffer(8,1),	string.format("%d%d%d%d %d... = reserved          : 0x%02x",
			bit.rshift(bit.band(buffer(8,1):uint(),0x80),7),
			bit.rshift(bit.band(buffer(8,1):uint(),0x40),6),
			bit.rshift(bit.band(buffer(8,1):uint(),0x20),5),
			bit.rshift(bit.band(buffer(8,1):uint(),0x10),4),
			bit.rshift(bit.band(buffer(8,1):uint(),0x08),3),
			bit.band(buffer(8,1):uint(),0xF8)))

	if(cnum_raw3 == 0) then
		subtree:add( buffer(9,1),	string.format("reserved2    : 0x%02x", buffer(9,1):uint()))
		subtree:add( buffer(10,2),	string.format("hopCount     : 0x%04x", buffer(10,2):uint()))
		subtree:add( buffer(12,4),	string.format("ipv4Address  : %02x:%02x:%02x:%02x", buffer(12,1):uint(),buffer(13,1):uint(),buffer(14,1):uint(),buffer(15,1):uint()))
		subtree:add( buffer(16,4),	string.format("ipv4Subnet   : %02x:%02x:%02x:%02x", buffer(16,1):uint(),buffer(17,1):uint(),buffer(18,1):uint(),buffer(19,1):uint()))
		subtree:add( buffer(20,8),	string.format("reserved3    : 0x%08x%08x", buffer(20,4):uint(),buffer(24,4):uint()))
	else
		subtree:add( buffer(9,1),	string.format("ipv6Subnet   : 0x%02x", buffer(9,1):uint()))
		subtree:add( buffer(10,2),	string.format("hopCount     : 0x%04x", buffer(10,2):uint()))
		subtree:add( buffer(12,16),	string.format("ipv6Address  : %08x %08x %08x %08x", buffer(12,4):uint(),buffer(16,4):uint(),buffer(20,4):uint(),buffer(24,4):uint()))
	end
	subtree:add(buffer(28,4), 	string.format("dcs          : 0x%08x", buffer(28,4):uint()))
end

function Disp_TestDataAck(buffer, pinfo, tree)
	local subtree = tree:add(buffer(0, 6+1+1+1+1+2+4+4+8+4),
		"CC-Link IE TSN [acyclicTestDataAckData]")
--	local subtree = tree:add("CC-Link IE TSN [acyclicTestDataAckData]")
	subtree:add( buffer(0,6), string.format("macAddr       : %02x:%02x:%02x:%02x:%02x:%02x",
				 buffer(0,1):uint(), buffer(1,1):uint(), buffer(2,1):uint(),
				 buffer(3,1):uint(), buffer(4,1):uint(), buffer(5,1):uint()))
	subtree:add( buffer(6,1), string.format("srcPort       : 0x%02x", buffer(6,1):uint()))
	subtree:add( buffer(7,1), string.format("rcvPort       : 0x%02x", buffer(7,1):uint()))
	subtree:add( buffer(8,1), string.format("reserved1     : 0x%02x", buffer(8,1):uint()))
	subtree:add( buffer(9,1), string.format("myPorts       : 0x%02x", buffer(9,1):uint()))
	local subtree0 = subtree:add(buffer(10,2), string.format("tokenKeepTime : %d[us]", bit.band(buffer(10,2):uint(),0x7FFF)))
		subtree0:add(buffer(10,2), string.format(".%d%d%d %d%d%d%d %d%d%d%d %d%d%d%d = tokenKeepTime : %d[us]", 
			bit.rshift(bit.band(buffer(10,2):uint(),0x4000),14),
			bit.rshift(bit.band(buffer(10,2):uint(),0x2000),13),
			bit.rshift(bit.band(buffer(10,2):uint(),0x1000),12),
			bit.rshift(bit.band(buffer(10,2):uint(),0x0800),11),
			bit.rshift(bit.band(buffer(10,2):uint(),0x0400),10),
			bit.rshift(bit.band(buffer(10,2):uint(),0x0200),9),
			bit.rshift(bit.band(buffer(10,2):uint(),0x0100),8),
			bit.rshift(bit.band(buffer(10,2):uint(),0x0040),7),
			bit.rshift(bit.band(buffer(10,2):uint(),0x0040),6),
			bit.rshift(bit.band(buffer(10,2):uint(),0x0020),5),
			bit.rshift(bit.band(buffer(10,2):uint(),0x0010),4),
			bit.rshift(bit.band(buffer(10,2):uint(),0x0008),3),
			bit.rshift(bit.band(buffer(10,2):uint(),0x0004),2),
			bit.rshift(bit.band(buffer(10,2):uint(),0x0002),1),
			bit.rshift(bit.band(buffer(10,2):uint(),0x0001),0),
			bit.band(buffer(10,2):uint(),0x7FFF)))

		subtree0:add(buffer(10,2),	string.format("%d... .... .... .... = reserved      : %d",
			bit.rshift(bit.band(buffer(10,2):uint(),0x8000),15),
			bit.band(buffer(10,2):uint(),0x8000)))

	subtree:add(buffer(12,4), string.format("reserved2     : 0x%08x", buffer(12,4):uint()))

	local str_myConnectStatus = {	[0] = "  linkDown  ",
									[1] = "   linkUp   "	}
	local val_port1  = bit.rshift(bit.band(buffer(16,1):uint(),0x01),0)
	local val_port2  = bit.rshift(bit.band(buffer(16,1):uint(),0x10),4)
	local val_port3  = bit.rshift(bit.band(buffer(17,1):uint(),0x01),0)
	local val_port4  = bit.rshift(bit.band(buffer(17,1):uint(),0x10),4)
	local val_port5  = bit.rshift(bit.band(buffer(18,1):uint(),0x01),0)
	local val_port6  = bit.rshift(bit.band(buffer(18,1):uint(),0x10),4)
	local val_port7  = bit.rshift(bit.band(buffer(19,1):uint(),0x01),0)
	local val_port8  = bit.rshift(bit.band(buffer(19,1):uint(),0x10),4)
	local val_port9  = bit.rshift(bit.band(buffer(20,1):uint(),0x01),0)
	local val_port10 = bit.rshift(bit.band(buffer(20,1):uint(),0x10),4)
	local val_port11 = bit.rshift(bit.band(buffer(21,1):uint(),0x01),0)
	local val_port12 = bit.rshift(bit.band(buffer(21,1):uint(),0x10),4)
	local val_port13 = bit.rshift(bit.band(buffer(22,1):uint(),0x01),0)
	local val_port14 = bit.rshift(bit.band(buffer(22,1):uint(),0x10),4)
	local val_port15 = bit.rshift(bit.band(buffer(23,1):uint(),0x01),0)
	local val_port16 = bit.rshift(bit.band(buffer(23,1):uint(),0x10),4)
	local val_port17 = bit.rshift(bit.band(buffer(24,1):uint(),0x01),0)
	local val_port18 = bit.rshift(bit.band(buffer(24,1):uint(),0x10),4)
	local val_port19 = bit.rshift(bit.band(buffer(25,1):uint(),0x01),0)
	local val_port20 = bit.rshift(bit.band(buffer(25,1):uint(),0x10),4)
	local val_port21 = bit.rshift(bit.band(buffer(26,1):uint(),0x01),0)
	local val_port22 = bit.rshift(bit.band(buffer(26,1):uint(),0x10),4)
	local val_port23 = bit.rshift(bit.band(buffer(27,1):uint(),0x01),0)
	local val_port24 = bit.rshift(bit.band(buffer(27,1):uint(),0x10),4)

	local subtree1 = subtree:add("myConnectStatus")
		subtree1:add(buffer(16,1), string.format("port2port1   : %s:%s (0x%02x)", str_myConnectStatus[val_port2], str_myConnectStatus[val_port1], buffer(16,1):uint()))
		subtree1:add(buffer(17,1), string.format("port4port3   : %s:%s (0x%02x)", str_myConnectStatus[val_port4], str_myConnectStatus[val_port3], buffer(17,1):uint()))
		subtree1:add(buffer(18,1), string.format("port6port5   : %s:%s (0x%02x)", str_myConnectStatus[val_port6], str_myConnectStatus[val_port5], buffer(18,1):uint()))
		subtree1:add(buffer(19,1), string.format("port8port7   : %s:%s (0x%02x)", str_myConnectStatus[val_port8], str_myConnectStatus[val_port7], buffer(19,1):uint()))
		subtree1:add(buffer(20,1), string.format("port10port9  : %s:%s (0x%02x)", str_myConnectStatus[val_port10], str_myConnectStatus[val_port9], buffer(20,1):uint()))
		subtree1:add(buffer(21,1), string.format("port12port11 : %s:%s (0x%02x)", str_myConnectStatus[val_port12], str_myConnectStatus[val_port11], buffer(21,1):uint()))
		subtree1:add(buffer(22,1), string.format("port14port13 : %s:%s (0x%02x)", str_myConnectStatus[val_port14], str_myConnectStatus[val_port13], buffer(22,1):uint()))
		subtree1:add(buffer(23,1), string.format("port16port15 : %s:%s (0x%02x)", str_myConnectStatus[val_port16], str_myConnectStatus[val_port15], buffer(23,1):uint()))
		subtree1:add(buffer(24,1), string.format("port18port17 : %s:%s (0x%02x)", str_myConnectStatus[val_port18], str_myConnectStatus[val_port17], buffer(24,1):uint()))
		subtree1:add(buffer(25,1), string.format("port20port19 : %s:%s (0x%02x)", str_myConnectStatus[val_port20], str_myConnectStatus[val_port19], buffer(25,1):uint()))
		subtree1:add(buffer(26,1), string.format("port22port21 : %s:%s (0x%02x)", str_myConnectStatus[val_port22], str_myConnectStatus[val_port21], buffer(26,1):uint()))
		subtree1:add(buffer(27,1), string.format("port24port23 : %s:%s (0x%02x)", str_myConnectStatus[val_port24], str_myConnectStatus[val_port23], buffer(27,1):uint()))
	subtree:add(buffer(28,4), string.format("dcs           : 0x%08x", buffer(28,4):uint()))
end


--// CCIETSN
function Disp_ccietsn_cyc_PDU_Header(buffer, pinfo, tree, finfo)
	local offset = finfo.offset
	local subtree = tree:add(buffer(offset, CCIETSN_PDUHDR_SZ),
		"CC-Link IE TSN [subPayloadHeader]")
	local tmp_str
	if (finfo.ftype == CCIETSN_CYCLIC_MS) then
		tmp_str = "da"
	else
		tmp_str = "sa"
	end
	subtree:add(buffer(offset,2),
		string.format("%s                : xx.xx.%d.%d (0x%04x)", tmp_str,
			buffer(offset,1):uint(),buffer(offset+1,1):uint(),
			buffer(offset,2):uint()))
	offset = offset + 2

	local str_ctrl_flg = {
		[0] = "Cyclic transmission disabled",
		[1] = "Cyclic transmission enabled"
	}
	local str_tim_err = {
		[0] = "Communication timing error not detected",
		[1] = "Communication timing error detected"
	}

	local len_raw = finfo.len_raw
	local len = finfo.len
	local ctrl_flg = bitval(len_raw, 15)
	local tim_err = bitval(len_raw, 14)
	local len_reserved = bit.rshift(bit.band(len_raw,0x3800),11)

	local subsubtree = subtree:add(buffer(offset,2),
		string.format("commInfo          : %d -- %s -- %s",
			len, str_ctrl_flg[ctrl_flg], str_tim_err[tim_err]))
	subsubtree:add(buffer(offset,2),
		string.format(".... .%d%d%d %d%d%d%d %d%d%d%d = length      : %d (0x%03x)",
			bitval(len,10), bitval(len,9), bitval(len,8),
			bitval(len,7), bitval(len,6), bitval(len,5), bitval(len,4),
			bitval(len,3), bitval(len,2), bitval(len,1), bitval(len,0),
			len, len))
	subsubtree:add(buffer(offset,2),
		string.format("..%d%d %d... .... .... = reserved    : 0x%x",
			bitval(len_raw,12), bitval(len_raw,11), bitval(len_raw,10),
			len_reserved))
	subsubtree:add(buffer(offset,2),
		string.format(".%d.. .... .... .... = timingErr   : %s (0x%x)",
			tim_err, str_tim_err[tim_err], tim_err))
	subsubtree:add(buffer(offset,2),
		string.format("%d... .... .... .... = controlFlag : %s (0x%x)",
			ctrl_flg, str_ctrl_flg[ctrl_flg], ctrl_flg))
	offset = offset + 2
	local str_trans_req = {
		[0] = "requested",
		[1] = "notRequested",
	}
	local str_trans_timing = {
		[0] = "notPermitted",
		[1] = "permitted"
	}

	local txasync_raw = buffer(offset,1):uint()
	local tx_offset = bit.band(0x7F, txasync_raw)
	local trans_req = bitval(txasync_raw, 7)
	local trans_reqval = bit.band(0x80, txasync_raw)
	local tx_allow
	if tx_offset > 0 then tx_allow = 1 else tx_allow = 0 end
	local subsubtree2 = subtree:add(buffer(offset,1),
		string.format("txAsynInfo        : 0x%x",
		txasync_raw))
	subsubtree2:add(buffer(offset,1),
		string.format(".%d%d%d %d%d%d%d = transientPermission : %d [%s] (0x%02x)",
			bitval(txasync_raw,6),
			bitval(txasync_raw,5),
			bitval(txasync_raw,4),
			bitval(txasync_raw,3),
			bitval(txasync_raw,2),
			bitval(txasync_raw,1),
			bitval(txasync_raw,0),
			tx_offset,
			str_trans_timing[tx_allow], tx_offset))
	subsubtree2:add(buffer(offset,1),
		string.format("%d... .... = transientRequest    : %s (0x%x)",
			trans_req, str_trans_req[trans_req], trans_req))
	offset = offset + 1

	finfo.offset = offset
	return finfo
end

function Disp_ccietsn_cyc_PDU_Payload(buffer, pinfo, tree, finfo)
	local offset = finfo.offset
	local size = finfo.len + CCIETSN_PDUPLHDR_SZ
	if (finfo.ftype == CCIETSN_CYCLIC_SS) then
		size = size + CCIETSN_SDCRC_SZ
	end
	local subtree = tree:add(buffer(offset, size),
		"CC-Link IE TSN [subPayloadData]")
	local seq_raw = buffer(offset,2):uint()
	local seq = bit.band(0x7fff, seq_raw)
	local seq_end = bitval(seq_raw, 15)
	local str_seq_end = {
		[0] = "inProcess",
		[1] = "final"
	}
	local subsubtree = subtree:add(buffer(offset,2),
		string.format("seqNo             : %d ", seq))
	subsubtree:add(buffer(offset,2),
		string.format(".%d%d%d %d%d%d%d %d%d%d%d %d%d%d%d = sequenceNo    : 0x%04x",
			bitval(seq,14), bitval(seq,13), bitval(seq,12),
			bitval(seq,11), bitval(seq,10), bitval(seq,9), bitval(seq,8),
			bitval(seq,7), bitval(seq,6), bitval(seq,5), bitval(seq,4),
			bitval(seq,3), bitval(seq,2), bitval(seq,1), bitval(seq,0),
			seq))
	subsubtree:add(buffer(offset,2),
		string.format("%d... .... .... .... = frameDivision : %s (0x%x)",
			seq_end, str_seq_end[seq_end], seq_end))
	offset = offset + 2
	--// Diag F/W
	local diag_fw_raw = buffer(offset,1):uint()

	local diag_app_wrk = bitval(diag_fw_raw, 0)
	local diag_app_err = bitval(diag_fw_raw, 1)
	local diag_net_err = bitval(diag_fw_raw, 2)
	local diag_mul_cyc = bitval(diag_fw_raw, 3)
	local diag_cyc_con = bitval(diag_fw_raw, 4)
	local diag_reservd = bitval(diag_fw_raw, 5)
	local diag_discnct = bitval(diag_fw_raw, 6)
	local diag_wdc     = bitval(diag_fw_raw, 7)
	local str_STAT_10 =		{ [0] = "operating",	[1] = "stopping"	}
	local str_STAT_11 = 	{ [0] = "noError",		[1] = "error"		}
	local str_STAT_12 = 	{ [0] = "noError",		[1] = "error"		}
	local str_STAT_13 = 	{ [0] = "noInstruction",[1] = "instructed"	}
	local str_STAT_14 = 	{ [0] = "valid",		[1] = "invalid"		}
	local str_STAT_15 = 	{ [0] = "noInstruction",[1] = "instructed"	}
	local str_STAT_16 = 	{ [0] = "noError",		[1] = "error"		}
	local str_STAT_17 = 	{ [0] = "noError",		[1] = "error"		}

	local subsubtree2 = 
	subtree:add(buffer(offset,1),		string.format("diagnosisData F/W : 0x%02x", diag_fw_raw))
	subsubtree2:add(buffer(offset,1),	string.format(".... ...%d = applicationStatus     : %s (0x%x)",		diag_app_wrk, str_STAT_10[diag_app_wrk], diag_app_wrk))
	subsubtree2:add(buffer(offset,1),	string.format(".... ..%d. = applicationErrorStatus: %s (0x%x)",		diag_app_err, str_STAT_11[diag_app_err], diag_app_err))
	subsubtree2:add(buffer(offset,1),	string.format(".... .%d.. = commErrorStatus       : %s (0x%x)",		diag_net_err, str_STAT_12[diag_net_err], diag_net_err))
	subsubtree2:add(buffer(offset,1),	string.format(".... %d... = cyclicDataInvalidInst : %s (0x%x)",		diag_mul_cyc, str_STAT_13[diag_mul_cyc], diag_mul_cyc))
	subsubtree2:add(buffer(offset,1),	string.format("...%d .... = cyclicDataStatus      : %s (0x%x)",		diag_cyc_con, str_STAT_14[diag_cyc_con], diag_cyc_con))
	subsubtree2:add(buffer(offset,1),	string.format("..%d. .... = reservedStationInst   : %s (0x%x)",		diag_reservd, str_STAT_15[diag_reservd], diag_reservd))
	subsubtree2:add(buffer(offset,1),	string.format(".%d.. .... = disconnectErrorStatus : %s (0x%x)",		diag_discnct, str_STAT_16[diag_discnct], diag_discnct))
	subsubtree2:add(buffer(offset,1),	string.format("%d... .... = wdtErrorStatus        : %s (0x%x)",		diag_wdc,     str_STAT_17[diag_wdc],     diag_wdc))
	offset = offset + 1

	--// diag H/W
	local diag_hw_raw = buffer(offset,3):uint()
	local diag_emg = bitval(diag_hw_raw, 0)
	local diag_gof = bitval(diag_hw_raw, 1)
	local diag_alm = bitval(diag_hw_raw, 2)
	local diag_rsv = bitval(diag_hw_raw, 3)
	local diag_gof_grp = bit.rshift(bit.band(diag_hw_raw, 0xf0),4)
	local diag_emg_grp = bit.rshift(bit.band(diag_hw_raw, 0xffff00),8)

	local str_EMG = { [0] = "noEMGstop",	[1] = "inEMGstop"	}
	local str_GOF = { [0] = "notRequested",	[1] = "requested"	}
	local str_ALM = { [0] = "noAlarm",		[1] = "alarmed"		}

	local subsubtree3 = 
	subtree:add(buffer(offset,3),		string.format("diagnosisData H/W : 0x%06x", diag_hw_raw))
	subsubtree3:add(buffer(offset,3),	string.format(".... .... .... .... .... ...%d = emgStopStatus  : %s (0x%x)",	diag_emg, str_EMG[diag_emg], diag_emg))
	subsubtree3:add(buffer(offset,3),	string.format(".... .... .... .... .... ..%d. = gateoffRequest : %s (0x%x)",	diag_gof, str_GOF[diag_gof], diag_gof))
	subsubtree3:add(buffer(offset,3),	string.format(".... .... .... .... .... .%d.. = alamStatus     : %s (0x%x)",	diag_alm, str_ALM[diag_alm], diag_alm))
	subsubtree3:add(buffer(offset,3),	string.format(".... .... .... .... .... %d... = reserved       : 0x%x",		diag_rsv, 					 diag_rsv))
	subsubtree3:add(buffer(offset,3),	string.format(".... .... .... .... %d%d%d%d .... = gofGroupNo     : %d (0x%x)",
			bitval(diag_hw_raw, 7), bitval(diag_hw_raw, 6),
			bitval(diag_hw_raw, 5), bitval(diag_hw_raw, 4),
			diag_gof_grp, diag_gof_grp))
	subsubtree3:add(buffer(offset,3),	string.format("%d%d%d%d %d%d%d%d %d%d%d%d %d%d%d%d .... .... = emgGroupNo     : %d (0x%04x)",
			bitval(diag_hw_raw, 23), bitval(diag_hw_raw, 22),
			bitval(diag_hw_raw, 21), bitval(diag_hw_raw, 20),
			bitval(diag_hw_raw, 19), bitval(diag_hw_raw, 18),
			bitval(diag_hw_raw, 17), bitval(diag_hw_raw, 16),
			bitval(diag_hw_raw, 15), bitval(diag_hw_raw, 14),
			bitval(diag_hw_raw, 13), bitval(diag_hw_raw, 12),
			bitval(diag_hw_raw, 11), bitval(diag_hw_raw, 10),
			bitval(diag_hw_raw, 9), bitval(diag_hw_raw, 8),
			diag_emg_grp, diag_emg_grp))
	offset = offset + 3

	subtree:add(buffer(offset,1),
		string.format("reserved1         : 0x%02x", buffer(offset,1):uint()))
	offset = offset + 1

	--// memoryAddress
	subtree:add(buffer(offset,4),
		string.format("memoryAddress     : 0x%08x", buffer(offset,4):uint()))
	offset = offset + 4
	--// applicationData
	subtree:add(buffer(offset,finfo.len), 
		string.format("applicationData   : %s", buffer(offset,finfo.len)))
	offset = offset + finfo.len

	if (finfo.ftype == CCIETSN_CYCLIC_SS) then
		subtree:add(buffer(offset,4),
			string.format("sdCRC             : 0x%08x", buffer(offset,4):uint()))
		offset = offset + 4
	end

	finfo.offset = offset
	return finfo
end

function Disp_ccietsn_cyc(buffer, pinfo, tree, ftype)
	local cnt = 0
	local finfo = { offset, len , len_raw, ftype }
	finfo.offset = CCIETSN_HEADER_SZ
	finfo.len = 0
	finfo.len_raw = 0
	finfo.ftype = ftype
	local tmp_EOS = buffer(finfo.offset,2):uint()
	while tmp_EOS ~= 0 do
		finfo.len_raw = buffer((finfo.offset)+2,2):uint()
		finfo.len = bit.band(finfo.len_raw, 0x07ff)
		local size = finfo.len + CCIETSN_PDUHDR_SZ + CCIETSN_PDUPLHDR_SZ
		if (finfo.ftype == CCIETSN_CYCLIC_SS) then
			size = size + CCIETSN_SDCRC_SZ
		end
		local subtree = tree:add(buffer(finfo.offset, size),
			"CC-Link IE TSN [ PDU", cnt, "]")

		finfo = Disp_ccietsn_cyc_PDU_Header(buffer, pinfo, subtree, finfo)
		finfo = Disp_ccietsn_cyc_PDU_Payload(buffer, pinfo, subtree, finfo)
		cnt = cnt + 1
		tmp_EOS = buffer(finfo.offset,2):uint()
	end
	tree:add(buffer(finfo.offset,2), string.format("eos: 0x%04x",
		buffer(finfo.offset,2):uint()))
end

function Disp_ccietsn_prio(buffer, pinfo, tree, ftype)
	local offset = CCIETSN_HEADER_PRIO_SZ
	local subtree = tree:add(buffer(offset, 6+1+1+6+2+1+11+4),
		"CC-Link IE TSN [acyclicPriorityData ]")

	subtree:add(buffer(offset,6), string.format("srcMAC        : %02x:%02x:%02x:%02x:%02x:%02x",
		buffer(offset,1):uint(), buffer(offset+1,1):uint(), buffer(offset+2,1):uint(),
		buffer(offset+3,1):uint(), buffer(offset+4,1):uint(), buffer(offset+5,1):uint()))
	offset = offset + 6

	subtree:add(buffer(offset,1), string.format("mngPriority   : 0x%02x", buffer(offset,1):uint()))
	offset = offset + 1

	subtree:add(buffer(offset,1), string.format("reserved1     : 0x%02x", buffer(offset,1):uint()))
	offset = offset + 1

	subtree:add(buffer(offset,6), string.format("mngMAC        : %02x:%02x:%02x:%02x:%02x:%02x",
		buffer(offset,1):uint(), buffer(offset+1,1):uint(), buffer(offset+2,1):uint(),
		buffer(offset+3,1):uint(), buffer(offset+4,1):uint(), buffer(offset+5,1):uint()))
	offset = offset + 6

	subtree:add(buffer(offset,2), string.format("hopCount      : 0x%04x", buffer(offset,2):uint()))
	offset = offset + 2

	local kind_flag_raw = buffer(offset,1):uint()
	local req_ack = bitval(kind_flag_raw, 0)
	local phase = bitval(kind_flag_raw, 1)
	local master = bitval(kind_flag_raw, 2)
	local kf_reserved = bit.rshift(bit.band(kind_flag_raw,0xf8),3)

	local str_REQ_ACK = {
		[0] = "requestType",
		[1] = "ackType"
	}
	local str_PHASE = {
		[0] = "initial",
		[1] = "operation"
	}
	local str_MASTER = {
		[0] = "single",
		[1] = "notSingle"
	}

	local subsubtree = subtree:add(buffer(offset,1), string.format("kindFlag      : 0x%02x", buffer(offset,1):uint()))

	subsubtree:add(buffer(offset,1),string.format(".... ...%d = frameType   : %s (0x%x)",req_ack, str_REQ_ACK[req_ack], req_ack))
	subsubtree:add(buffer(offset,1),string.format(".... ..%d. = commPhase   : %s (0x%x)",phase, str_PHASE[phase], phase))
	subsubtree:add(buffer(offset,1),string.format(".... .%d.. = masterType  : %s (0x%x)",master, str_MASTER[master], master))
	subsubtree:add(buffer(offset,1),string.format("%d%d%d%d %d... = reserved    : 0x%x",	bitval(kind_flag_raw,7), bitval(kind_flag_raw,6), bitval(kind_flag_raw,5),
			bitval(kind_flag_raw,4), bitval(kind_flag_raw,3), kf_reserved))
	offset = offset + 1

	subtree:add(buffer(offset,11),	string.format("reserved2     : 0x%02x%04x%08x%08x",
		buffer(offset,1):uint(), buffer(offset+1,2):uint(), buffer(offset+1+2,4):uint(),
		buffer(offset+1+2+4,4):uint()))
	offset = offset + 11

	subtree:add(buffer(offset,4),	string.format("dcs           : 0x%08x", buffer(offset,4):uint()))
	offset = offset + 4
end

function Disp_ccietsn_detect(buffer, pinfo, tree, ftype)
	local offset = CCIETSN_HEADER_DETECT_SZ
	local subtree = tree:add(buffer(offset, 2+1+1+6+6+1+1+2+25+1+10),
		"CC-Link IE TSN [acyclicDetectionData]")

	subtree:add(buffer(offset,2), string.format("reserved1        : 0x%04x",
		buffer(offset,2):uint()))
	offset = offset + 2

	subtree:add(buffer(offset,1), string.format("detectionVer     : 0x%02x",			
		buffer(offset,1):uint()))
	local detectionVer1 = buffer(offset,1):uint()
	offset = offset + 1

	subtree:add(buffer(offset,1), string.format("protocolVer      : 0x%02x",			
		buffer(offset,1):uint()))
	offset = offset + 1

	subtree:add(buffer(offset,6), string.format("mngMAC           : %02x:%02x:%02x:%02x:%02x:%02x",
		buffer(offset,1):uint(), buffer(offset+1,1):uint(), buffer(offset+2,1):uint(),
		buffer(offset+3,1):uint(), buffer(offset+4,1):uint(), buffer(offset+5,1):uint()))
	offset = offset + 6
	subtree:add(buffer(offset,6), string.format("previousNodeMAC  : %02x:%02x:%02x:%02x:%02x:%02x",
		buffer(offset,1):uint(), buffer(offset+1,1):uint(), buffer(offset+2,1):uint(),
		buffer(offset+3,1):uint(), buffer(offset+4,1):uint(), buffer(offset+5,1):uint()))
	offset = offset + 6

	subtree:add(buffer(offset,1), string.format("previousNodePort : 0x%02x",
		buffer(offset,1):uint()))
	offset = offset + 1

	local opt_flag_raw = buffer(offset,1):uint()
	local fs_da_send = bitval(opt_flag_raw, 0)
	local of_reserved = bit.rshift(bit.band(opt_flag_raw,0xfe),1)
	local str_FS_DA_SEND = {
		[0] = "disabled",
		[1] = "enabled"
	}

	local subsubtree = subtree:add(buffer(offset,1), string.format("optionFlag       : 0x%02x",
		buffer(offset,1):uint()))

	subsubtree:add(buffer(offset,1),
		string.format(".... ...%d = forcedDetectionAck : %s (0x%x)",
			fs_da_send, str_FS_DA_SEND[fs_da_send], fs_da_send))

	subsubtree:add(buffer(offset,1),
		string.format("%d%d%d%d %d%d%d. = reserved           : 0x%x",
			bitval(opt_flag_raw,7), bitval(opt_flag_raw,6), bitval(opt_flag_raw,5),
			bitval(opt_flag_raw,4), bitval(opt_flag_raw,3), bitval(opt_flag_raw,2),
			bitval(opt_flag_raw,1), of_reserved))

	offset = offset + 1

	subtree:add(buffer(offset,2), string.format("hopCount         : 0x%04x",
		buffer(offset,2):uint()))
	offset = offset + 2

	local subsubtree2 = subtree:add(buffer(offset,25), string.format("ipAdd            : IPv4 %08x/%08x, IPv6 %08x%08x%08x%08x/%02x",	
		buffer(offset,4):uint(), buffer(offset+4,4):uint(),
		buffer(offset+4+4,4):uint(), buffer(offset+4+4+4,4):uint(),
		buffer(offset+4+4+4+4,4):uint(), buffer(offset+4+4+4+4+4,4):uint(),
		buffer(offset+4+4+4+4+4+4,1):uint()))

	subsubtree2:add(buffer(offset, 4), string.format("ipv4IpAddress    : %d.%d.%d.%d",
		buffer(offset,1):uint(), buffer(offset+1,1):uint(), buffer(offset+1+1,1):uint(), buffer(offset+1+1+1,1):uint()))
	offset = offset + 4

	subsubtree2:add(buffer(offset, 4), string.format("ipv4SubNetMask   : %d.%d.%d.%d",
		buffer(offset,1):uint(), buffer(offset+1,1):uint(), buffer(offset+1+1,1):uint(), buffer(offset+1+1+1,1):uint()))
	offset = offset + 4

	subsubtree2:add(buffer(offset, 16), string.format("ipv6IpAddress    : %04x:%04x:%04x:%04x:%04x:%04x:%04x:%04x",
		buffer(offset,2):uint(), buffer(offset+2,2):uint(), buffer(offset+2+2,2):uint(), buffer(offset+2+2+2,2):uint(),
		buffer(offset+2+2+2+2,2):uint(), buffer(offset+2+2+2+2+2,2):uint(), buffer(offset+2+2+2+2+2+2,2):uint(),
		buffer(offset+2+2+2+2+2+2+2,2):uint()))
	offset = offset + 16

	subsubtree2:add(buffer(offset, 1), string.format("ipv6SubNetPrefLen: %d", buffer(offset,1):uint()))
	offset = offset + 1

	local send_info_raw = buffer(offset,1):uint()
	local detect_src = bitval(send_info_raw, 0)
	local phase = bitval(send_info_raw, 1)
	local unitinfo = bitval(send_info_raw, 2)
	local si_reserved = bit.rshift(bit.band(opt_flag_raw,0xfc),2)
	local str_DETECT_SRC = {
		[0] = "station",
		[1] = "peripheral"
	}
	local str_PHASE = {
		[0] = "initial",
		[1] = "operation"
	}
	local str_UnitInfo =  {
		[0] = "managementMaster",
		[1] = "nonManagementMaster"
	}

	local subsubtree3 = subtree:add(buffer(offset,1), string.format("sendInfo         : 0x%02x",
		buffer(offset,1):uint()))

	subsubtree3:add(buffer(offset,1),
		string.format(".... ...%d = sourceNode : %s (0x%x)",
			detect_src, str_DETECT_SRC[detect_src], detect_src))

	subsubtree3:add(buffer(offset,1),
		string.format(".... ..%d. = commPhase  : %s (0x%x)",
			phase, str_PHASE[phase], phase))

	if (detectionVer1 == 0) then		
		subsubtree3:add(buffer(offset,1),
		string.format("%d%d%d%d %d%d.. = reserved   : 0x%x",
			bitval(opt_flag_raw,7), bitval(opt_flag_raw,6), bitval(opt_flag_raw,5),
			bitval(opt_flag_raw,4), bitval(opt_flag_raw,3), bitval(opt_flag_raw,2),
			si_reserved))

		offset = offset + 1

		subtree:add(buffer(offset,10), string.format("reserved2  : 0x%04x%08x%08x",			
		buffer(offset,2):uint(), buffer(offset+2,4):uint(), buffer(offset+4,4):uint()))		
	offset = offset + 10

	elseif (detectionVer1 == 1) then		

		subsubtree3:add(buffer(offset,1),
			string.format(".... .%d.. = masterType : %s (0x%x)",
				unitinfo, str_UnitInfo[unitinfo], unitinfo))

		subsubtree3:add(buffer(offset,1),
			string.format("%d%d%d%d %d... = reserved   : 0x%x",
				bitval(opt_flag_raw,7), bitval(opt_flag_raw,6), bitval(opt_flag_raw,5),
				bitval(opt_flag_raw,4), bitval(opt_flag_raw,3), 
				si_reserved))
		offset = offset + 1

		subtree:add(buffer(offset,6), string.format("makingNodeMAC    : %02x:%02x:%02x:%02x:%02x:%02x",
			buffer(offset,1):uint(), buffer(offset+1,1):uint(), buffer(offset+2,1):uint(),
			buffer(offset+3,1):uint(), buffer(offset+4,1):uint(), buffer(offset+5,1):uint()))
		offset = offset + 6

		subtree:add(buffer(offset,1), string.format("makingNodePort   : 0x%02x",	buffer(offset,1):uint()))
		offset = offset + 1

		subtree:add(buffer(offset,3), string.format("reserved2        : 0x%06x",	buffer(offset,3):uint()))			
		offset = offset + 3

	end


end

function Disp_ccietsn_detect_ack(buffer, pinfo, tree, ftype)
	local offset = CCIETSN_HEADER_DETECT_SZ

	local detectionVer1 = buffer(offset+1,1):uint()												
	local dataLen
	if detectionVer1 == 0 then																	
		dataLen = 1+1+1+1+6+2+6+1+1+1+1+2+12+12+6+2+45+1+2+6+1+1+1+1+1+1+64+4
	elseif detectionVer1 == 1 then															
		dataLen = 1+1+1+1+6+2+6+1+1+1+1+1+1+12+12+6+2+45+1+1+1+6+1+1+1+1+1+1+64+16+4			
    end
	local subtree = tree:add(buffer(offset, dataLen),"CC-Link IE TSN [acyclicDetectionAckData]")
	local node_type_raw = buffer(offset,1):uint()
	local node_type = bit.band(node_type_raw, 0x0F)
	local node_func = bitval(node_type_raw, 7)
	local nt_reserved = bit.rshift(bit.band(node_type_raw,0x70),4)
	local str_NODE_TYPE =  {
		[0x0] = "master",
		[0x1] = "slave",
		[0x2] = "switch",
		[0x3] = "",
		[0x4] = "subMaster",
		[0x5] = "", [0x6] = "", [0x7] = "", [0x8] = "",
		[0x9] = "", [0xa] = "", [0xb] = "", [0xc] = "",
		[0xd] = "", [0xe] = "", [0xf] = ""
	}
	local str_NODE_FUNC = {
		[0] = "cyclic & transient",
		[1] = "transient"
	}
	local subsubtree = subtree:add(buffer(offset,1), string.format("nodeType             : 0x%02x",
		buffer(offset,1):uint()))

	subsubtree:add(buffer(offset,1),
		string.format(".... %d%d%d%d = stationType : %s (0x%x)",
			bitval(node_type,3), bitval(node_type,2), bitval(node_type,1),
			bitval(node_type,0), str_NODE_TYPE[node_type], node_type))


	subsubtree:add(buffer(offset,1),
		string.format(".%d%d%d .... = reserved    : 0x%x",
			bitval(node_type_raw,6), bitval(node_type_raw,5), bitval(node_type_raw,4),
			nt_reserved))

	subsubtree:add(buffer(offset,1),
		string.format("%d... .... = supportFunc : %s (0x%x)",
			node_func, str_NODE_FUNC[node_func], node_func))

	offset = offset + 1

	subtree:add(buffer(offset,1), string.format("detectionVer         : 0x%02x",
		buffer(offset,1):uint()))													
	offset = offset + 1
	
	subtree:add(buffer(offset,1), string.format("protocolVer          : 0x%02x",
		buffer(offset,1):uint()))													
	offset = offset + 1

	subtree:add(buffer(offset,1), string.format("ipAddressFourthOctet : %d (0x%02x)",
		buffer(offset,1):uint(),buffer(offset,1):uint()))
	offset = offset + 1

	subtree:add(buffer(offset,6), string.format("srcMAC               : %02x:%02x:%02x:%02x:%02x:%02x",
		buffer(offset,1):uint(), buffer(offset+1,1):uint(), buffer(offset+2,1):uint(),
		buffer(offset+3,1):uint(), buffer(offset+4,1):uint(), buffer(offset+5,1):uint()))
	offset = offset + 6

	subtree:add(buffer(offset,2), string.format("reserved2            : 0x%04x",
		buffer(offset,2):uint()))
	offset = offset + 2

	subtree:add(buffer(offset,6), string.format("previousNodeMAC      : %02x:%02x:%02x:%02x:%02x:%02x",
		buffer(offset,1):uint(), buffer(offset+1,1):uint(), buffer(offset+2,1):uint(),
		buffer(offset+3,1):uint(), buffer(offset+4,1):uint(), buffer(offset+5,1):uint()))
	offset = offset + 6

	subtree:add(buffer(offset,1), string.format("previousNodePort     : 0x%02x",
		buffer(offset,1):uint()))
	offset = offset + 1

	subtree:add(buffer(offset,1), string.format("detectionRcvPort     : 0x%02x",
		buffer(offset,1):uint()))
	offset = offset + 1

	subtree:add(buffer(offset,1), string.format("myPort               : 0x%02x",
		buffer(offset,1):uint()))
	offset = offset + 1

	local str_certificationClass = {
		[0] = "ccieTsnClassA",
		[1] = "ccieTsnClassB",
		[2] = ""
	}
	local str_offset = buffer(offset,1):uint()
	local str_allow  = str_offset
	if str_offset > 2 then str_allow = 2 end
	subtree:add(buffer(offset,1), string.format("certificationClass   : %s (0x%02x)",
		str_certificationClass[str_allow],
		str_offset))

	offset = offset + 1

	if detectionVer1 == 0 then															
	subtree:add(buffer(offset,2), string.format("reserved3            : 0x%04x",
		buffer(offset,2):uint()))
	offset = offset + 2
	
	elseif  detectionVer1 == 1 then
	
	subtree:add(buffer(offset,1), string.format("timeSlotSetNum       : 0x%02x",
	buffer(offset,1):uint()))
	offset = offset + 1
	
	subtree:add(buffer(offset,1), string.format("reserved3            : 0x%02x",
	buffer(offset,1):uint()))
	offset = offset + 1
	
	end

	local subsubtree2 = subtree:add(buffer(offset,12), string.format("myPortLinkStatus"))
	for portnum = 1, 24, 2 do
		Disp_myPortLinkStatus_help(buffer(offset,1), subsubtree2, portnum)
		offset = offset + 1
	end

	local subsubtree3 = subtree:add(buffer(offset,12), string.format("myPortFilterStatus"))
	for portnum = 1, 24, 2 do
		Disp_myPortFilterStatus_help(buffer(offset,1), subsubtree3, portnum)
		offset = offset + 1
	end

	subtree:add(buffer(offset,6), string.format("currentManager       : %02x:%02x:%02x:%02x:%02x:%02x",
		buffer(offset,1):uint(), buffer(offset+1,1):uint(), buffer(offset+2,1):uint(),
		buffer(offset+3,1):uint(), buffer(offset+4,1):uint(), buffer(offset+5,1):uint()))
	offset = offset + 6

	subtree:add(buffer(offset,2), string.format("reserved4            : 0x%04x",
		buffer(offset,2):uint()))
	offset = offset + 2

	local subsubtree4 = subtree:add(buffer(offset,45), string.format("ipAdd"))

	subsubtree4:add(buffer(offset, 4), string.format("ipv4IpAddress      : %d.%d.%d.%d",
		buffer(offset,1):uint(), buffer(offset+1,1):uint(), buffer(offset+1+1,1):uint(), buffer(offset+1+1+1,1):uint()))
	offset = offset + 4

	subsubtree4:add(buffer(offset, 4), string.format("ipv4SubNetMask     : %d.%d.%d.%d",
		buffer(offset,1):uint(), buffer(offset+1,1):uint(), buffer(offset+1+1,1):uint(), buffer(offset+1+1+1,1):uint()))
	offset = offset + 4

	subsubtree4:add(buffer(offset, 4), string.format("ipv4DefaultGateway : %d.%d.%d.%d",
		buffer(offset,1):uint(), buffer(offset+1,1):uint(), buffer(offset+1+1,1):uint(), buffer(offset+1+1+1,1):uint()))
	offset = offset + 4

	subsubtree4:add(buffer(offset, 16), string.format("ipv6IpAddress      : %04x:%04x:%04x:%04x:%04x:%04x:%04x:%04x",
		buffer(offset,2):uint(), buffer(offset+2,2):uint(), buffer(offset+2+2,2):uint(), buffer(offset+2+2+2,2):uint(),
		buffer(offset+2+2+2+2,2):uint(), buffer(offset+2+2+2+2+2,2):uint(), buffer(offset+2+2+2+2+2+2,2):uint(),
		buffer(offset+2+2+2+2+2+2+2,2):uint()))
	offset = offset + 16

	subsubtree4:add(buffer(offset, 16), string.format("ipv6DefaultGateway : %04x:%04x:%04x:%04x:%04x:%04x:%04x:%04x",
		buffer(offset,2):uint(), buffer(offset+2,2):uint(), buffer(offset+2+2,2):uint(), buffer(offset+2+2+2,2):uint(),
		buffer(offset+2+2+2+2,2):uint(), buffer(offset+2+2+2+2+2,2):uint(), buffer(offset+2+2+2+2+2+2,2):uint(),
		buffer(offset+2+2+2+2+2+2+2,2):uint()))
	offset = offset + 16

	subsubtree4:add(buffer(offset, 1), string.format("ipv6SubNetPrefLen  : %d (0x%02x)", buffer(offset,1):uint(), buffer(offset,1):uint()))
	offset = offset + 1

	local perf_raw = buffer(offset,1):uint()
	local eff_thro_p = bitval(perf_raw, 0)
	local det_clk_fail = bitval(perf_raw, 2)
	local det_dup_ip = bitval(perf_raw, 3)
	local perf_reserved = bit.rshift(bit.band(perf_raw,0xf0),4)
	local str_EFF_THRO_P =  {
		[0] = "notSupported",
		[1] = "supported",
	}

	local str_DET_DUP_IP = {
		[0] = "noDetection",
		[1] = "Detected"
	}

	local subsubtree5 = subtree:add(buffer(offset,1), string.format("performance          : 0x%02x",
		buffer(offset,1):uint()))

	subsubtree5:add(buffer(offset,1),
		string.format(".... ...%d = effectitveThroughput : %s (0x%x)",
			eff_thro_p, str_EFF_THRO_P[eff_thro_p], eff_thro_p))

	subsubtree5:add(buffer(offset,1),
		string.format(".... ..%d. = fullrateRcvrelay     : 0x%x",
			bitval(perf_raw,1), bitval(perf_raw,1)))						

	subsubtree5:add(buffer(offset,1),
		string.format(".... .%d.. = error                : 0x%x",
			bitval(perf_raw,2), bitval(perf_raw,2)))						

	subsubtree5:add(buffer(offset,1),
		string.format(".... %d... = duplicatedIpAddr     : %s (0x%x)",
			det_dup_ip, str_DET_DUP_IP[det_dup_ip], det_dup_ip))

	subsubtree5:add(buffer(offset,1),
		string.format("%d%d%d%d .... = reserved             : 0x%x",
			bitval(perf_raw,7), bitval(perf_raw,6),
			bitval(perf_raw,5), bitval(perf_raw,4), perf_reserved))

	offset = offset + 1
	
	
	if detectionVer1 == 0 then															
	
	subtree:add(buffer(offset,2), string.format("reserved5            : 0x%04x",
		buffer(offset,2):uint()))
	offset = offset + 2

	elseif detectionVer1 == 1 then
	
	subtree:add(buffer(offset,1), string.format("cyclicMaxResTime     : %d (0x%02x)",
	buffer(offset,1):uint(),buffer(offset,1):uint()))
	offset = offset + 1
	
	subtree:add(buffer(offset,1), string.format("reserved5            : 0x%02x",
	buffer(offset,1):uint()))
	offset = offset + 1
	
	end
	
	local subsubtree6 = subtree:add(buffer(offset,6), string.format("gmPriority"))

	subsubtree6:add(buffer(offset,1), string.format("priority1    : %d (0x%02x)",					
		buffer(offset,1):uint(),buffer(offset,1):uint()))										 
	offset = offset + 1

	local subsubtreex = subsubtree6:add(buffer(offset,4), string.format("clockQuality : 0x%08x",
		buffer(offset,4):uint(),buffer(offset,4):uint()))											
	subsubtreex:add(buffer(offset,1), string.format("clockQuality            : %d (0x%02x)",		
		buffer(offset,1):uint(), buffer(offset,1):uint()))											
	offset = offset + 1
	subsubtreex:add(buffer(offset,1), string.format("clockAccuracy           : 0x%02x",
		buffer(offset,1):uint()))
	offset = offset + 1
	subsubtreex:add(buffer(offset,2), string.format("offsetScaledLogVariance : %d (0x%04x)",
		buffer(offset,2):uint(), buffer(offset,2):uint()))
	offset = offset + 2

	subsubtree6:add(buffer(offset,1), string.format("priority2    : %d (0x%02x)",
		buffer(offset,1):uint(),buffer(offset,1):uint()))										 
	offset = offset + 1

	local sync_type_raw = buffer(offset,1):uint()
	local IEEE1588 = bitval(sync_type_raw, 0)
	local IEEE802_1AS = bitval(sync_type_raw, 1)
	local sync_type_reserved = bit.rshift(bit.band(sync_type_raw,0xfc),2)
	local ieee1588_M  = bitval(sync_type_raw, 2)
	local ieee8021AS_M = bitval(sync_type_raw, 3)
	local ieee1588_O  = bitval(sync_type_raw, 4)
	local ieee8021AS_O = bitval(sync_type_raw, 5)
	local sync_type_res_ver1 = bit.rshift(bit.band(sync_type_raw,0xc0),2)
	local str_SYNC_TYPE =  {
		[0] = "notSupported",
		[1] = "supported",
	}

	local subsubtree7 = subtree:add(buffer(offset,1), string.format("syncType             : 0x%02x",
		buffer(offset,1):uint()))

	subsubtree7:add(buffer(offset,1), string.format(".... ...%d = ieee1588_TwoStep       : %s (0x%x)",
		IEEE1588, str_SYNC_TYPE[IEEE1588], IEEE1588))
	subsubtree7:add(buffer(offset,1), string.format(".... ..%d. = ieee8021AS_TwoStep     : %s (0x%x)",
		IEEE802_1AS, str_SYNC_TYPE[IEEE802_1AS], IEEE802_1AS))
		
	if detectionVer1 == 0 then
		subsubtree7:add(buffer(offset,1), string.format("%d%d%d%d %d%d.. = reserved    : 0x%x",
			bitval(sync_type_raw,7), bitval(sync_type_raw,6),bitval(sync_type_raw,5),
			bitval(sync_type_raw,4), bitval(sync_type_raw,3),bitval(sync_type_raw,2),
			sync_type_reserved))
	elseif detectionVer1 == 1 then
		subsubtree7:add(buffer(offset,1), string.format(".... .%d.. = ieee1588_MultiDomain   : %s (0x%x)",
			ieee1588_M, str_SYNC_TYPE[ieee1588_M], ieee1588_M))
		subsubtree7:add(buffer(offset,1), string.format(".... %d... = ieee8021AS_MultiDomain : %s (0x%x)",
			ieee8021AS_M, str_SYNC_TYPE[ieee8021AS_M], ieee8021AS_M))
		subsubtree7:add(buffer(offset,1), string.format("...%d .... = ieee1588_OneStep       : %s (0x%x)",
			ieee1588_O, str_SYNC_TYPE[ieee1588_O], ieee1588_O))
		subsubtree7:add(buffer(offset,1), string.format("..%d. .... = ieee802.1AS_OneStep    : %s (0x%x)",
			ieee8021AS_O, str_SYNC_TYPE[ieee8021AS_O], ieee8021AS_O))
		subsubtree7:add(buffer(offset,1), string.format("%d%d.. ...  = reserved               : 0x%x",
			bitval(sync_type_raw,7), bitval(sync_type_raw,6),
			sync_type_res_ver1))
	end
	
	offset = offset + 1

	subtree:add(buffer(offset,1), string.format("reserved6            : 0x%02x",
		buffer(offset,1):uint()))
	offset = offset + 1

	subtree:add(buffer(offset,1), string.format("pdelayResTime        : 0x%02x",
		buffer(offset,1):uint()))
	offset = offset + 1

	subtree:add(buffer(offset,1), string.format("delaySetTime         : 0x%02x",
		buffer(offset,1):uint()))
	offset = offset + 1

	subtree:add(buffer(offset,1), string.format("announceRelayTime    : 0x%02x",
		buffer(offset,1):uint()))
	offset = offset + 1

	subtree:add(buffer(offset,1), string.format("reserved7            : 0x%02x",
		buffer(offset,1):uint()))
	offset = offset + 1

	subtree:add(buffer(offset,2), string.format("deviceVer            : 0x%04x",
		buffer(offset,2):uint()))
	offset = offset + 2

	subtree:add(buffer(offset,2), string.format("vendorCode           : 0x%04x",
		buffer(offset,2):uint()))
	offset = offset + 2
	subtree:add(buffer(offset,4), string.format("modelCode            : 0x%08x",
		buffer(offset,4):uint()))
	offset = offset + 4
	subtree:add(buffer(offset,2), string.format("expansionmodelCode   : 0x%04x",
		buffer(offset,2):uint()))
	offset = offset + 2
	subtree:add(buffer(offset,2), string.format("deviceType           : 0x%04x",
		buffer(offset,2):uint()))
	offset = offset + 2
	local subsubsubtree = subtree:add(buffer(offset,4*7), string.format("memoryAddress"))
	subsubsubtree:add(buffer(offset,4), string.format("bitDataFromSlave     : 0x%08x",
		buffer(offset,4):uint()))
	offset = offset + 4
	subsubsubtree:add(buffer(offset,4), string.format("wordDataFromSlave    : 0x%08x",
		buffer(offset,4):uint()))
	offset = offset + 4
	subsubsubtree:add(buffer(offset,4), string.format("safetyDataFromSlave  : 0x%08x",
		buffer(offset,4):uint()))
	offset = offset + 4
	subsubsubtree:add(buffer(offset,4), string.format("bitDataFromMaster    : 0x%08x",
		buffer(offset,4):uint()))
	offset = offset + 4
	subsubsubtree:add(buffer(offset,4), string.format("wordDataFromMaster   : 0x%08x",
		buffer(offset,4):uint()))
	offset = offset + 4
	subsubsubtree:add(buffer(offset,4), string.format("safetyDataFromMaster : 0x%08x",
		buffer(offset,4):uint()))
	offset = offset + 4
	subsubsubtree:add(buffer(offset,4), string.format("statusData           : 0x%08x",
		buffer(offset,4):uint()))
	offset = offset + 4

	local subsubsubtree2 = subtree:add(buffer(offset,2*7), string.format("cyclicSize"))
	subsubsubtree2:add(buffer(offset,2), string.format("bitDataFromSlave     : 0x%04x",
		buffer(offset,2):uint()))
	offset = offset + 2
	subsubsubtree2:add(buffer(offset,2), string.format("wordDataFromSlave    : 0x%04x",
		buffer(offset,2):uint()))
	offset = offset + 2
	subsubsubtree2:add(buffer(offset,2), string.format("safetyDataFromSlave  : 0x%04x",
		buffer(offset,2):uint()))
	offset = offset + 2
	subsubsubtree2:add(buffer(offset,2), string.format("bitDataFromMaster    : 0x%04x",
		buffer(offset,2):uint()))
	offset = offset + 2
	subsubsubtree2:add(buffer(offset,2), string.format("wordDataFromMaster   : 0x%04x",
		buffer(offset,2):uint()))
	offset = offset + 2
	subsubsubtree2:add(buffer(offset,2), string.format("safetyDataFromMaster : 0x%04x",
		buffer(offset,2):uint()))
	offset = offset + 2
	subsubsubtree2:add(buffer(offset,2), string.format("statusData           : 0x%04x",
		buffer(offset,2):uint()))
	offset = offset + 2

	subtree:add(buffer(offset,2), string.format("reserved8            : 0x%04x",
		buffer(offset,2):uint()))
	offset = offset + 2

	-- Func
	local func_raw = buffer(offset,1):uint()
	local f_local = bitval(func_raw, 0)
	local ovwr = bitval(func_raw, 1)
	local wdt = bitval(func_raw, 2)
	local bkup_rstr = bitval(func_raw, 3)
	local safety = bitval(func_raw, 4)
	local relayFi = bitval(func_raw, 5)
	local syncOp  = bitval(func_raw, 6)
	local f_reserved = bit.rshift(bit.band(func_raw, 0xe0),5)
	local str_LOCAL = {
		[0] = "notSupported",
		[1] = "supported"
	}
	local str_OVWR = {
		[0] = "notSupported",
		[1] = "supported"
	}
	local str_WDT = {
		[0] = "notSupported",
		[1] = "supported"
	}
	local str_BKUP_RSTR = {
		[0] = "notSupported",
		[1] = "supported"
	}
	local str_SAFETY = {
		[0] = "notSupported",
		[1] = "supported"
	}

	local subsubsubtree3 = subtree:add(buffer(offset,1), string.format("function             : 0x%02x",
		buffer(offset,1):uint()))
	subsubsubtree3:add(buffer(offset,1), string.format(".... ...%d = localStationFunc    : %s (0x%x)",
		f_local, str_LOCAL[f_local], f_local))
	subsubsubtree3:add(buffer(offset,1), string.format(".... ..%d. = configOverwrite     : %s (0x%x)",
		ovwr, str_OVWR[ovwr], ovwr))
	subsubsubtree3:add(buffer(offset,1), string.format(".... .%d.. = wdtCounter          : %s (0x%x)",
		wdt, str_WDT[wdt], wdt))
	subsubsubtree3:add(buffer(offset,1), string.format(".... %d... = backupRestore       : %s (0x%x)",
		bkup_rstr, str_BKUP_RSTR[bkup_rstr], bkup_rstr))
	subsubsubtree3:add(buffer(offset,1), string.format("...%d .... = safetyCommunication : %s (0x%x)",
		safety, str_SAFETY[safety], safety))
	subsubsubtree3:add(buffer(offset,1), string.format("..%d. .... = relayFilter         : %s (0x%x)",
	relayFi, str_SAFETY[relayFi], relayFi))

	if detectionVer1 == 0 then																				
		subsubsubtree3:add(buffer(offset,1), string.format("%d%d.. .... = reserved            : 0x%x",
		bitval(func_raw,7), bitval(func_raw,6), f_reserved))
	elseif detectionVer1 == 1 then																			
		subsubsubtree3:add(buffer(offset,1), string.format(".%d.. .... = syncOperation       : %s (0x%x)",
		syncOp, str_SAFETY[syncOp], syncOp))
		subsubsubtree3:add(buffer(offset,1), string.format("%d... .... = reserved            : 0x%x",
		bitval(func_raw,7), bitval(func_raw,7)))
	end
	offset = offset + 1

	-- Option
	local opt_raw = buffer(offset,1):uint()
	local ctr_inf = bitval(opt_raw, 0)
	local opt_inf = bitval(opt_raw, 1)
	local opt_inf1 = bitval(opt_raw, 2)
	local opt_reserved0 = bit.rshift(bit.band(opt_raw, 0xfc), 2)
	local opt_reserved1 = bit.rshift(bit.band(opt_raw, 0xf8), 2)
	local str_INF = {
		[0] = "notContained",
		[1] = "cotained"
	}
	local subsubsubtree4 = subtree:add(buffer(offset,1), string.format("optionInfo           : 0x%02x",

		buffer(offset,1):uint()))

	subsubsubtree4:add(buffer(offset,1), string.format(".... ...%d = controllerInfo            : %s (0x%x)",
		ctr_inf, str_INF[ctr_inf], ctr_inf))

	if detectionVer1 == 0 then																					
		subsubsubtree4:add(buffer(offset,1), string.format(".... ..%d. = optionInfo                : %s (0x%x)",
		opt_inf, str_INF[opt_inf], opt_inf))

		subsubsubtree4:add(buffer(offset,1), string.format("%d%d%d%d %d%d.. = reserved                  : 0x%x",
		bitval(opt_raw,7), bitval(opt_raw,6), bitval(opt_raw,5),
		bitval(opt_raw,4), bitval(opt_raw,3), bitval(opt_raw,2),
		opt_reserved0))

	elseif detectionVer1 == 1 then																					

		subsubsubtree4:add(buffer(offset,1), string.format(".... ..%d. = extModuleWithCyclicPdu    : %s (0x%x)",
		opt_inf, str_INF[opt_inf], opt_inf))

		subsubsubtree4:add(buffer(offset,1), string.format(".... .%d.. = extModuleWithoutCyclicPdu : %s (0x%x)",
		opt_inf1, str_INF[opt_inf1], opt_inf1))

		subsubsubtree4:add(buffer(offset,1), string.format("%d%d%d%d %d... = reserved                  : 0x%x",
		bitval(opt_raw,7), bitval(opt_raw,6), bitval(opt_raw,5),
		bitval(opt_raw,4), bitval(opt_raw,3),
		opt_reserved1))
	end
	offset = offset + 1

	subtree:add(buffer(offset,2), string.format("stationSubIdNumber   : 0x%04x",
		buffer(offset,2):uint()))
	offset = offset + 2

	subtree:add(buffer(offset,2), string.format("resreved9            : 0x%04x",
		buffer(offset,2):uint()))
	offset = offset + 2

	subtree:add(buffer(offset,2), string.format("stationMode          : 0x%04x",
		buffer(offset,2):uint()))
	offset = offset + 2

	if detectionVer1 == 1 then													 

		local str_func2 = {	[0] = "notSupported",	[1] = "supported"	}

		local func2_raw = buffer(offset,1):uint()
		local func2_inf0 = bitval(func2_raw,0)
		local func2_inf1 = bitval(func2_raw,1)
		local func2_inf2 = bitval(func2_raw,2)
		local func2_inf3 = bitval(func2_raw,3)
		local func2_inf4 = bitval(func2_raw,4)
		local func2_inf5 = bitval(func2_raw,5)
		local func2_inf6 = bitval(func2_raw,6)
		local func2_inf7 = bitval(func2_raw,7)

		local subtreefunc = subtree:add(buffer(offset,1), string.format("function2            : 0x%02x",	buffer(offset,1):uint()))
			subtreefunc:add(buffer(offset,1), string.format(".... ...%d = ringTopology            : %s (0x%02x)",	func2_inf0, str_func2[func2_inf0], func2_inf0 ))
			subtreefunc:add(buffer(offset,1), string.format(".... ..%d. = meshTopology            : %s (0x%02x)",	func2_inf1, str_func2[func2_inf1], func2_inf1 ))
			subtreefunc:add(buffer(offset,1), string.format(".... .%d.. = ieee802.1Qbv&1588       : %s (0x%02x)",	func2_inf2, str_func2[func2_inf2], func2_inf2 ))
			subtreefunc:add(buffer(offset,1), string.format(".... %d... = ieee802.1Qbv&As         : %s (0x%02x)",	func2_inf3, str_func2[func2_inf3], func2_inf3 ))
			subtreefunc:add(buffer(offset,1), string.format("...%d .... = detectionRelayUpdate    : %s (0x%02x)",	func2_inf4, str_func2[func2_inf4], func2_inf4 ))
			subtreefunc:add(buffer(offset,1), string.format("..%d. .... = relayFilter             : %s (0x%02x)",   func2_inf5, str_func2[func2_inf5], func2_inf5 ))
			subtreefunc:add(buffer(offset,1), string.format(".%d.. .... = timeManagedPolling      : %s (0x%02x)",   func2_inf6, str_func2[func2_inf6], func2_inf6 ))
			subtreefunc:add(buffer(offset,1), string.format("%d... .... = vLANRelay               : %s (0x%02x)",   func2_inf7, str_func2[func2_inf7], func2_inf7 ))

		offset = offset + 1
		
		
		local relay_raw = buffer(offset,2):uint()
		local relayInfo  = bit.rshift(bit.band(relay_raw, 0x07),0)
		local relay_Info = {	[0] = "notUsed",	[1] = "every",	[2] = "whole"	}
		local relay_inf3 = bitval(relay_raw,3)
		local relay_BufferSize = {	[0] = "bytes",	[1] = "kbytes"	}
		local relay_rese = bit.rshift(bit.band(relay_raw, 0xF0),4)
		
		local subtreerelay = subtree:add(buffer(offset,2), string.format("relayInfo            : 0x%04x",			buffer(offset,2):uint()))
			subtreerelay:add(buffer(offset,1), string.format(".... .%d%d%d = relayBufferOwner        : %s (0x%x)" 
			,bitval(relay_raw,2),bitval(relay_raw,1),bitval(relay_raw,0), relay_Info[relayInfo], relayInfo))
			subtreerelay:add(buffer(offset,1), string.format(".... %d... = relayBufferSizeUnit     : %s (0x%x)" 
			,relay_inf3, relay_BufferSize[relay_inf3], relay_inf3))
			subtreerelay:add(buffer(offset,1), string.format("%d%d%d%d .... = reserved                : 0x%x" 
			,bitval(relay_raw,7),bitval(relay_raw,6),bitval(relay_raw,5),bitval(relay_raw,4), relay_rese))
		offset = offset + 2

		subtree:add(buffer(offset,1), string.format("relayBufferSize      : 0x%02x",			buffer(offset,1):uint()))
		offset = offset + 1
		


		subtree:add(buffer(offset,4), string.format("syncAccuracy         : 0x%08x",			buffer(offset,4):uint()))
		offset = offset + 4

		subtree:add(buffer(offset,6), string.format("dtctMaking Node MAC  : %02x:%02x:%02x:%02x:%02x:%02x",
			buffer(offset,1):uint(), buffer(offset+1,1):uint(), buffer(offset+2,1):uint(),
			buffer(offset+3,1):uint(), buffer(offset+4,1):uint(), buffer(offset+5,1):uint()))
		offset = offset + 6

		subtree:add(buffer(offset,1), string.format("dtctMaking Node Port : 0x%02x",	buffer(offset,1):uint()))
		offset = offset + 1

		subtree:add(buffer(offset,1), string.format("resreved11           : 0x%02x",			buffer(offset,1):uint()))
		offset = offset + 1

	end

	subtree:add(buffer(offset,4), string.format("blank                : 0x%08x",
		buffer(offset,4):uint()))
	offset = offset + 4

end

function Disp_myPortLinkStatus_help(buffer, tree, portnum)
	local raw = buffer(0,1):uint()
	local link_stat0 = bit.band(raw, 0x07)
	local link_dup0 = bitval(raw, 3)
	local link_stat1 = bit.rshift(bit.band(raw, 0x70),4)
	local link_dup1 = bitval(raw, 7)
	local str_LINK_STAT =  {
		[0x0] = "linkDown",
		[0x1] = "linkUp_10Mbps",
		[0x2] = "linkUp_100Mbps",
		[0x3] = "linkUp_1Gbps",
		[0x4] = "", [0x5] = "", [0x6] = "", [0x7] = ""
	}
	local str_LINK_DUP = {
		[0] = "fullDuplex",
		[1] = "halfDuplex"
	}

	tree:add(buffer(offset,1),
			string.format(".... .%d%d%d = Port%2d linkStatus : %s (0x%x)",
			bitval(link_stat0,2), bitval(link_stat0,1), bitval(link_stat0,0),
			portnum, str_LINK_STAT[link_stat0], link_stat0))
	tree:add(buffer(offset,1),
			string.format(".... %d... = Port%2d linkMode   : %s (0x%x)",
			link_dup0, portnum, str_LINK_DUP[link_dup0], link_dup0))
	tree:add(buffer(offset,1),
			string.format(".%d%d%d .... = Port%2d linkStatus : %s (0x%x)",
			bitval(link_stat1,2), bitval(link_stat1,1), bitval(link_stat1,0),
			portnum+1, str_LINK_STAT[link_stat1], link_stat1))
	tree:add(buffer(offset,1),
			string.format("%d... .... = Port%2d linkMode   : %s (0x%x)",
			link_dup1, portnum+1, str_LINK_DUP[link_dup1], link_dup1))
end

function Disp_myPortFilterStatus_help(buffer, tree, portnum)
	local raw = buffer(0,1):uint()

	local filter0 = bit.band(raw, 0x03)
	local loop0 = bitval(raw, 2)
	local unused0 = bitval(raw, 3)

	local filter1 = bit.rshift(bit.band(raw, 0x30),4)
	local loop1 = bitval(raw, 6)
	local unused1 = bitval(raw, 7)

	local str_FILTER =  {
		[0x0] = "noFilter",
		[0x1] = "multicastFilter",
		[0x2] = "exceptCcieField",
		[0x3] = "filterProhibition"
	}
	local str_LOOP = {
		[0] = "noLoop",
		[1] = "Loop"
	}

	tree:add(buffer(offset,1),
			string.format(".... ..%d%d = Port%2d relayFilterSetting : %s (0x%x)",
			bitval(filter0,1), bitval(filter0,0),
			portnum, str_FILTER[filter0], filter0))
	tree:add(buffer(offset,1),
			string.format(".... .%d.. = Port%2d loopSetting        : %s (0x%x)",
			loop0, portnum, str_LOOP[loop0], loop0))
	tree:add(buffer(offset,1),
			string.format(".... %d... = Port%2d reserved           : 0x%x",
			unused0, portnum, unused0))
	tree:add(buffer(offset,1),
			string.format("..%d%d .... = Port%2d relayFilterSetting : %s (0x%x)",
			bitval(filter1,1), bitval(filter1,0),
			portnum+1, str_FILTER[filter1], filter1))
	tree:add(buffer(offset,1),
			string.format(".%d.. .... = Port%2d loopSetting        : %s (0x%x)",
			loop1, portnum+1, str_LOOP[loop1], loop1))
	tree:add(buffer(offset,1),
			string.format("%d... .... = Port%2d reserved           : 0x%x",
			unused1, portnum+1, unused1))

end
