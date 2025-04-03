----------------------------------------------------------------------
--
-- MELSEC Protocol Helper Functions
--
-- revision : 02
-- date     : 2024/5/10
--
-- Copyright(C) Wireshark community
----------------------------------------------------------------------

-- MELSEC frame identifier characters
MELSEC_FRAME_3E = 0x03  -- 3E frame
MELSEC_FRAME_4E = 0x04  -- 4E frame

-- MELSEC command codes - Expanded list with more commands
MelsecCommands = {
    -- Common commands
    [0x0101] = "CPU Model Read",
    [0x0102] = "CPU Name Read",
    [0x0103] = "Clock Data Read",
    [0x0104] = "PC Information Read",
    [0x0105] = "Serial Number Read",
    [0x0106] = "Self-Test",
    [0x0107] = "RAM Test",
    [0x0108] = "ROM Test",
    [0x0109] = "I/O Module Test",
    
    -- Remote control commands
    [0x1001] = "Remote Run",
    [0x1002] = "Remote Stop",
    [0x1003] = "Remote Pause",
    [0x1004] = "Remote Operation Mode Change",
    [0x1005] = "Remote Latch Clear",
    [0x1006] = "Remote Reset",
    [0x1007] = "Remote Control Mode Change",
    
    -- Special commands 
    [0x0150] = "Clear PLC Memory",
    [0x0151] = "Set Time",
    [0x0152] = "Read Time",
    [0x0153] = "Set Watchdog Timer",
    [0x0154] = "Get Error Code",
    [0x0155] = "Clear Error Code",
    [0x0156] = "Read Status",
    [0x0157] = "Read Module Type",
    [0x0158] = "Reset CPU",
    [0x0159] = "Boot Operation",
    
    -- Device access commands
    [0x0401] = "Device Read",
    [0x1401] = "Device Write",
    [0x0403] = "Device Read Random",
    [0x1402] = "Device Write Random",
    [0x0404] = "Device Read Block",
    [0x1403] = "Device Write Block",
    [0x0406] = "Device Read Block",
    [0x1406] = "Device Write Block",
    [0x040A] = "Device Read Multiple Blocks",
    [0x140A] = "Device Write Multiple Blocks",
    
    -- Memory access commands
    [0x0601] = "Extended Unit Read",
    [0x1601] = "Extended Unit Write",
    [0x0602] = "Buffer Memory Read",
    [0x1602] = "Buffer Memory Write",
    [0x0613] = "Memory Read",
    [0x1613] = "Memory Write",
    
    -- Monitoring commands
    [0x0801] = "Entry Monitor Device",
    [0x0802] = "Execute Monitor Device",
    [0x0803] = "Monitor Registration",
    [0x0804] = "Monitor Read",
    [0x0805] = "Force On",
    [0x0806] = "Force Off",
    [0x0807] = "Set Monitoring Time Interval",
    [0x0808] = "Start Monitoring",
    [0x0809] = "Stop Monitoring",
    
    -- File access commands
    [0x0201] = "File Read",
    [0x0202] = "File Write",
    [0x0203] = "File Directory Read",
    [0x0204] = "File Delete",
    [0x0205] = "File Copy",
    [0x0206] = "File Rename",
    
    -- Network commands
    [0x0619] = "Network Status Read",
    [0x061A] = "Network Configuration Read",
    [0x161A] = "Network Configuration Write",
    [0x061B] = "Network Control Read",
    [0x161B] = "Network Control Write",
    
    -- Extended networking commands for Q/QnA series
    [0x0701] = "Network Connection Status Read",
    [0x0702] = "Network Data Read",
    [0x1702] = "Network Data Write",
    [0x0703] = "Station Data Read",
    [0x1703] = "Station Data Write",
    [0x0704] = "Network Parameter Read",
    [0x1704] = "Network Parameter Write",
    
    -- Ethernet/CC-Link specific commands
    [0x0E01] = "CC-Link Status Read",
    [0x1E01] = "CC-Link Control",
    [0x0E02] = "CC-Link Configuration Read",
    [0x1E02] = "CC-Link Configuration Write"
}

-- Device codes for MELSEC
MelsecDeviceCodes = {
    -- Bit devices
    [0x90] = "M (Internal Relay)",
    [0x91] = "SM (Special Relay)",
    [0x92] = "L (Latch Relay)",
    [0x93] = "F (Annunciator)",
    [0x94] = "V (Edge Relay)",
    [0x95] = "S (Step Relay)",
    [0x98] = "S (Link Relay)",
    [0x9C] = "X (Input Relay)",
    [0x9D] = "Y (Output Relay)",
    [0xA0] = "B (Link Relay)",
    [0xA1] = "SB (Special Link Relay)",
    [0xA2] = "DX (Direct Input)",
    [0xA3] = "DY (Direct Output)",
    
    -- Word devices
    [0xA8] = "D (Data Register)",
    [0xA9] = "SD (Special Register)",
    [0xAA] = "Z (Index Register)",
    [0xAB] = "R (File Register)",
    [0xAC] = "K (Constant)",
    [0xAD] = "P (Pointer)",
    [0xAF] = "R (File Register)",
    [0xB0] = "ZR (File Register)",
    [0xB4] = "W (Link Register)",
    [0xB5] = "SW (Special Link Register)",
    
    -- Timer/Counter devices
    [0xC0] = "TC (Timer Coil)",
    [0xC1] = "TS (Timer Contact)",
    [0xC2] = "TN (Timer Current Value)",
    [0xC3] = "CC (Counter Coil)",
    [0xC4] = "CS (Counter Contact)",
    [0xC5] = "CN (Counter Current Value)",
    [0xC6] = "STC (Retentive Timer Coil)",
    [0xC7] = "STS (Retentive Timer Contact)",
    [0xC8] = "STN (Retentive Timer Current Value)",
}

-- Error codes - Enhanced with more specific error codes
MelsecErrorCodes = {
    [0x0000] = "No error",
    [0xC000] = "CPU module error",
    [0xC001] = "CPU module reset error",
    [0xC002] = "CPU module calculation error",
    [0xC003] = "CPU module operation error",
    [0xC050] = "Command not supported",
    [0xC051] = "Command format error",
    [0xC052] = "Command execution error (IP duplicate, etc.)",
    [0xC053] = "CPU monitoring timer timeout",
    [0xC054] = "Command format error (insufficient data)",
    [0xC055] = "Command execution error (hardware error, etc.)",
    [0xC056] = "Command execution error (path error)",
    [0xC057] = "Command execution error (data error)",
    [0xC058] = "Command execution error (request data error)",
    [0xC059] = "Command execution error (command error)",
    [0xC05A] = "Command execution error (CPU error)",
    [0xC05B] = "Command execution error (target CPU error)",
    [0xC05C] = "Command execution error (target station error)",
    [0xC05D] = "Command execution error (PLC already running)",
    [0xC05E] = "Command execution error (CPU busy)",
    [0xC05F] = "Command execution error (target CPU in STOP state)",
    [0xC060] = "Command execution error (request data error)",
    [0xC061] = "Command execution error (request data size error)",
    [0xC062] = "Command execution error (write protect error)",
    [0xC070] = "Memory access error (protected area)",
    [0xC071] = "Memory access error (address range error)",
    [0xC072] = "Memory access error (program in execution)",
    [0xC073] = "Memory access error (file error)",
    [0xC074] = "Memory access error (writing to ROM)",
    [0xC075] = "Memory access error (file name error)",
    [0xC076] = "Memory access error (device type error)",
    [0xC080] = "Network error (routing failure)",
    [0xC081] = "Network error (station unreachable)",
    [0xC082] = "Network error (network parameter error)",
    [0xC083] = "Network error (network communication error)",
    [0xC090] = "Access right error",
    [0xC091] = "Password error"
}

-- Frame types
MelsecFrameTypes = {
    [0x01] = "CPU to CPU", 
    [0x02] = "PLC to External Device",
    [0x03] = "3E Frame",
    [0x04] = "4E Frame",
}

-- Mode/Monitoring timer values to human-readable time
function melsec_monitoring_timer_value(value)
    if value == 0x0000 then
        return "10 seconds (default)"
    elseif value == 0xFFFF then
        return "No timeout (not recommended)"
    else
        return string.format("%d ms", value * 250)
    end
end

-- Parse MELSEC 3E frame header
function parse_melsec_3e_header(buffer, tree)
    if buffer:len() < 11 then
        tree:add_expert_info(expert.group.MALFORMED, expert.severity.ERROR, "Packet too short for MELSEC 3E frame")
        return nil
    end
    
    local header_tree = tree:add(buffer(0, 11), "MELSEC 3E Frame Header")
    
    -- Subheader
    header_tree:add(buffer(0, 1), string.format("Subheader: 0x%02X (%s)", 
        buffer(0, 1):uint(), buffer(0, 1):uint() == 0x50 and "Binary" or "ASCII"))
    
    -- Frame number
    header_tree:add(buffer(1, 1), string.format("Frame Number: 0x%02X", buffer(1, 1):uint()))
    
    -- Network number
    header_tree:add(buffer(2, 1), string.format("Network Number: 0x%02X", buffer(2, 1):uint()))
    
    -- PC number
    header_tree:add(buffer(3, 1), string.format("PC Number: 0x%02X", buffer(3, 1):uint()))
    
    -- Request destination module I/O number
    header_tree:add(buffer(4, 2), string.format("Destination Module I/O: 0x%04X", 
        buffer(4, 2):le_uint()))
    
    -- Request destination module station number
    header_tree:add(buffer(6, 1), string.format("Destination Station Number: 0x%02X", 
        buffer(6, 1):uint()))
    
    -- Request data length
    local data_len = buffer(7, 2):le_uint()
    header_tree:add(buffer(7, 2), string.format("Data Length: %d bytes", data_len))
    
    -- CPU monitoring timer
    local timer_val = buffer(9, 2):le_uint()
    header_tree:add(buffer(9, 2), string.format("Monitoring Timer: 0x%04X (%s)", 
        timer_val, melsec_monitoring_timer_value(timer_val)))
        
    return {
        is_binary = buffer(0, 1):uint() == 0x50,
        data_length = data_len,
        timer = timer_val
    }
end

-- Parse MELSEC command data
function parse_melsec_command(buffer, tree, is_request)
    if buffer:len() < 2 then return nil end
    
    local command = buffer(0, 2):le_uint()
    local command_str = MelsecCommands[command] or string.format("Unknown command (0x%04X)", command)
    
    local cmd_tree = tree:add(buffer(0, 2), string.format("Command: 0x%04X (%s)", command, command_str))
    
    -- If it's an unknown command, add expert info
    if not MelsecCommands[command] then
        cmd_tree:add_expert_info(expert.group.UNDECODED, expert.severity.NOTE, 
            string.format("Unknown MELSEC command: 0x%04X", command))
    end
    
    -- For specific well-known commands, provide additional parsing
    if command == 0x0401 then -- Device Read
        parse_melsec_device_read(buffer(2), cmd_tree, is_request)
    elseif command == 0x1401 then -- Device Write
        parse_melsec_device_write(buffer(2), cmd_tree, is_request)
    elseif command == 0x0157 then -- Read Module Type
        parse_melsec_module_type(buffer(2), cmd_tree, is_request)
    end
    
    -- Return command info
    return {
        command = command,
        command_name = command_str
    }
end

-- Parse MELSEC Device Read command
function parse_melsec_device_read(buffer, tree, is_request)
    if is_request then
        if buffer:len() >= 6 then
            local dev_code = buffer(0, 1):uint()
            local dev_code_str = MelsecDeviceCodes[dev_code] or string.format("Unknown (0x%02X)", dev_code)
            local head_device = buffer(1, 3):le_uint()
            local device_count = buffer(4, 2):le_uint()
            
            local params_tree = tree:add(buffer(0, 6), "Device Read Parameters")
            params_tree:add(buffer(0, 1), string.format("Device Code: 0x%02X (%s)", dev_code, dev_code_str))
            params_tree:add(buffer(1, 3), string.format("Head Device Number: %d", head_device))
            params_tree:add(buffer(4, 2), string.format("Device Count: %d", device_count))
        end
    else
        -- Response - show data values
        if buffer:len() > 0 then
            local data_tree = tree:add(buffer, "Read Data")
            local word_count = buffer:len() / 2
            
            for i=0, word_count-1 do
                if i*2+1 < buffer:len() then
                    data_tree:add(buffer(i*2, 2), string.format("Word[%d]: 0x%04X (%d)", 
                        i, buffer(i*2, 2):le_uint(), buffer(i*2, 2):le_uint()))
                end
            end
        end
    end
end

-- Parse MELSEC Device Write command
function parse_melsec_device_write(buffer, tree, is_request)
    if is_request and buffer:len() >= 6 then
        local dev_code = buffer(0, 1):uint()
        local dev_code_str = MelsecDeviceCodes[dev_code] or string.format("Unknown (0x%02X)", dev_code)
        local head_device = buffer(1, 3):le_uint()
        local device_count = buffer(4, 2):le_uint()
        
        local params_tree = tree:add(buffer(0, 6), "Device Write Parameters")
        params_tree:add(buffer(0, 1), string.format("Device Code: 0x%02X (%s)", dev_code, dev_code_str))
        params_tree:add(buffer(1, 3), string.format("Head Device Number: %d", head_device))
        params_tree:add(buffer(4, 2), string.format("Device Count: %d", device_count))
        
        -- Display write data
        if buffer:len() >= 6 + device_count * 2 then
            local data_tree = tree:add(buffer(6, device_count * 2), "Write Data")
            for i = 0, device_count - 1 do
                if 6 + i*2+1 < buffer:len() then
                    data_tree:add(buffer(6 + i * 2, 2), string.format("Word[%d]: 0x%04X (%d)", 
                        i, buffer(6 + i * 2, 2):le_uint(), buffer(6 + i * 2, 2):le_uint()))
                end
            end
        end
    end
end

-- Parse MELSEC Module Type command (0x0157)
function parse_melsec_module_type(buffer, tree, is_request)
    if not is_request and buffer:len() >= 20 then
        -- This decodes the response to the Read Module Type command
        local module_tree = tree:add(buffer(0, 20), "Module Information")
        
        -- Module type code
        module_tree:add(buffer(0, 2), string.format("Module Type Code: 0x%04X", 
            buffer(0, 2):le_uint()))
            
        -- Module name (typically ASCII)
        local module_name = ""
        for i=2, 17 do
            if buffer(i, 1):uint() >= 32 and buffer(i, 1):uint() < 127 then
                module_name = module_name .. string.char(buffer(i, 1):uint())
            end
        end
        module_tree:add(buffer(2, 16), string.format("Module Name: %s", module_name))
        
        -- Module version
        module_tree:add(buffer(18, 2), string.format("Module Version: %d.%d", 
            buffer(18, 1):uint(), buffer(19, 1):uint()))
    end
end

-- Display MELSEC device data
function display_melsec_device_data(buffer, tree, device_code, count, is_bit)
    local deviceType = MelsecDeviceCodes[device_code] or string.format("Unknown (0x%02X)", device_code)
    local data_tree = tree:add(buffer, string.format("Device Data (%s)", deviceType))
    
    if is_bit then
        -- Bit devices
        for i=0, math.ceil(count/16)-1 do
            if buffer:len() >= (i+1)*2 then
                local word_val = buffer(i*2, 2):le_uint()
                local bits_str = ""
                for bit=0, 15 do
                    if bit < count or count % 16 == 0 then
                        local bit_val = bit32.extract(word_val, bit, 1)
                        bits_str = bits_str .. bit_val
                    end
                end
                data_tree:add(buffer(i*2, 2), string.format("Word %d: 0x%04X - Bits: %s", 
                    i, word_val, bits_str))
            end
        end
    else
        -- Word devices
        for i=0, count-1 do
            if buffer:len() >= (i+1)*2 then
                data_tree:add(buffer(i*2, 2), string.format("Word %d: 0x%04X (%d)", 
                    i, buffer(i*2, 2):le_uint(), buffer(i*2, 2):le_uint()))
            end
        end
    end
end

-- Check if a device is a bit device
function is_bit_device(device_code)
    -- These are bit device codes
    local bit_devices = {
        [0x90] = true, -- M
        [0x91] = true, -- SM
        [0x92] = true, -- L
        [0x93] = true, -- F
        [0x94] = true, -- V
        [0x95] = true, -- S
        [0x98] = true, -- S (Link)
        [0x9C] = true, -- X
        [0x9D] = true, -- Y
        [0xA0] = true, -- B
        [0xA1] = true, -- SB
        [0xA2] = true, -- DX
        [0xA3] = true  -- DY
    }
    
    return bit_devices[device_code] or false
end

-- Parse MELSEC error details
function parse_melsec_error(buffer, tree)
    if buffer:len() < 2 then return end
    
    local error_code = buffer(0, 2):le_uint()
    local error_desc = MelsecErrorCodes[error_code] or "Unknown error"
    
    local error_tree = tree:add(buffer(0, 2), string.format("Error: 0x%04X - %s", 
        error_code, error_desc))
        
    -- Add expert info for errors
    if error_code ~= 0 then
        local severity = expert.severity.WARN
        if error_code >= 0xC070 then 
            severity = expert.severity.ERROR
        elseif error_code >= 0xC050 then
            severity = expert.severity.WARN
        end
        
        error_tree:add_expert_info(expert.group.RESPONSE_CODE, severity, 
            string.format("MELSEC Error: %s", error_desc))
    end
    
    return error_code
end
