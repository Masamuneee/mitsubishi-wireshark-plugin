------------------------------------------------------------------------------------------------------------
--
-- CC-Link SLMP(SeamLess Message Protocol)Command analysis definition file
--
-- revision : 03
-- date     : 2024/3/20
--
-- Copyright(C) CC-Link Partner Association All Rights Reserved     
------------------------------------------------------------------------------------------------------------
-- commandListTable
local CmdStrList = {
--   command value   command name									              Port
--	============================================================================================================================
	
	["0401"     ] = {"Device::Read",								Slmp0401 ,	  nil				},	-- Read
	["0403"     ] = {"Device::ReadRandom",							Slmp0403 ,	  nil				},	-- ReadRandom
	["0406"     ] = {"Device::ReadBlock",							Slmp0406 ,	  nil				},	-- ReadBlock
	["1401"     ] = {"Device::Write",								Slmp1401 ,	  nil				},	-- Write
	["1402"     ] = {"Device::WriteRandom",							Slmp1402 ,	  nil				},	-- WriteRandom
	["1406"     ] = {"Device::WriteBlock",							Slmp1406 ,	  nil				},	-- WriteBlock
	["0801"     ] = {"Device::EntryMonitorDevice",					Slmp0801 ,	  nil				},	-- EntryMonitorDevice
	["0802"     ] = {"Device::ExecuteMonitorDevice",				Slmp0802 ,	  nil				},	-- ExecuteMonitorDevice
	
	["041A"     ] = {"Label::ArrayLabelRead",						Slmp041A ,	  nil				},	-- ArrayLabelRead
	["041C"     ] = {"Label::LabelReadRandom",						Slmp041C ,	  nil				},	-- LabelReadRandom
	["141A"     ] = {"Label::ArrayLabelWrite",						Slmp141A ,	  nil				},	-- ArrayLabelWrite
	["141B"     ] = {"Label::LabelWriteRandom",						Slmp141B ,	  nil				},	-- LabelWriteRandom
	
	["0613"     ] = {"Memory::Read",								Slmp0613 ,	  nil				},	-- Read
	["1613"     ] = {"Memory::Write",								Slmp1613 ,    nil				},	-- Write
	
	["0601"     ] = {"ExtendUnit::Read",							Slmp0601 ,	  nil				},	-- Read
	["1601"     ] = {"ExtendUnit::Write",							Slmp1601 ,	  nil				},	-- Write
	
	["1001"     ] = {"RemoteControl::RemoteRun",					Slmp1001 ,	  nil				},	-- RemoteRun
	["1002"     ] = {"RemoteControl::RemoteStop",					Slmp1002 ,	  nil				},	-- RemoteStop
	["1003"     ] = {"RemoteControl::RemotePause",					Slmp1003 ,	  nil				},	-- RemotePause
	["1005"     ] = {"RemoteControl::RemoteLatchClear",				Slmp1005 ,	  nil				},	-- RemoteLatchClear
	["1006_0000"] = {"RemoteControl::RemoteReset",					Slmp1006 ,	  nil				},	-- RemoteReset
	["1006_0001"] = {"RemoteControl::RemoteReset(with response)",	Slmp1006 ,	  nil				},	-- RemoteReset (with response)
	["0101"     ] = {"RemoteControl::RemoteReadTypeName",			Slmp0101 ,	  nil				},	-- RemoteReadTypeName
	
	["1630"     ] = {"Remote_Password::Unlock",						nil      ,	  nil				},
	["1631"     ] = {"Remote_Password::Lock",						nil      ,	  nil				},
	
	["1810"     ] = {"File::ReadDirectoryFile",						Slmp1810 ,	  nil				},	-- ReadDirectoryFile
	["1811"     ] = {"File::SearchDirectoryFile",					Slmp1811 ,	  nil				},	-- SearchDirectoryFile
	["1820"     ] = {"File::New_File(AccessType-B)",				nil      ,	  nil				},
	["1822"     ] = {"File::Delete_File(AccessType-B)",				nil      ,	  nil				},
	["1824"     ] = {"File::Copy_File(AccessType-B)",				nil      ,	  nil				},
	["1825"     ] = {"File::Change_File_State",						nil      ,	  nil				},
	["1826"     ] = {"File::Change_File_Date",						nil      ,	  nil				},
	["1827"     ] = {"File::OpenFile",								Slmp1827 ,	  nil				},	-- OpenFile
	["1828"     ] = {"File::ReadFile",								Slmp1828 ,	  nil				},	-- ReadFile
	["1829"     ] = {"File::WriteFile",								Slmp1829 ,	  nil				},	-- WriteFile
	["182A"     ] = {"File::CloseFile",								Slmp182A ,	  nil				},	-- CloseFile
	["0619"     ] = {"Self_Test",									nil      ,	  nil				},
	["1617"     ] = {"Clear_Error",									nil      ,	  nil				},
	["1619"     ] = {"Clear Error History",							nil      ,	  nil				},
	["2101"     ] = {"Ondemand",									nil      ,	  nil				},
	
	["0205"     ] = {"Drive::Read Disk state",						nil      ,	  nil				},
	["1207"     ] = {"Drive::Defrag",								nil      ,	  nil				},
	["0201"     ] = {"File::ReadFileInfo_FileInfo",					Slmp0201 ,	  nil				},	-- ReadFileInfo(FileInfo)
	["0202"     ] = {"File::ReadFileInfo_FileInfoDetail",			Slmp0202 ,	  nil				},	-- ReadFileInfo(FileInfoDetail)
	["0203"     ] = {"File::FileSearch",							Slmp0203 ,	  nil				},	-- FileSearch
	["0204"     ] = {"File::Read_File_Info",						nil      ,	  nil				},
	["0206"     ] = {"File::Read",									Slmp0206 ,	  nil				},	-- Read
	["0808"     ] = {"File::Set/Reset Filelock",					nil      ,	  nil				},
	["1202"     ] = {"File::New_File(AccessType-A)",				nil      ,	  nil				},
	["1203"     ] = {"File::Write",									Slmp1203 ,	  nil				},	-- Write
	["1204"     ] = {"File::Change_File_Info",						nil      ,	  nil				},
	["1205"     ] = {"File::Delete_File(AccessType-A)",				nil      ,	  nil				},
	["1206"     ] = {"File::Copy_File(AccessType-A)",				nil      ,	  nil				},
	
	["3070"     ] = {"NodeIndication",								Slmp3070 ,	  nil				},	-- NodeIndication
	["4000"     ] = {"Connecting",									nil      ,	  nil				},
	["4001"     ] = {"Verifying connection",						nil      ,	  nil				},
	["4002"     ] = {"Data collection",								nil      ,	  nil				},
	["4003"     ] = {"Distributing",								nil      ,	  nil				},
	["4020_0001"] = {"CAN::ReadObject",								Slmp4020 ,	  nil				},	-- ReadObject
	["4020_0002"] = {"CAN::WriteObject",							Slmp4020 ,	  nil				},	-- WriteObject
	["4020_0003"] = {"CAN::ObjectIDReadBlock",						Slmp4020 ,	  nil				},	-- ObjectIDReadBlock
	["4020_0004"] = {"CAN::ObjectIDWriteBlock",						Slmp4020 ,	  nil				},	-- ObjectIDWriteBlock
	["4020_0005"] = {"CAN::ObjectSubIDReadBlock",					Slmp4020 ,	  nil				},	-- ObjectSubIDReadBlock
	["4020_0006"] = {"CAN::ObjectSubIDWriteBlock",					Slmp4020 ,	  nil				},	-- CObjectSubIDWriteBlock
	["4020_0007"] = {"CAN::NmtStateUpload",							Slmp4020 ,	  nil				},	-- NmtStateUpload
	["4020_0008"] = {"CAN::NmtStateDownload",						Slmp4020 ,	  nil				},	-- NmtStateDownload
	["4020_0009"] = {"CAN::GetOdList",								Slmp4020 ,	  nil				},	-- GetOdList
	["4020_000A"] = {"CAN::GetObjectDescription",					Slmp4020 ,	  nil				},	-- GetObjectDescription
	["4020_000B"] = {"CAN::GetEntryDescription",					Slmp4020 ,	  nil				},	-- GetEntryDescription
	["5000"     ] = {"Accessing IO-Link",							nil      ,	  nil				},
	["5001"     ] = {"Transfer to MODBUS/TCP network",				nil      ,	  nil				},
	["5002"     ] = {"Transfer to MODBUS-RTU network",				nil      ,	  nil				},
	["3119"     ] = {"Acquiring information of selected station",	nil      ,	  nil				},
	["3040"     ] = {"Communication test",							nil      ,	  nil				},
	["3050"     ] = {"Cable test",									nil      ,	  nil				},
	
	["0E28"     ] = {"DeviceIdentificationInfoGet",					Slmp0E28 ,{	45237			}	},	-- DeviceIdentificationInfoGet
	["0E29"     ] = {"DataMonitoring",								Slmp0E29 ,{	45237			}	},	-- DataMonitoring
	["0E30"     ] = {"NodeSearch",									Slmp0E30 ,	  nil				},	-- NodeSearch
	["0E31"     ] = {"IPAddressSet",								Slmp0E31 ,{	45237	,45239	}	},	-- IPAddressSet
	["0E32"     ] = {"DeviceInfoCompare",							Slmp0E32 ,{	45237			}	},	-- DeviceInfoCompare
	["0E33"     ] = {"ParameterGet",								Slmp0E33 ,{	45237			}	},	-- ParameterGet
	["0E34"     ] = {"ParameterSet",								Slmp0E34 ,{	45237			}	},	-- ParameterSet
	["0E35"     ] = {"ParameterSetStart",							Slmp0E35 ,{	45237			}	},	-- ParameterSetStart
	["0E36"     ] = {"ParameterSetEnd",								Slmp0E36 ,{	45237			}	},	-- ParameterSetEnd
	["0E3A"     ] = {"ParameterSetCancel",							Slmp0E3A ,{	45237			}	},	-- ParameterSetCancel
	["0E44"     ] = {"StatusRead",									Slmp0E44 ,{	45237			}	},	-- StatusRead
	["0E45"     ] = {"CommunicationSettingGet",						Slmp0E45 ,{	45237			}	},	-- CommunicationSettingGet
	["0E53"     ] = {"StatusRead2",									Slmp0E53 ,{	45237			}	},	-- StatusRead2
	
	["0E90_0000"] = {"NetworkConfigMain",							Slmp0E90 ,{	45238			}	},	-- NetworkConfigMain
	["0E90_0001"] = {"NetworkConfigTslt",							Slmp0E90 ,{	45238			}	},	-- NetworkConfigTslt
	["0E91"     ] = {"MasterConfig",								Slmp0E91 ,{	45238			}	},	-- MasterConfig
	["0E92"     ] = {"SlaveConfig",									Slmp0E92 ,{	45238			}	},	-- SlaveConfig
	["0E93_0000"] = {"CyclicConfigMain",							Slmp0E93 ,{	45238			}	},	-- CyclicConfigMain
	["0E93_0001"] = {"CyclicConfigTrnSubPayload",					Slmp0E93 ,{	45238			}	},	-- CyclicConfigTrnSubPayload
	["0E93_0002"] = {"CyclicConfigRcvSubPayload",					Slmp0E93 ,{	45238			}	},	-- CyclicConfigRcvSubPayload
	["0E93_0003"] = {"CyclicConfigRcvSrcInfo",						Slmp0E93 ,{	45238			}	},	-- CyclicConfigRcvSrcInfo
	["0E94"     ] = {"Notification",								Slmp0E94 ,{	45238			}	},	-- Notification
	
	["3072"     ] = {"CommunicationSpeed",							Slmp3072 ,{	45239			}	},	-- CommunicationSpeed
	["0EB0"     ] = {"GetCommunicationSet",							Slmp0EB0 ,{	45239			}	},	-- GetCommunicationSet
	["0EB1"     ] = {"Acquiring the specified station sub ID",		nil      ,{	45239			}	},
	["0EB2"     ] = {"GetDeviceInfo",								Slmp0EB2 ,	user_specific_port	},	-- GetDeviceInfo
	["0EB3"     ] = {"Notifying of backup start",					nil      ,	user_specific_port	},
	["0EB4"     ] = {"EndBackup",									Slmp0EB4 ,	user_specific_port	},	-- EndBackup
	["0EB5"     ] = {"RequestBackup",								Slmp0EB5 ,	user_specific_port	},	-- RequestBackup
	["0EB6"     ] = {"GetBackupPrm",								Slmp0EB6 ,	user_specific_port	},	-- GetBackupPrm
	["0EB7"     ] = {"Checking the restoration availability",		nil      ,	user_specific_port	},
	["0EB8"     ] = {"StartRestore",								Slmp0EB8 ,	user_specific_port	},	-- StartRestore
	["0EB9"     ] = {"EndRestore",									Slmp0EB9 ,	user_specific_port	},	-- EndRestore
	["0EBA"     ] = {"SetBackupPrm",								Slmp0EBA ,	user_specific_port	},	-- SetBackupPrm
	["0EBE"     ] = {"CheckPrmDelivery",							Slmp0EBE ,	user_specific_port	},	-- CheckPrmDelivery
	["161A"     ] = {"ClearEventHistory",							Slmp161A ,{	45239			}	},	-- ClearEventHistory
	["3060"     ] = {"GetEventNum",									Slmp3060 ,{	45239			}	},	-- GetEventNum
	["3061"     ] = {"GetEventHistory",								Slmp3061 ,{	45239			}	},	-- GetEventHistory
	["3062"     ] = {"ClockOffsetDataSend",							Slmp3062 ,{	45239			}	},	-- ClockOffsetDataSend
	["3206"     ] = {"StopOwnStationCyclic",						Slmp3206 ,{	45239			}	},	-- StopOwnStationCyclic
	["3207"     ] = {"StartOwnStationCyclic",						Slmp3207 ,{	45239			}	},	-- StartOwnStationCyclic
	["3208"     ] = {"StopOtherStationsCyclic",						Slmp3208 ,{	45239			}	},	-- StopOtherStationsCyclic
	["3209"     ] = {"StartOtherStationsCyclic",					Slmp3209 ,{	45239			}	},	-- StartOtherStationsCyclic
	["320A"     ] = {"LinkDevicePrmWrite",							Slmp320A ,{	45239			}	},	-- LinkDevicePrmWrite
	["320B"     ] = {"LinkDevicePrmWriteCheckReq",					Slmp320B ,{	45239			}	},	-- LinkDevicePrmWriteCheckReq
	["320C"     ] = {"LinkDevicePrmWriteCheckResp",					Slmp320C ,{	45239			}	},	-- LinkDevicePrmWriteCheckResp
	["320D"     ] = {"RsvStationConfigTemporaryRelease",			Slmp320D ,{	45238			}	},	-- RsvStationConfigTemporaryRelease
	["3210"     ] = {"SetWatchdogCounterInfo",						Slmp3210 ,{	45239			}	},	-- SetWatchdogCounterInfo
	["3211"     ] = {"WatchdogCounterOffsetConfig",					Slmp3211 ,{	45239			}	},	-- WatchdogCounterOffsetConfig
	["3230"     ] = {"NodeInfoAccept",								Slmp3230 ,{	45239			}	},	-- NodeInfoAccept
	
	["0E30_0000"     ] = {"NodeSearch",								Slmp0E30 ,	  nil				},	-- NodeSearch
	["0E30_0001"     ] = {"NodeSearch",								Slmp0E30 ,	  nil				},	-- NodeSearch
	["3063"     ] = {"NetworkClockDataSend",						Slmp3063 ,{	45239			}	},	-- NetworkClockDataSend
	["3080"     ] = {"FuncSettingInfoGet",							Slmp3080 ,	  nil				},	-- FuncSettingInfoGet
	["3081"     ] = {"FuncSettingRead",								Slmp3081 ,	  nil				},	-- FuncSettingRead
	["3082"     ] = {"FuncSettingWrite",							Slmp3082 ,	  nil				},	-- FuncSettingWrite
}

-- Enhanced command categories for better grouping in the UI
local CmdCategories = {
	["Device"] = "Device access operations",
	["Label"] = "Label operations",
	["Memory"] = "Memory access operations",
	["ExtendUnit"] = "Extend unit operations",
	["RemoteControl"] = "Remote control operations",
	["Remote_Password"] = "Remote password operations",
	["File"] = "File operations",
	["CAN"] = "CAN communication operations"
}

-- Human readable command descriptions
local CmdDescriptions = {
	["0401"] = "Read data from specified devices",
	["0403"] = "Read data from multiple random devices",
	["0406"] = "Read a block of data from consecutive devices",
	["1401"] = "Write data to specified devices",
	["1402"] = "Write data to multiple random devices",
	["1406"] = "Write a block of data to consecutive devices",
	["0101"] = "Read CPU model name and code",
	["0E30"] = "Search nodes on the network",
	["0E31"] = "Set IP address for a node",
	-- Add more as needed
}

-- Convert table:EndCode->Error
ExitCode = {
	[0x0000] = "The request was processed normally."																				,
	[0xC059] = "There is a mistake in the command and sub-command specification."													,
	[0xC05C] = "There is a mistake in the request message."																			,
	[0xC061] = "The request data length does not match the number of data."															,
	[0xCEE0] = "The request cannot be processed because another request is being executed."											,
	[0xCEE1] = "The request message size exceeds the range that can be processed."													,
	[0xCEE2] = "The response message size exceeds the range that can be processed."													,
	[0xCF10] = "The specified server informationnumber does not exist."																,
	[0xCF20] = "An item that cannot be set is included in the request message."														,
	[0xCF30] = "A specified parameter ID does not exist."																			,
	[0xCF31] = "The request cannot be processed because the writing mutual exclusion start process has not been performed."			,
	[0xCF70] = "The request cannot be processed because an error occurred on the communication path to the relay destination."		,
	[0xCF71] = "Processing was stopped because a timeout occurred."		 															,
	[0xCCC7] = "An object was accessed under a condition in which access to the object is not allowed."								,
	[0xCCC8] = "A write-only object was accessed for reading."																		,
	[0xCCC9] = "A read-only object was accessed for writing."																		,
	[0xCCCA] = "An object that is not defined in the object dictionary was accessed."												,
	[0xCCCB] = "An object for which PDO mapping is not allowed was mapped."															,
	[0xCCCC] = "The number of data or data length total for PDO mapping exceeds the value defined in the application, etc."			,
	[0xCCD0] = "Items in a frame structure at request do not match with the specifications."										,
	[0xCCD1] = "The size of an item in a frame structure at request is bigger than the specifications."								,
	[0xCCD2] = "The size of an item in a frame structure at request is smaller than the specifications."							,
	[0xCCD3] = "A SubIndex that does not exist was specified."																		,
	[0xCCD4] = "An invalid parameter value was set."																				,
	[0xCCD5] = "A value larger than the parameter range was set."		 															,
	[0xCCD6] = "A value smaller than the parameter range was set."																	,
	[0xCCDA] = "The application cannot transmit or store the data."		 															,
	[0xCCFF] = "Other than the above"																								,
	[0xCF00] = "The gateway device on which the protocol conversion models are implemented detected an error."						,
	[0xCF40] = "The divided messages for the total division number could not be received within the time."		 					,
	[0xCF41] = "The divided messages with the same divided data number were received."												,
	[0xCF42] = "Divided message data error."		 																				,
	[0xCF43] = "The message was lost due to an error occurred in the receive side."													,
	[0xCF44] = "The request target does not support division."		 																,
}

-- Header Field Table
local stHeaderTbl = {
	[0x5000] = "rdReqST-PDU, wrReqST-PDU, odReqST-PDU",
	[0xD000] = "rdResST-PDU, wrResST-PDU, rdErrST-PDU, wrErrST-PDU",
}
local mtHeaderTbl = {
	[0x5400] = "rdReqMT-PDU, wrReqMT-PDU, odReqMT-PDU",
	[0x5500] = "reqEMT-PDU, pushEMT-PDU",
	[0x6800] = "reqLMT-PDU",
	[0xD400] = "rdResMT-PDU, wrResMT-PDU, rdErrMT-PDU, wrErrMT-PDU",
	[0xD500] = "resEMT-PDU",
	[0xE800] = "resLMT-PDU, errLMT-PDU",
}

-- Add severity levels to error codes for better visual identification
local ErrorSeverities = {
	[0xC059] = "ERROR",
	[0xC05C] = "ERROR",
	[0xC061] = "ERROR",
	[0xCEE0] = "WARNING",
	[0xCEE1] = "WARNING",
	[0xCEE2] = "WARNING",
	[0xCF10] = "NOTICE",
	-- Add more as needed
}

-- Enhanced request/response types
local ReqResTypes = {
	["req"] = "Request",
	["res"] = "Response",
	["err"] = "Error Response"
}
local dstProcNoTbl = {
	[0x03D0] = "Control system processor",
	[0x03D1] = "Standby system processor",
	[0x03D2] = "A system processor",
	[0x03D3] = "B system processor",
	[0x03E0] = "Multi-processor unit No. 1",
	[0x03E1] = "Multi-processor unit No. 2",
	[0x03E2] = "Multi-processor unit No. 3",
	[0x03E3] = "Multi-processor unit No. 4",
	[0x03FF] = "Default (system definition) processor",
}
local timerTbl = {
	[0x0000] = "Waits infinitely"
	-- 0x0001 to 0xFFFF = "Wait time (in 250ms increments)"
}

-- DeviceCode
local DevCodeBIN = {
	["91"] = "SM",
	["A9"] = "SD",
	["9C"] = "X",
	["9D"] = "Y",
	["90"] = "M",
	["92"] = "L",
	["93"] = "F",
	["94"] = "V",
	["A0"] = "B",
	["A8"] = "D",
	["B4"] = "W",
	["C1"] = "TS",
	["C0"] = "TC",
	["C2"] = "TN",
	["51"] = "LTS",
	["50"] = "LTC",
	["52"] = "LTN",
	["C7"] = "STS",
	["C6"] = "STC",
	["C8"] = "STN",
	["59"] = "LSTS",
	["58"] = "LSTC",
	["5A"] = "LSTN",
	["C4"] = "CS",
	["C3"] = "CC",
	["C5"] = "CN",
	["55"] = "LCS",
	["54"] = "LCC",
	["56"] = "LCN",
	["A1"] = "SB",
	["B5"] = "SW",
	["98"] = "S",
	["A2"] = "DX",
	["A3"] = "DY",
	["CC"] = "Z",
	["62"] = "LZ",
	["AF"] = "R",
	["B0"] = "ZR",
	["AB"] = "G"
}

-- Drive No
local DriveBIN = {
	[0] = "Processor internal program memory",
	[1] = "Memory card (RAM) - SRAM card",
	[2] = "Memory card (ROM) - Flash card, ATA card",
	[3] = "Processor internal standard RAM",
	[4] = "Processor internal standard ROM"
}

-- Drive Name
local DriveName_tbl = {
	["0000"] = "Internal memory (internal RAM)",
	["0001"] = "RAM area on memory card A",
	["0002"] = "ROM area on memory card A",
	["0003"] = "RAM area on memory card B",
	["0004"] = "ROM area on memory card B",
	["000F"] = "Drive where the parameter file currently used is stored"
}

function slmp_frame_analyze(buffer,pinfo,subtree,portNumber_check)
	local protocolText
	local infoText
	local summaryText
	local len
	local parser = parse_Unknown
	local key_,params_
	local pattern = nil
	
	-- patternTable
	local pattern_tbl ={
	--  Kye    [1]encoding  [2]kind [3]parser [4]Frame Analyze   [5]CMD
	--  ----------------------------------------------------------------------------
		["5000"]={  "ASC" , "ST"  ,"REQ"   ,parse_ASC_ST_REQ   ,    22   },	-- ( 1) ST Frame Request(ASCII)
		["D000"]={  "ASC" , "ST"  ,"RES"   ,parse_ASC_ST_RES   ,   nil   },	-- ( 2) ST Frame Response(ASCII)
		["5400"]={  "ASC" , "MT"  ,"REQ"   ,parse_ASC_MT_REQ   ,    30   },	-- ( 3) MT Frame Request(ASCII)
		["D400"]={  "ASC" , "MT"  ,"RES"   ,parse_ASC_MT_RES   ,   nil   },	-- ( 4) MT Frame Response(ASCII)
		["5500"]={  "ASC" , "EMT" ,"REQ"   ,parse_ASC_EMT_REQ  ,    40   },	-- ( 5) EMT Frame Request(ASCII)
		["D500"]={  "ASC" , "EMT" ,"RES"   ,parse_ASC_EMT_RES  ,    40   },	-- ( 6) EMT Frame Response(ASCII)
		[0x5000]={  "BIN" , "ST"  ,"REQ"   ,parse_BIN_ST_REQ   ,    11   },	-- ( 7) ST Frame Request(Binary)
		[0xD000]={  "BIN" , "ST"  ,"RES"   ,parse_BIN_ST_RES   ,   nil   },	-- ( 8) ST Frame Response(Binary)
		[0x5400]={  "BIN" , "MT"  ,"REQ"   ,parse_BIN_MT_REQ   ,    15   },	-- ( 9) MT Frame Request(Binary)
		[0xD400]={  "BIN" , "MT"  ,"RES"   ,parse_BIN_MT_RES   ,   nil   },	-- (10) MT Frame Response(Binary)
		[0x5500]={  "BIN" , "EMT" ,"REQ"   ,parse_BIN_EMT_REQ  ,    20   },	-- (11) EMT Frame Request(Binary)
		[0xD500]={  "BIN" , "EMT" ,"RES"   ,parse_BIN_EMT_RES  ,    20   },	-- (12) EMT Frame Response(Binary)
		[0x6800]={  "BIN" , "LMT" ,"REQ"   ,parse_BIN_LMT_REQ  ,    18   },	-- (13) LMT Frame Request(Binary)
		[0xE800]={  "BIN" , "LMT" ,"RES"   ,parse_BIN_LMT_RES  ,    18   } 	-- (14) LMT Frame Response(Binary)
	}
	
	len = buffer:len()
	if( len >= 4 ) then
		for key_,params_ in pairs(pattern_tbl) do
			local encoding_  = params_[1]	--	"ASC" or "BIN"
			local value_     = nil
			if     (encoding_  == "ASC" ) then value_ = buffer(0,4):string();
			elseif (encoding_  == "BIN" ) then value_ = buffer(0,2):uint()  ;
			end
			
			if ( key_ == value_ ) then
				pattern = params_
				break
			end
		end
	end
	
	if pattern ~= nil then
		local encoding_  = pattern[1]
		local kind_      = pattern[2]
		local ReqRes_    = pattern[3]
		local parser_    = pattern[4]
		local cmdpos_    = pattern[5]
		local commandName, commandFunc

		parser           = parser_						-- Frame Analyze
		if cmdpos_ ~= nil then
			local  strcmd ,strsubcmd 
			if     (encoding_  == "ASC" ) then strcmd = buffer(cmdpos_,4):string()    ; strsubcmd = buffer(cmdpos_+4,4):string()    ;
			elseif (encoding_  == "BIN" ) then strcmd = hexToStr(buffer(cmdpos_,2), 4); strsubcmd = hexToStr(buffer(cmdpos_+2,2), 4);
			end
			commandName, commandFunc, expectedPort = getCommandInfo(strcmd, strsubcmd)
		else
			commandName = "---"
		end
		
		if (portNumber_check) then 
			local check_result = check_port_number(ReqRes_,expectedPort,pinfo)
			if check_result ~= nil then
				SLMPwarn(subtree,check_result)
			end
		end
		
		protocolText     = "SLMP("..encoding_.."/"..kind_..")"			-- Protocol Name (exp: "SLMP(BIN/LMT)" )
		infoText    = commandName.. " [".. ReqRes_ .."]"
		summaryText = "SLMP "..ReqRes_.."_Data on "..encoding_.."/"..kind_.." Frame [" .. commandName .. "]"
	else
		protocolText= "SLMP"
		infoText    = "Data on Unknown Frame"
		summaryText = "SLMP Data : "..buffer(0)
	end
	
	pinfo.cols.protocol = protocolText
	pinfo.cols.info     = infoText

	subtree:set_text(summaryText)
	parser(buffer,pinfo,subtree)

end

function parse_ASC_ST_REQ(buffer,pinfo,tree)
	local req_data
	local cmd_data
	local ascii_cmd			= buffer(22,4):string()
	local ascii_sub_cmd		= buffer(26,4):string()
	local asclen	= buffer(14,4):string().." ("..tonumber(buffer(14,4):string(),16)..")"
	local asctim	= buffer(18,4):string().." ("..tonumber(buffer(18,4):string(),16)..")"
	local commandName
	local commandFunc
	local subhead
	local strFType
	local strNodeNo
	local strDstProc
	local strTimer
	
	strFType   = string.format("0x%s (%s)", buffer(0,4):string(), lookup(tonumber(buffer(0,4):string(),16), stHeaderTbl, "For future expansion"))
	strNodeNo  = string.format("0x%s (%s)", buffer(6,2):string(),getNodeNo(tonumber(buffer(4,2):string(),16),tonumber(buffer(6,2):string(),16)))
	strDstProc = string.format("0x%s (%s)", buffer(8,4):string(), lookup(tonumber(buffer(8,4):string(),16), dstProcNoTbl, "For future expansion"))
	strTimer   = string.format("0x%s (%s)", buffer(18,4):string(), lookup(tonumber(buffer(18,4):string(),16), timerTbl, "Wait time (in 250ms increments)"))
	
	tree:add(			Fs["slmp.a.st_header"	], 				buffer(0,4), strFType)						-- Frame type
	
	subhead = tree:add(	Fs["slmp.a.sub_header"	],				buffer(4,18))
	subhead:add(		Fs["slmp.a.net_num"		], 				buffer(4,2), "0x"..buffer(4,2):string())	-- Network number of request destination station
	subhead:add(		Fs["slmp.a.node_num"	],				buffer(6,2), strNodeNo)						-- Station number of request destination station
	subhead:add(		Fs["slmp.a.dstproc_num"	],				buffer(8,4), strDstProc)					-- Processor number of request destination station
	subhead:add(		Fs["slmp.a.reserved1"	],				buffer(12,2), "0x"..buffer(12,2):string())	-- For future expansion
	subhead:add(		Fs["slmp.a.length"		],				buffer(14,4), "0x"..buffer(14,4):string())	-- Request data length
	if "2101" == ascii_cmd then
		subhead:add(	Fs["slmp.a.reserved2"	],				buffer(18,4), "0x"..buffer(18,4):string())	-- For future expansion
	else
		subhead:add(	Fs["slmp.a.timer"		],				buffer(18,4), strTimer)						-- Timer
	end
	cmd_data = tree:add(Fs["slmp.a.cmd"			], 				buffer(22,4), "0x"..buffer(22,4):string())	-- Command
	
	-- Add human-readable command information
	if CmdStrList[ascii_cmd] then
		local cmd_info = CmdStrList[ascii_cmd][1]
		local cmd_parts = split_string(cmd_info, "::")
		
		if #cmd_parts >= 2 then
			local category = cmd_parts[1]
			local operation = cmd_parts[2]
			
			cmd_data:append_text(" - " .. category .. ": " .. operation)
			
			-- Add command description if available
			if CmdDescriptions[ascii_cmd] then
				cmd_data:add_expert_info(expert.group.PROTOCOL, expert.severity.COMMENT, 
					CmdDescriptions[ascii_cmd])
			end
		end
	end
	
	tree:add(			Fs["slmp.a.sub_cmd"		],				buffer(26,4), "0x"..buffer(26,4):string())	-- Sub-command
	
	req_data = tree:add(Fs["slmp.a.reqdata"], 					buffer(22))
	commandName, commandFunc = getCommandInfo(ascii_cmd, ascii_sub_cmd)
	
	if(commandName and commandFunc) then
		req_data:append_text(" - " .. commandName)
		req_data:add_proto_expert_info(expert.group.PROTOCOL, expert.severity.COMMENT, 
			"Command handler: " .. commandName)
		commandFunc(buffer(30), ascii_sub_cmd, req_data, true, false)
	else
		req_data:add(buffer(30),  "Others    : " .. buffer(30):string())
	end
end

-- Split string helper function
function split_string(str, delimiter)
	local result = {}
	if not str then return result end
	
	for match in (str..delimiter):gmatch("(.-)"..delimiter) do
		table.insert(result, match)
	end
	return result
end

function parse_ASC_ST_RES(buffer,pinfo,tree)
	local exitcode	= buffer(18,4):string()
	local len		= tonumber(buffer(14,4):string(),16)
	local subhead
	local strFType
	local strNodeNo
	local strDstProc
	local strEndCode
	
	
	strFType   = string.format("0x%s (%s)", buffer(0,4):string(), lookup(tonumber(buffer(0,4):string(),16), stHeaderTbl, "For future expansion"))
	strNodeNo  = string.format("0x%s (%s)", buffer(6,2):string(),getNodeNo(tonumber(buffer(4,2):string(),16),tonumber(buffer(6,2):string(),16)))
	strDstProc = string.format("0x%s (%s)", buffer(8,4):string(), lookup(tonumber(buffer(8,4):string(),16), dstProcNoTbl, "For future expansion"))
	strEndCode = string.format("%s (0x%s)", lookup(tonumber(buffer(18,4):string(),16), ExitCode, "Unknown"), buffer(18,4):string())
	
	tree:add(		Fs["slmp.a.st_header"	],   		buffer(0,4), strFType)						-- Frame type
	
	subhead = tree:add(Fs["slmp.a.sub_header"],			buffer(4,18))
	subhead:add(	Fs["slmp.a.net_num"		],	 		buffer(4,2), "0x"..buffer(4,2):string())	-- Network number of request destination station
	subhead:add(	Fs["slmp.a.node_num"	],			buffer(6,2), strNodeNo)						-- Station number of request destination station
	subhead:add(	Fs["slmp.a.dstproc_num"	],			buffer(8,4), strDstProc)					-- Processor number of request destination station
	subhead:add(	Fs["slmp.a.reserved1-1"	],			buffer(12,2),"0x"..buffer(12,2):string())	-- For future expansion
	subhead:add(	Fs["slmp.a.length"		],			buffer(14,4),"0x"..buffer(14,4):string())	-- Response data length
	subhead:add(	Fs["slmp.a.exit_code"	], 			buffer(18,4),strEndCode)					-- End code
	
	if( exitcode == "0000" ) then
		-- Normal Termination
		if 4 < len then
			tree:add(Fs["slmp.a.resdata"	],			buffer(22))
		end
	else
		-- Abnormal Termination
		strNodeNo  = string.format("0x%s (%s)", buffer(24,2):string(),getNodeNo(tonumber(buffer(22,2):string(),16),tonumber(buffer(24,2):string(),16)))
		strDstProc = string.format("0x%s (%s)", buffer(26,4):string(), lookup(tonumber(buffer(26,4):string(),16), dstProcNoTbl, "For future expansion"))
		
		errinf = tree:add(Fs["slmp.a.errinfo"], 		buffer(22,18))	
		errinf:add(Fs["slmp.a.net_num"		],			buffer(22,2), "0x"..buffer(22,2):string())	-- Network number of request destination station
		errinf:add(Fs["slmp.a.node_num"		],			buffer(24,2), strNodeNo)					-- Station number of request destination station
		errinf:add(Fs["slmp.a.dstproc_num"	],			buffer(26,4), strDstProc)					-- Processor number of request destination station
		errinf:add(Fs["slmp.a.reserved1-2"	],			buffer(30,2), "0x"..buffer(30,2):string())	-- For future expansion		
		errinf:add(Fs["slmp.a.cmd"			],			buffer(32,4), "0x"..buffer(32,4):string())	-- Command
		errinf:add(Fs["slmp.a.sub_cmd"		],			buffer(36,4), "0x"..buffer(36,4):string())	-- Sub-command
		if 22 < len then
			tree:add(Fs["slmp.a.resdata"	], 			buffer(40))
		end
	end
end

function parse_ASC_MT_REQ(buffer,pinfo,tree)
	local req_data
	local cmd_data
	local head
	local subhead
	local ascii_cmd		= buffer(30,4):string()
	local ascii_sub_cmd	= buffer(34,4):string()
	local len
	local commandName
	local commandFunc
	local strFType
	local strNodeNo
	local strDstProc
	local strTimer
	
	strFType   = string.format("0x%s (%s)", buffer(0,4):string(), lookup(tonumber(buffer(0,4):string(),16), mtHeaderTbl, "For future expansion"))
	strNodeNo  = string.format("0x%s (%s)", buffer(14,2):string(),getNodeNo(tonumber(buffer(12,2):string(),16),tonumber(buffer(14,2):string(),16)))
	strDstProc = string.format("0x%s (%s)", buffer(16,4):string(), lookup(tonumber(buffer(16,4):string(),16), dstProcNoTbl, "For future expansion"))
	strTimer   = string.format("0x%s (%s)", buffer(26,4):string(), lookup(tonumber(buffer(26,4):string(),16), timerTbl, "Wait time (in 250ms increments)"))
	
	head = tree:add(Fs["slmp.a.mt_header"	],			buffer(0,12))
	head:add(		Fs["slmp.a.ftype"		],			buffer(0,4), strFType)						-- Frame type
	head:add(		Fs["slmp.a.serial"		],			buffer(4,4), "0x"..buffer(4,4):string())	-- Serial number
	head:add(		Fs["slmp.a.reserved2"	],			buffer(8,4), "0x"..buffer(8,4):string())	-- For future expansion
	
	subhead = tree:add(Fs["slmp.a.sub_header"],			buffer(12,18))
	subhead:add(	Fs["slmp.a.net_num"		],			buffer(12,2), "0x"..buffer(12,2):string())	-- Network number of request destination station
	subhead:add(	Fs["slmp.a.node_num"	],			buffer(14,2), strNodeNo)					-- Station number of request destination station
	subhead:add(	Fs["slmp.a.dstproc_num"	],			buffer(16,4), strDstProc)					-- Processor number of request destination station
	subhead:add(	Fs["slmp.a.reserved1"	],			buffer(20,2), "0x"..buffer(20,2):string())	-- For future expansion
	subhead:add(	Fs["slmp.a.length"		],			buffer(22,4), "0x"..buffer(22,4):string())	-- Request data length
	if "2101" == ascii_cmd then
		-- onDemmand command (2101)
		subhead:add(Fs["slmp.a.reserved2"	],			buffer(26,4), "0x"..buffer(26,4):string())	-- For future expansion
	else
		-- Other than onDemmand
		subhead:add(Fs["slmp.a.timer"		],			buffer(26,4), strTimer)						-- Timer
	end
	
	cmd_data = tree:add(Fs["slmp.a.cmd"		], 			buffer(30,4), "0x"..buffer(30,4):string())	-- Command
	tree:add(		Fs["slmp.a.sub_cmd"		],			buffer(34,4), "0x"..buffer(34,4):string())	-- Sub-command
	
	req_data = tree:add(Fs["slmp.a.reqdata"	], 			buffer(30))
	commandName, commandFunc = getCommandInfo(ascii_cmd, ascii_sub_cmd)
	
	if( commandName ) then
		cmd_data:append_text(" ("..commandName..")")
		
		if( commandFunc ) then
			commandFunc( buffer(38), ascii_sub_cmd, req_data, true, false )
		else
			req_data:add(buffer(38),  "Others    : " .. buffer(38):string())
		end
	else
		cmd_data:append_text(" (Unknown Pattern)")
		req_data:add(buffer(38),  "Others    : " .. buffer(38):string())
	end
end

function parse_ASC_MT_RES(buffer,pinfo,tree)
	local head
	local subhead
	local len		= tonumber(buffer(22,4):string(),16)
	local exitcode	= buffer(26,4):string()	-- Exit code
	local strFType
	local strNodeNo
	local strDstProc
	local strEndCode
	
	strFType   = string.format("0x%s (%s)", buffer(0,4):string(), lookup(tonumber(buffer(0,4):string(),16), mtHeaderTbl, "For future expansion"))
	strNodeNo  = string.format("0x%s (%s)", buffer(14,2):string(),getNodeNo(tonumber(buffer(12,2):string(),16),tonumber(buffer(14,2):string(),16)))
	strDstProc = string.format("0x%s (%s)", buffer(16,4):string(), lookup(tonumber(buffer(16,4):string(),16), dstProcNoTbl, "For future expansion"))
	strEndCode = string.format("%s (0x%s)", lookup(tonumber(buffer(26,4):string(),16), ExitCode, "Unknown"), buffer(26,4):string())
	
	head = tree:add(Fs["slmp.a.mt_header"	],			buffer(0,12))
	head:add(		Fs["slmp.a.ftype"		],			buffer(0,4), strFType)						-- Frame type
	head:add(		Fs["slmp.a.serial"		],			buffer(4,4), "0x"..buffer(4,4):string())	-- Serial number
	head:add(		Fs["slmp.a.reserved2"	],			buffer(8,4), "0x"..buffer(8,4):string())	-- For future expansion
	
	subhead = tree:add(Fs["slmp.a.sub_header"],			buffer(12,18))
	subhead:add(	Fs["slmp.a.net_num"		],			buffer(12,2), "0x"..buffer(12,2):string())	-- Network number of request destination station
	subhead:add(	Fs["slmp.a.node_num"	],			buffer(14,2), strNodeNo)					-- Station number of request destination station
	subhead:add(	Fs["slmp.a.dstproc_num"	],			buffer(16,4), strDstProc)					-- Processor number of request destination station
	subhead:add(	Fs["slmp.a.reserved1-1"	],			buffer(20,2), "0x"..buffer(20,2):string())	-- For future expansion
	subhead:add(	Fs["slmp.a.length"		],			buffer(22,4), "0x"..buffer(22,4):string())	-- Request data length
	subhead:add(	Fs["slmp.a.exit_code"	],			buffer(26,4), strEndCode)					-- Exit code
	
	if( exitcode == "0000" ) then
		-- Normal Termination
		if 4 < len then
			tree:add(Fs["slmp.a.resdata"], 				buffer(30))
		end
	else
		-- Abnormal Termination
		strNodeNo  = string.format("0x%s (%s)", buffer(32,2):string(),getNodeNo(tonumber(buffer(30,2):string(),16),tonumber(buffer(32,2):string(),16)))
		strDstProc = string.format("0x%s (%s)", buffer(34,4):string(), lookup(tonumber(buffer(34,4):string(),16), dstProcNoTbl, "For future expansion"))
		
		errinf = tree:add(Fs["slmp.a.errinfo"],  		buffer(30,18))
		errinf:add(Fs["slmp.a.net_num"],				buffer(30,2), "0x"..buffer(30,2):string())	-- Network number of request destination station
		errinf:add(Fs["slmp.a.node_num"],				buffer(32,2), strNodeNo)					-- Station number of request destination station
		errinf:add(Fs["slmp.a.dstproc_num"],			buffer(34,4), strDstProc)					-- Processor number of request destination station
		errinf:add(Fs["slmp.a.reserved1-2"],			buffer(38,2), "0x"..buffer(38,2):string())	-- For future expansion		
		errinf:add(Fs["slmp.a.cmd"],					buffer(40,4), "0x"..buffer(40,4):string())	-- Command
		errinf:add(Fs["slmp.a.sub_cmd"],				buffer(44,4), "0x"..buffer(44,4):string())	-- Sub-command
		if 22 < len then
			tree:add(Fs["slmp.a.resdata"], 				buffer(48))
		end
	end
end

function parse_ASC_EMT_REQ(buffer,pinfo,tree)
	local req_data
	local cmd_data
	local head
	local ascii_cmd		= buffer(40,4):string()
	local ascii_sub_cmd	= buffer(44,4):string()
	local len
	local commandName
	local commandFunc
	local target         = buffer(28,2)
	local flmg
	local strFType
	local strNodeNo_dst
	local strDstProc_dst
	local strNodeNo_src
	local strDstProc_src
	local strPktDsc
	local strPktName
	local strPktType

	strFType		= string.format("0x%s (%s)", buffer(0,4):string(), lookup(tonumber(buffer(0,4):string(),16), mtHeaderTbl, "For future expansion"))
	strNodeNo_dst	= string.format("0x%s (%s)", buffer(14,2):string(),getNodeNo(tonumber(buffer(12,2):string(),16),tonumber(buffer(14,2):string(),16)))
	strDstProc_dst	= string.format("0x%s (%s)", buffer(16,4):string(), lookup(tonumber(buffer(16,4):string(),16), dstProcNoTbl, "For future expansion"))
	strNodeNo_src	= string.format("0x%s (%s)", buffer(22,2):string(),getNodeNo(tonumber(buffer(20,2):string(),16),tonumber(buffer(22,2):string(),16)))
	strDstProc_src	= string.format("0x%s (%s)", buffer(24,4):string(), lookup(tonumber(buffer(24,4):string(),16), dstProcNoTbl, "For future expansion"))
	
	head = tree:add(	Fs["slmp.a.emt_header"],		buffer(0,12))
	head:add(			Fs["slmp.a.ftype"],				buffer(0,4), strFType)						-- Frame type
	head:add(			Fs["slmp.a.serial"],			buffer(4,4), "0x"..buffer(4,4):string())	-- Serial number
	head:add(			Fs["slmp.a.sub2"],				buffer(8,4), "0x"..buffer(8,4):string())	-- For future expansion
	
	subhead = tree:add(	Fs["slmp.a.sub_emt_header"], 	buffer(12,28))
	subhead:add(		Fs["slmp.a.dst_net_num"],		buffer(12,2), "0x"..buffer(12,2):string())	-- Network number of request destination station
	subhead:add(		Fs["slmp.a.dst_node_num"],		buffer(14,2), strNodeNo_dst)				-- Station number of request destination station
	subhead:add(		Fs["slmp.a.dstproc_num"],		buffer(16,4), strDstProc_dst)				-- Processor number of request destination station
	subhead:add(		Fs["slmp.a.src_net_num"],		buffer(20,2), "0x"..buffer(20,2):string())	-- Network number of request destination station
	subhead:add(		Fs["slmp.a.src_node_num"],		buffer(22,2), strNodeNo_src)				-- Station number of request destination station
	subhead:add(		Fs["slmp.a.srcproc_num"],		buffer(24,4), strDstProc_src)				-- Processor number of request destination station
	
	target = tonumber(buffer(28,2):string(),16)
	strPktDsc, strPktName = getPktType(target)
	strPktType = string.format("0x%02X (%s)", target, strPktDsc)
	pkttypehead = subhead:add(Fs["slmp.a.pkt_type"	], 	buffer( 28,2), strPktType)					-- Packet type
	pkttypehead:add(buffer(28,2),string.format("packetType           : 0b%d%d%d%d (%s)", bit32.extract(target,7,1),
																					bit32.extract(target,6,1),
																					bit32.extract(target,5,1),
																					bit32.extract(target,4,1),
																					strPktName))
	pkttypehead:add(buffer(28,2),string.format("packetSub-type       : 0b%d%d%d%d", bit32.extract(target,3,1),
																					bit32.extract(target,2,1),
																					bit32.extract(target,1,1),
																					bit32.extract(target,0,1)))
																					
	subhead:add(		Fs["slmp.a.reserved1"	],		buffer(30,2),"0x"..buffer(30,2):string())	-- For future expansion
	
	subhead:add(		Fs["slmp.a.flgm"],				buffer(32,4),"0x"..buffer(32,4):string())	-- Division information
	flmg = tonumber(buffer(32,4):string(),16)
	subhead:add(buffer(32,4), string.format("                       %d... .... .... ....  Used to identify the last data", bit32.extract(flmg,15,1)))
	subhead:add(buffer(32,4), string.format("                       .%d%d%d %d%d%d%d %d%d%d%d %d%d%d%d  Indicates the division number(%d)",
														bit32.extract(flmg,14,1), bit32.extract(flmg,13,1), bit32.extract(flmg,12,1),
														bit32.extract(flmg,11,1), bit32.extract(flmg,10,1), bit32.extract(flmg,9,1),bit32.extract(flmg,8,1),
														bit32.extract(flmg,7,1), bit32.extract(flmg,6,1), bit32.extract(flmg,5,1),bit32.extract(flmg,4,1),
														bit32.extract(flmg,3,1), bit32.extract(flmg,2,1), bit32.extract(flmg,1,1),bit32.extract(flmg,0,1),
														bit32.extract(flmg,0,15)))
	
	subhead:add(		Fs["slmp.a.length"],			buffer(36,4),"0x"..buffer(36,4):string())	-- Request data length
	cmd_data = tree:add(Fs["slmp.a.cmd"], 				buffer(40,4),"0x"..buffer(40,4):string())	-- Command
	tree:add(			Fs["slmp.a.sub_cmd"],			buffer(44,4),"0x"..buffer(44,4):string())	-- Sub-command
	req_data = tree:add(Fs["slmp.a.data"], 				buffer(48))

	commandName, commandFunc = getCommandInfo(ascii_cmd, ascii_sub_cmd)

	if( commandName ) then
		cmd_data:append_text(" ("..commandName..")")
		
		if( commandFunc ) then
			commandFunc( buffer(48), ascii_sub_cmd, req_data, true, false )
		else
			req_data:add(buffer(48),  "Others    : " .. buffer(48):string())
		end
	else
		cmd_data:append_text(" (Unknown Pattern)")
		req_data:add(buffer(48),  "Others    : " .. buffer(48):string())
	end
end

function parse_ASC_EMT_RES(buffer,pinfo,tree)
	local res_data
	local cmd_data
	local head
	local ascii_cmd		= buffer(40,4):string()
	local ascii_sub_cmd	= buffer(44,4):string()
	local len			= tonumber(buffer(36,4):string(),16)
	local commandName
	local commandFunc
	local target         = buffer(28,2)
	local flmg
	local strFType
	local strNodeNo_dst
	local strDstProc_dst
	local strNodeNo_src
	local strDstProc_src
	local strPktDsc
	local strPktName
	local strPktType
	local strEndCode
	
	strFType		= string.format("0x%s (%s)", buffer(0,4):string(), lookup(tonumber(buffer(0,4):string(),16), mtHeaderTbl, "For future expansion"))
	strNodeNo_dst	= string.format("0x%s (%s)", buffer(14,2):string(),getNodeNo(tonumber(buffer(12,2):string(),16),tonumber(buffer(14,2):string(),16)))
	strDstProc_dst	= string.format("0x%s (%s)", buffer(16,4):string(), lookup(tonumber(buffer(16,4):string(),16), dstProcNoTbl, "For future expansion"))
	strNodeNo_src	= string.format("0x%s (%s)", buffer(22,2):string(),getNodeNo(tonumber(buffer(20,2):string(),16),tonumber(buffer(22,2):string(),16)))
	strDstProc_src	= string.format("0x%s (%s)", buffer(24,4):string(), lookup(tonumber(buffer(24,4):string(),16), dstProcNoTbl, "For future expansion"))
	strEndCode		= string.format("%s (0x%s)", lookup(tonumber(buffer(48,4):string(),16), ExitCode, "Unknown"), buffer(48,4):string())
	
	head = tree:add(	Fs["slmp.a.emt_header"],		buffer(0,12))
	head:add(			Fs["slmp.a.ftype"],				buffer(0,4), strFType)						-- Frame type
	head:add(			Fs["slmp.a.serial"],			buffer(4,4), "0x"..buffer(4,4):string())	-- Serial number
	head:add(			Fs["slmp.a.sub2"],				buffer(8,4), "0x"..buffer(8,4):string())	-- For future expansion
	
	subhead = tree:add(	Fs["slmp.a.sub_emt_header"], 	buffer(12,28))
	subhead:add(		Fs["slmp.a.dst_net_num"],		buffer(12,2), "0x"..buffer(12,2):string())	-- Network number of request destination station
	subhead:add(		Fs["slmp.a.dst_node_num"],		buffer(14,2), strNodeNo_dst)				-- Station number of request destination station
	subhead:add(		Fs["slmp.a.dstproc_num"],		buffer(16,4), strDstProc_dst)				-- Processor number of request destination station
	subhead:add(		Fs["slmp.a.src_net_num"],		buffer(20,2), "0x"..buffer(20,2):string())	-- Network number of request destination station
	subhead:add(		Fs["slmp.a.src_node_num"],		buffer(22,2), strNodeNo_src)				-- Station number of request destination station
	subhead:add(		Fs["slmp.a.srcproc_num"],		buffer(24,4), strDstProc_src)				-- Processor number of request destination station
	
	target = tonumber(buffer(28,2):string(),16)
	strPktDsc, strPktName = getPktType(target)
	strPktType = string.format("0x%02X (%s)", target, strPktDsc)
	pkttypehead = subhead:add(Fs["slmp.a.pkt_type"	], 	buffer( 28,2), strPktType)					-- Packet type
	pkttypehead:add(buffer(28,2),string.format("packetType           : 0b%d%d%d%d (%s)", bit32.extract(target,7,1),
																					bit32.extract(target,6,1),
																					bit32.extract(target,5,1),
																					bit32.extract(target,4,1),
																					strPktName))
	pkttypehead:add(buffer(28,2),string.format("packetSub-type       : 0b%d%d%d%d", bit32.extract(target,3,1),
																					bit32.extract(target,2,1),
																					bit32.extract(target,1,1),
																					bit32.extract(target,0,1)))
																					
	subhead:add(		Fs["slmp.a.reserved1"	],		buffer(30,2),"0x"..buffer(30,2):string())	-- For future expansion

	subhead:add(		Fs["slmp.a.flgm"],				buffer(32,4),"0x"..buffer(32,4):string())	-- Division information
	flmg = tonumber(buffer(32,4):string(),16)
	subhead:add(buffer(32,4), string.format("                       %d... .... .... ....  Used to identify the last data", bit32.extract(flmg,15,1)))
	subhead:add(buffer(32,4), string.format("                       .%d%d%d %d%d%d%d %d%d%d%d %d%d%d%d  Indicates the division number(%d)",
														bit32.extract(flmg,14,1), bit32.extract(flmg,13,1), bit32.extract(flmg,12,1),
														bit32.extract(flmg,11,1), bit32.extract(flmg,10,1), bit32.extract(flmg,9,1),bit32.extract(flmg,8,1),
														bit32.extract(flmg,7,1), bit32.extract(flmg,6,1), bit32.extract(flmg,5,1),bit32.extract(flmg,4,1),
														bit32.extract(flmg,3,1), bit32.extract(flmg,2,1), bit32.extract(flmg,1,1),bit32.extract(flmg,0,1),
														bit32.extract(flmg,0,15)))
														
	subhead:add(		Fs["slmp.a.length"],			buffer(36,4),"0x"..buffer(36,4):string())	-- Request data length
	cmd_data = tree:add(Fs["slmp.a.cmd"], 				buffer(40,4),"0x"..buffer(40,4):string())	-- Command
	tree:add(			Fs["slmp.a.sub_cmd"],			buffer(44,4),"0x"..buffer(44,4):string())	-- Sub-command
	tree:add(			Fs["slmp.a.exit_code"	],		buffer(48,4), strEndCode)					-- Exit code
	
	commandName, commandFunc = getCommandInfo(ascii_cmd, ascii_sub_cmd)
	if 12 < len then
		res_data = tree:add(Fs["slmp.a.data"], 			buffer(52))
	end
	if( commandName ) then
		cmd_data:append_text(" ("..commandName..")")
		if 12 < len then
			if( commandFunc ) then
				commandFunc( buffer(52), ascii_sub_cmd, res_data, false, false )
			else
				res_data:add(buffer(52),  "Others    : " .. buffer(52):string())
			end
		end
	else
		cmd_data:append_text(" (Unknown Pattern)")
		if 12 < len then
			res_data:add(buffer(52),  "Others    : " .. buffer(52):string())
		end
	end
end

function parse_BIN_ST_REQ(buffer,pinfo,tree)
	local req_data
	local cmd_data
	local bin_cmd		= hexToStr(buffer(11,2), 4)
	local bin_sub_cmd	= hexToStr(buffer(13,2), 4)
	local commandName
	local commandFunc
	local subhead
	local strFType
	local strNodeNo
	local strDstProc
	local strTimer
	
	strFType   = string.format("0x%04x (%s)", buffer(0,2):uint(), lookup(buffer(0,2):uint(), stHeaderTbl, "For future expansion"))
	strNodeNo  = string.format("0x%02x (%s)", buffer(3,1):uint(),getNodeNo(buffer(2,1):uint(),buffer(3,1):uint()))
	strDstProc = string.format("0x%04x (%s)", buffer(4,2):le_uint(), lookup(buffer(4,2):le_uint(), dstProcNoTbl, "For future expansion"))
	strTimer   = string.format("0x%04x (%s)", buffer(9,2):le_uint(), lookup(buffer(9,2):le_uint(), timerTbl, "Wait time (in 250ms increments)"))
	
	tree:add(				Fs["slmp.b.st_header"	],			buffer(0,2), strFType)		-- Frame type
	subhead = tree:add(		Fs["slmp.b.sub_header"	],			buffer(2,9))
	subhead:add(			Fs["slmp.b.net_num"		], 			buffer(2,1))				-- Network number of request destination station
	subhead:add(			Fs["slmp.b.node_num"	], 			buffer(3,1), strNodeNo)		-- Station number of request destination station
	subhead:add_le(			Fs["slmp.b.dstproc_num"	],			buffer(4,2), strDstProc)	-- Processor number of request destination station
	subhead:add(			Fs["slmp.b.reserved1"	],			buffer(6,1))				-- For future expansion
	subhead:add_le(			Fs["slmp.b.length"		],			buffer(7,2))				-- Request data length
	if "2101" == bin_cmd then
		-- onDemmand command (2101)
		subhead:add_le(		Fs["slmp.b.reserved2"	],			buffer(9,2))				-- For future expansion
	else 
		-- Other than onDemmand
		subhead:add_le(		Fs["slmp.b.timer"	],				buffer(9,2),strTimer)		-- Timer
	end
	cmd_data = tree:add_le(	Fs["slmp.b.cmd"],     				buffer(11,2))				-- Command
	tree:add_le(			Fs["slmp.b.sub_cmd"], 				buffer(13,2))				-- Sub-command
	req_data = tree:add(	Fs["slmp.b.reqdata"], 				buffer(15))
	
	commandName, commandFunc = getCommandInfo(bin_cmd, bin_sub_cmd)
	
	if( commandName ) then
		cmd_data:append_text(" ("..commandName..")")
		
		if( commandFunc ) then
			commandFunc( buffer(15), bin_sub_cmd, req_data, true, true )
		else
			req_data:add(buffer(15),"Others    : " .. buffer(15))
		end
	else
		cmd_data:append_text(" (Unknown Pattern)")
		req_data:add(buffer(15),"Others    : " .. buffer(15))
	end
end

function parse_BIN_ST_RES(buffer,pinfo,tree)
	local exitcode	= buffer(9,2):le_uint()			-- End code
	local result	= exitcode2result(exitcode )
	local len		= buffer(7,2):le_uint()
	local subhead
	local strFType
	local strNodeNo
	local strDstProc
	
	strFType   = string.format("0x%04x (%s)", buffer(0,2):uint(), lookup(buffer(0,2):uint(), stHeaderTbl, "For future expansion"))
	strNodeNo  = string.format("0x%02x (%s)", buffer(3,1):uint(),getNodeNo(buffer(2,1):uint(),buffer(3,1):uint()))
	strDstProc = string.format("0x%04x (%s)", buffer(4,2):le_uint(), lookup(buffer(4,2):le_uint(), dstProcNoTbl, "For future expansion"))
	
	tree:add(		Fs["slmp.b.st_header"	],	 			buffer(0,2), strFType)		-- Frame type
	
	subhead = tree:add(Fs["slmp.b.sub_header"],				buffer(2,9))
	subhead:add(	Fs["slmp.b.net_num"		],			 	buffer(2,1))				-- Network number of request destination station
	subhead:add(	Fs["slmp.b.node_num"	],				buffer(3,1), strNodeNo)		-- Station number of request destination station
	subhead:add_le(	Fs["slmp.b.dstproc_num"	],				buffer(4,2), strDstProc)	-- Processor number of request destination station
	subhead:add(	Fs["slmp.b.reserved1-1"	],				buffer(6,1))				-- For future expansion
	subhead:add_le(	Fs["slmp.b.length"		],				buffer(7,2))				-- Response data length
	subhead:add_le(	Fs["slmp.b.exit_code"	],	 			buffer(9,2))				-- End code
	
	if( exitcode == 0 ) then
		-- Normal Termination
		if 2 < len then
			tree:add(Fs["slmp.b.resdata"], 			buffer(11))
		end
	else
		-- Error Response
		strNodeNo  = string.format("0x%02x (%s)", buffer(12,1):uint(),getNodeNo(buffer(11,1):uint(),buffer(12,1):uint()))
		strDstProc = string.format("0x%04x (%s)", buffer(13,2):le_uint(), lookup(buffer(13,2):le_uint(), dstProcNoTbl, "For future expansion"))
		
		errinf = tree:add(	Fs["slmp.b.errinfo"		],  	buffer(11,9))
		errinf:add(			Fs["slmp.b.net_num"		],		buffer(11,1))
		errinf:add(			Fs["slmp.b.node_num"	],		buffer(12,1), strNodeNo)
		errinf:add(			Fs["slmp.b.dstproc_num"	],		buffer(13,2), strDstProc)
		errinf:add(			Fs["slmp.b.reserved1-2"	],		buffer(15,1))
		errinf:add_le(		Fs["slmp.b.cmd"			],		buffer(16,2))
		errinf:add_le(		Fs["slmp.b.sub_cmd"		],		buffer(18,2))
		if 11 < len then
			tree:add(Fs["slmp.b.resdata"], 			buffer(20))
		end
	end
end

function parse_BIN_MT_REQ(buffer,pinfo,tree)
	local req_data
	local cmd_data
	local head
	local subhead
	local ascii_cmd
	local ascii_sub_cmd
	local bin_cmd		= hexToStr(buffer(15,2), 4)
	local bin_sub_cmd	= hexToStr(buffer(17,2), 4)
	local commandName
	local commandFunc
	local strFType
	local strNodeNo
	local strDstProc
	local strTimer
	
	strFType   = string.format("0x%04x (%s)", buffer(0,2):uint(), lookup(buffer(0,2):uint(), mtHeaderTbl, "For future expansion"))
	strNodeNo  = string.format("0x%02x (%s)", buffer(7,1):uint(),getNodeNo(buffer(6,1):uint(),buffer(7,1):uint()))
	strDstProc = string.format("0x%04x (%s)", buffer(8,2):le_uint(), lookup(buffer(8,2):le_uint(), dstProcNoTbl, "For future expansion"))
	strTimer   = string.format("0x%04x (%s)", buffer(13,2):le_uint(), lookup(buffer(13,2):le_uint(), timerTbl, "Wait time (in 250ms increments)"))
	
	head = tree:add(	Fs["slmp.b.mt_header"],			buffer(0,6))
	head:add(			Fs["slmp.b.ftype"	],			buffer(0,2),strFType)	-- Frame type
	head:add_le(		Fs["slmp.b.serial"	],			buffer(2,2))			-- Serial number
	head:add(			Fs["slmp.b.sub2"	],			buffer(4,2))			-- For future expansion
	
	subhead = tree:add(	Fs["slmp.b.sub_header"],		buffer(6,9))
	subhead:add(		Fs["slmp.b.net_num"	],			buffer(6,1))			-- Network number of request destination station
	subhead:add(		Fs["slmp.b.node_num"],			buffer(7,1),strNodeNo)	-- Station number of request destination station
	subhead:add_le(		Fs["slmp.b.dstproc_num"	],		buffer(8,2),strDstProc)	-- Processor number of request destination station
	subhead:add(		Fs["slmp.b.reserved1"],			buffer(10,1))			-- For future expansion
	subhead:add_le(		Fs["slmp.b.length"	],			buffer(11,2))			-- Response data length
	if "2101" == bin_cmd then
		-- onDemmand command (2101)
		subhead:add_le(		Fs["slmp.b.reserved2"	],	buffer(13,2))			-- For future expansion
	else
		-- Other than onDemmand
		subhead:add_le(		Fs["slmp.b.timer"	],		buffer(13,2),strTimer)	-- Timer
	end
	cmd_data = tree:add_le(	Fs["slmp.b.cmd"],     		buffer(15,2))			-- Command
	tree:add_le(			Fs["slmp.b.sub_cmd"], 		buffer(17,2))			-- Sub-command
	req_data = tree:add(	Fs["slmp.b.reqdata"],		buffer(15))				-- Request data
	
	commandName, commandFunc = getCommandInfo(bin_cmd, bin_sub_cmd)
	
	if( commandName ) then
		cmd_data:append_text(" ("..commandName..")")
		
		if( commandFunc ) then
			commandFunc( buffer(19), bin_sub_cmd, req_data, true, true )
		else
			req_data:add(buffer(19),"Others    : " .. buffer(19))
		end
	else
		cmd_data:append_text(" (Unknown Pattern)")
		req_data:add(buffer(19),"Others    : " .. buffer(19))
	end
end

function parse_BIN_MT_RES(buffer,pinfo,tree)
	local exitcode	= buffer(13,2):le_uint()		-- Exit code
	local result	= exitcode2result(exitcode)
	local len		= buffer(11,2):le_uint()
	local head
	local subhead
	local strFType
	local strNodeNo
	local strDstProc
	
	strFType   = string.format("0x%04x (%s)", buffer(0,2):uint(), lookup(buffer(0,2):uint(), mtHeaderTbl, "For future expansion"))
	strNodeNo  = string.format("0x%02x (%s)", buffer(7,1):uint(),getNodeNo(buffer(6,1):uint(),buffer(7,1):uint()))
	strDstProc = string.format("0x%04x (%s)", buffer(8,2):le_uint(), lookup(buffer(8,2):le_uint(), dstProcNoTbl, "For future expansion"))
	
	head = tree:add(	Fs["slmp.b.mt_header"],			buffer(0,6))
	head:add(			Fs["slmp.b.ftype"	],			buffer(0,2),strFType)	-- Frame type
	head:add_le(		Fs["slmp.b.serial"	],			buffer(2,2))			-- Serial number
	head:add(			Fs["slmp.b.sub2"	],			buffer(4,2))			-- For future expansion
	
	subhead = tree:add(	Fs["slmp.b.sub_header"],		buffer(6,9))
	subhead:add(		Fs["slmp.b.net_num"	],			buffer(6,1))			-- Network number of request destination station
	subhead:add(		Fs["slmp.b.node_num"],			buffer(7,1),strNodeNo)	-- Station number of request destination station
	subhead:add_le(		Fs["slmp.b.dstproc_num"	],		buffer(8,2),strDstProc)	-- Processor number of request destination station
	subhead:add(		Fs["slmp.b.reserved1-1"],		buffer(10,1))			-- For future expansion
	subhead:add_le(		Fs["slmp.b.length"	],			buffer(11,2))			-- Response data length
	subhead:add_le(		Fs["slmp.b.exit_code"	],		buffer(13,2))			-- Exit code
	
	if( exitcode == 0 ) then
		-- Normal Termination
		if 2 < len then
			tree:add_le(Fs["slmp.b.resdata"],				buffer(15))
		end
	else	
		-- Error Response
		strNodeNo  = string.format("0x%02x (%s)", buffer(16,1):uint(),getNodeNo(buffer(15,1):uint(),buffer(16,1):uint()))
		strDstProc = string.format("0x%04x (%s)", buffer(17,2):le_uint(), lookup(buffer(17,2):le_uint(), dstProcNoTbl, "For future expansion"))
		
		errinf = tree:add(Fs["slmp.b.errinfo"],  		buffer(15,9))
		errinf:add(		Fs["slmp.b.net_num"	],			buffer(15,1))			-- Network number of request destination station
		errinf:add(		Fs["slmp.b.node_num"],			buffer(16,1),strNodeNo)	-- Station number of request destination station
		errinf:add_le(	Fs["slmp.b.dstproc_num"	],		buffer(17,2),strDstProc)-- Processor number of request destination station
		errinf:add(		Fs["slmp.b.reserved1-2"],		buffer(19,1))			-- For future expansion
		errinf:add_le(	Fs["slmp.b.cmd"],				buffer(20,2))			-- Command
		errinf:add_le(	Fs["slmp.b.sub_cmd"],			buffer(22,2))			-- Sub-command
		if 11 < len then
			tree:add_le(Fs["slmp.b.resdata"],			buffer(24))
		end
	end
end

function parse_BIN_EMT_REQ(buffer,pinfo,tree)
	local cmd_data
	local req_data
	local bin_cmd		= hexToStr(buffer(20,2), 4)
	local bin_sub_cmd	= hexToStr(buffer(22,2), 4)
	local commandName	= "Unknown"					-- commandName
	local commandFunc	= nil
	local head
	local subhead
	local target
	local flmg
	local strFType
	local strNodeNo_dst
	local strDstProc_dst
	local strNodeNo_src
	local strDstProc_src
	local strPktDsc
	local strPktName
	local strPktType
	
	strFType   = string.format("0x%04X (%s)", buffer(0,2):uint(), lookup(buffer(0,2):uint(), mtHeaderTbl, "For future expansion"))
	strNodeNo_dst  = string.format("0x%02x (%s)", buffer(7,1):uint(),getNodeNo(buffer(6,1):uint(),buffer(7,1):uint()))
	strDstProc_dst = string.format("0x%04x (%s)", buffer(8,2):le_uint(), lookup(buffer(8,2):le_uint(), dstProcNoTbl, "For future expansion"))
	strNodeNo_src  = string.format("0x%02x (%s)", buffer(11,1):uint(),getNodeNo(buffer(10,1):uint(),buffer(11,1):uint()))
	strDstProc_src = string.format("0x%04x (%s)", buffer(12,2):le_uint(), lookup(buffer(12,2):le_uint(), dstProcNoTbl, "For future expansion"))
	
	commandName, commandFunc = getCommandInfo(bin_cmd,bin_sub_cmd)
	
	head = tree:add(	Fs["slmp.b.emt_header"	],		buffer(0,6))
	head:add(			Fs["slmp.b.ftype"		],		buffer(0,2), strFType)			-- Frame type
	head:add_le(		Fs["slmp.b.serial"		],		buffer(2,2))					-- Serial number
	head:add(			Fs["slmp.b.sub2"		],		buffer(4,2))					-- For future expansion
	
	subhead = tree:add(	Fs["slmp.b.sub_emt_header"	],	buffer(6,14))
	subhead:add(		Fs["slmp.b.dst_net_num"		], 	buffer( 6,1))					-- Network number of request destination station
	subhead:add(		Fs["slmp.b.dst_node_num"	], 	buffer( 7,1), strNodeNo_dst)	-- Station number of request destination station
	subhead:add_le(		Fs["slmp.b.dstproc_num"		],	buffer( 8,2), strDstProc_dst)	-- Processor number of request destination station
	subhead:add(		Fs["slmp.b.src_net_num"		], 	buffer(10,1))					-- Network number of request destination station
	subhead:add(		Fs["slmp.b.src_node_num"	], 	buffer(11,1), strNodeNo_src)	-- Station number of request destination station
	subhead:add_le(		Fs["slmp.b.srcproc_num"		],	buffer(12,2), strDstProc_src)	-- Processor number of request destination station
	
	target = buffer(14,1):le_uint()
	strPktDsc, strPktName = getPktType(target)
	strPktType = string.format("0x%02x (%s)", target, strPktDsc)
	pkttypehead = subhead:add(Fs["slmp.b.pkt_type"	], 	buffer( 14,1), strPktType)		-- Packet type
	pkttypehead:add(buffer(14,1),string.format("packetType           : 0b%d%d%d%d (%s)", bit32.extract(target,7,1),
																					bit32.extract(target,6,1),
																					bit32.extract(target,5,1),
																					bit32.extract(target,4,1),
																					strPktName))
	pkttypehead:add(buffer(14,1),string.format("packetSub-type       : 0b%d%d%d%d", bit32.extract(target,3,1),
																					bit32.extract(target,2,1),
																					bit32.extract(target,1,1),
																					bit32.extract(target,0,1)))
	subhead:add_le(		Fs["slmp.b.reserved1"		],		buffer(15,1))	-- For future expansion
	
	subhead:add_le(		Fs["slmp.b.flgm"			],		buffer(16,2))	-- Division information
	flmg = buffer(16,2):le_uint()
	subhead:add(buffer(16,2), string.format("                       %d... .... .... ....  Used to identify the last data", bit32.extract(flmg,15,1)))
	subhead:add(buffer(16,2), string.format("                       .%d%d%d %d%d%d%d %d%d%d%d %d%d%d%d  Indicates the division number(%d)",
														bit32.extract(flmg,14,1), bit32.extract(flmg,13,1), bit32.extract(flmg,12,1),
														bit32.extract(flmg,11,1), bit32.extract(flmg,10,1), bit32.extract(flmg,9,1),bit32.extract(flmg,8,1),
														bit32.extract(flmg,7,1), bit32.extract(flmg,6,1), bit32.extract(flmg,5,1),bit32.extract(flmg,4,1),
														bit32.extract(flmg,3,1), bit32.extract(flmg,2,1), bit32.extract(flmg,1,1),bit32.extract(flmg,0,1),
														bit32.extract(flmg,0,15)))

	subhead:add_le(		Fs["slmp.b.length"			],		buffer(18,2))	-- Request data length
	cmd_data = tree:add_le(Fs["slmp.b.cmd"			],		buffer(20,2))	-- Command
	tree:add_le(		Fs["slmp.b.sub_cmd"			],		buffer(22,2))	-- Sub-command
	
	req_data = tree:add(Fs["slmp.b.reqdata"],buffer(24))
	if( commandName ) then
		cmd_data:append_text(" ("..commandName..")")
		
		if( commandFunc ) then
			commandFunc( buffer(24), bin_sub_cmd, req_data, true, true )
		else
			req_data:add(buffer(24),"Others    : " .. buffer(24))
		end
	else
		cmd_data:append_text(" (Unknown Pattern)")
		req_data:add(buffer(24),"Others    : " .. buffer(24))
	end
end

function parse_BIN_EMT_RES(buffer,pinfo,tree)
	local cmd_data
	local req_data
	local bin_cmd		= hexToStr(buffer(20,2), 4)
	local bin_sub_cmd	= hexToStr(buffer(22,2), 4)
	local commandName	= "Unknown"					-- commandName
	local commandFunc	= nil
	local len			= buffer(18,2):le_uint()
	local head
	local subhead
	local target
	local flmg
	local strFType
	local strNodeNo_dst
	local strDstProc_dst
	local strNodeNo_src
	local strDstProc_src
	local strPktDsc
	local strPktName
	local strPktType
	
	strFType   = string.format("0x%04x (%s)", buffer(0,2):uint(), lookup(buffer(0,2):uint(), mtHeaderTbl, "For future expansion"))
	strNodeNo_dst  = string.format("0x%02x (%s)", buffer(7,1):uint(),getNodeNo(buffer(6,1):uint(),buffer(7,1):uint()))
	strDstProc_dst = string.format("0x%04x (%s)", buffer(8,2):le_uint(), lookup(buffer(8,2):le_uint(), dstProcNoTbl, "For future expansion"))
	strNodeNo_src  = string.format("0x%02x (%s)", buffer(11,1):uint(),getNodeNo(buffer(10,1):uint(),buffer(11,1):uint()))
	strDstProc_src = string.format("0x%04x (%s)", buffer(12,2):le_uint(), lookup(buffer(12,2):le_uint(), dstProcNoTbl, "For future expansion"))
	
	commandName, commandFunc = getCommandInfo(bin_cmd,bin_sub_cmd)
	
	head = tree:add(	Fs["slmp.b.emt_header"	],		buffer(0,6))
	head:add(			Fs["slmp.b.ftype"		],		buffer(0,2), strFType)			-- Frame type
	head:add_le(		Fs["slmp.b.serial"		],		buffer(2,2))					-- Serial number
	head:add(			Fs["slmp.b.sub2"		],		buffer(4,2))					-- For future expansion
	
	subhead = tree:add(	Fs["slmp.b.sub_emt_header"	],	buffer(6,14))
	subhead:add(		Fs["slmp.b.dst_net_num"		], 	buffer( 6,1))					-- Network number of request destination station
	subhead:add(		Fs["slmp.b.dst_node_num"	], 	buffer( 7,1), strNodeNo_dst)	-- Station number of request destination station
	subhead:add_le(		Fs["slmp.b.dstproc_num"		],	buffer( 8,2), strDstProc_dst)	-- Processor number of request destination station
	subhead:add(		Fs["slmp.b.src_net_num"		], 	buffer(10,1))					-- Network number of request destination station
	subhead:add(		Fs["slmp.b.src_node_num"	], 	buffer(11,1), strNodeNo_src)	-- Station number of request destination station
	subhead:add_le(		Fs["slmp.b.srcproc_num"		],	buffer(12,2), strDstProc_src)	-- Processor number of request destination station
	
	target = buffer(14,1):le_uint()
	strPktDsc, strPktName = getPktType(target)
	strPktType = string.format("0x%02x (%s)", target, strPktDsc)
	pkttypehead = subhead:add(Fs["slmp.b.pkt_type"	], 	buffer( 14,1), strPktType)		-- Packet type
	pkttypehead:add(buffer(14,1),string.format("packetType           : 0b%d%d%d%d (%s)", bit32.extract(target,7,1),
																					bit32.extract(target,6,1),
																					bit32.extract(target,5,1),
																					bit32.extract(target,4,1),
																					strPktName))
	pkttypehead:add(buffer(14,1),string.format("packetSub-type       : 0b%d%d%d%d", bit32.extract(target,3,1),
																					bit32.extract(target,2,1),
																					bit32.extract(target,1,1),
																					bit32.extract(target,0,1)))
	subhead:add_le(		Fs["slmp.b.reserved1"		],		buffer(15,1))	-- For future expansion
	
	subhead:add_le(		Fs["slmp.b.flgm"			],		buffer(16,2))	-- Division information
	flmg = buffer(16,2):le_uint()
	subhead:add(buffer(16,2), string.format("                       %d... .... .... ....  Used to identify the last data", bit32.extract(flmg,15,1)))
	subhead:add(buffer(16,2), string.format("                       .%d%d%d %d%d%d%d %d%d%d%d %d%d%d%d  Indicates the division number(%d)",
														bit32.extract(flmg,14,1), bit32.extract(flmg,13,1), bit32.extract(flmg,12,1),
														bit32.extract(flmg,11,1), bit32.extract(flmg,10,1), bit32.extract(flmg,9,1),bit32.extract(flmg,8,1),
														bit32.extract(flmg,7,1), bit32.extract(flmg,6,1), bit32.extract(flmg,5,1),bit32.extract(flmg,4,1),
														bit32.extract(flmg,3,1), bit32.extract(flmg,2,1), bit32.extract(flmg,1,1),bit32.extract(flmg,0,1),
														bit32.extract(flmg,0,15)))
														
	subhead:add_le(		Fs["slmp.b.length"			],		buffer(18,2))	-- Request data length
	cmd_data = tree:add_le(Fs["slmp.b.cmd"			],		buffer(20,2))	-- Command
	tree:add_le(		Fs["slmp.b.sub_cmd"			],		buffer(22,2))	-- Sub-command
	tree:add_le(		Fs["slmp.b.exit_code"		],		buffer(24,2))	-- Exit code
	
	if 6 < len then
		req_data = tree:add(Fs["slmp.b.reqdata"],buffer(26))
	end
	if( commandName ) then
		cmd_data:append_text(" ("..commandName..")")
		if 6 < len then
			if( commandFunc ) then
				commandFunc( buffer(26), bin_sub_cmd, req_data, false, true )
			else
				req_data:add(buffer(26),"Others    : " .. buffer(26))
			end
		end
	else
		cmd_data:append_text(" (Unknown Pattern)")
		if 6 < len then
			req_data:add(buffer(26),"Others    : " .. buffer(26))
		end
	end
end

function parse_BIN_LMT_REQ(buffer,pinfo,tree)
	local req_data
	local cmd_data
	local bin_cmd		= hexToStr(buffer(18,2), 4)
	local bin_sub_cmd	= hexToStr(buffer(20,2), 4)
	local offset = 28								-- SLMP Request data Offset
	local commandName	= "Unknown"					-- commandName
	local commandFunc	= nil
	local head
	local subhead
	local length		= tonumber(hexToStr(buffer(14,2), 4), 16)	-- data length
	local strFType
	local strNodeNo
	local strDstProc
	local strTimer
	
	strFType   = string.format("0x%04x (%s)", buffer(0,2):uint(), lookup(buffer(0,2):uint(), mtHeaderTbl, "For future expansion"))
	strNodeNo  = string.format("0x%02x (%s)", buffer(7,1):uint(),getNodeNo_LMT(buffer(6,1):uint(),buffer(7,1):uint()))
	strDstProc = string.format("0x%04x (%s)", buffer(8,2):le_uint(), lookup(buffer(8,2):le_uint(), dstProcNoTbl, "For future expansion"))
	strTimer   = string.format("0x%04x (%s)", buffer(16,2):le_uint(), lookup(buffer(16,2):le_uint(), timerTbl, "Wait time (in 250ms increments)"))
	
	commandName, commandFunc = getCommandInfo(bin_cmd,bin_sub_cmd)
	
	head = tree:add(	Fs["slmp.b.mt_header"	],		buffer(0,6))
	head:add(			Fs["slmp.b.ftype"		],		buffer(0,2), strFType)		-- Frame type
	head:add_le(		Fs["slmp.b.serial"		],		buffer(2,2))				-- Serial number
	head:add(			Fs["slmp.b.reserved1_02"],		buffer(4,2))				-- For future expansion
	
	subhead = tree:add(	Fs["slmp.b.sub_lmt_header"],	buffer(6,12))
	subhead:add(		Fs["slmp.b.net_num"		], 		buffer( 6,1))				-- Network number of request destination station
	subhead:add(		Fs["slmp.b.node_num"	], 		buffer( 7,1), strNodeNo)	-- Station number of request destination station
	subhead:add_le(		Fs["slmp.b.dstproc_num"	],		buffer( 8,2), strDstProc)	-- Processor number of request destination station
	subhead:add_le(		Fs["slmp.b.dstProcSubNo"],		buffer(10,1))				-- dstProcSubNo
	subhead:add_le(		Fs["slmp.b.reserved2_02"],		buffer(11,1))				-- For future expansion
	subhead:add_le(		Fs["slmp.b.ext_num"		],		buffer(12,2))				-- Request target station extended station number
	subhead:add_le(		Fs["slmp.b.length"		],		buffer(14,2))				-- Request data length
	subhead:add_le(		Fs["slmp.b.timer"		],		buffer(16,2), strTimer)		-- Timer
	
	cmd_data = tree:add_le(Fs["slmp.b.cmd"		],		buffer(18,2))				-- Command
	tree:add_le(		Fs["slmp.b.sub_cmd"		],		buffer(20,2))				-- Sub-command
	tree:add_le(		Fs["slmp.b.reserved3_02"],		buffer(22,1))				-- For future expansion
	tree:add_le(		Fs["slmp.b.req_dataid"	],		buffer(23,1))				-- Message identification value
	tree:add_le(		Fs["slmp.b.req_devnum"	],		buffer(24,2))				-- Total division number
	tree:add_le(		Fs["slmp.b.req_datano"	],		buffer(26,2))				-- Divided data number
	req_data = tree:add(Fs["slmp.b.reqdata"		],		buffer(28))
	
	if( commandName ) then
		cmd_data:append_text(" ("..commandName..")")
		
		if( commandFunc ) then
			commandFunc( buffer(28), bin_sub_cmd, req_data, true, true )
		else
			req_data:add(buffer(28),"Others    : " .. buffer(28))
		end
	else
		cmd_data:append_text(" (Unknown Pattern)")
		req_data:add(buffer(28),"Others    : " .. buffer(28))
	end
end

function parse_BIN_LMT_RES(buffer,pinfo,tree)
	local res_data
	local cmd_data
	local errinf
	local bin_cmd		= hexToStr(buffer(18,2), 4)
	local bin_sub_cmd	= hexToStr(buffer(20,2), 4)
	local exitcode		= buffer(16,2):le_uint()
	local result		= exitcode2result(exitcode )
	local commandName	= "Unknown"
	local commandFunc   = nil
	local head
	local subhead
	local length		= buffer(14,2):le_uint()
	local strFType
	local strNodeNo
	local strDstProc
	
	strFType   = string.format("0x%04x (%s)", buffer(0,2):uint(), lookup(buffer(0,2):uint(), mtHeaderTbl, "For future expansion"))
	strNodeNo  = string.format("0x%02x (%s)", buffer(7,1):uint(),getNodeNo(buffer(6,1):uint(),buffer(7,1):uint()))
	strDstProc = string.format("0x%04x (%s)", buffer(8,2):le_uint(), lookup(buffer(8,2):le_uint(), dstProcNoTbl, "For future expansion"))
	
	commandName, commandFunc = getCommandInfo(bin_cmd,bin_sub_cmd)
	
	head = tree:add(	Fs["slmp.b.mt_header"	],			buffer(0,6))
	head:add(			Fs["slmp.b.ftype"		],			buffer(0,2),strFType)		-- Frame type
	head:add_le(		Fs["slmp.b.serial"		],			buffer(2,2))				-- Serial number
	head:add(			Fs["slmp.b.reserved1_02"],			buffer(4,2))				-- For future expansion	
	
	subhead = tree:add(	Fs["slmp.b.sub_lmt_header"], 	buffer(6,12))
	subhead:add(		Fs["slmp.b.net_num"		], 		buffer( 6,1))				-- Network number of request destination station
	subhead:add(		Fs["slmp.b.node_num"	], 		buffer( 7,1), strNodeNo)	-- Station number of request destination station
	subhead:add_le(		Fs["slmp.b.dstproc_num"	],		buffer( 8,2), strDstProc)	-- Processor number of request destination station
	subhead:add_le(		Fs["slmp.b.dstProcSubNo"],		buffer(10,1))				-- For future expansion
	subhead:add_le(		Fs["slmp.b.reserved2_02"],		buffer(11,1))				-- For future expansion
	subhead:add_le(		Fs["slmp.b.ext_num"		],		buffer(12,2))				-- Request target station extended station number
	subhead:add_le(		Fs["slmp.b.length"		],		buffer(14,2))				-- Response data length
	subhead:add_le(		Fs["slmp.b.exit_code"	],		buffer(16,2))				-- End code
	cmd_data = tree:add_le(Fs["slmp.b.cmd"		],		buffer(18,2))				-- Command
	tree:add_le(		Fs["slmp.b.sub_cmd"		],		buffer(20,2))				-- Sub-command
	tree:add_le(		Fs["slmp.b.reserved3_02"],		buffer(22,1))				-- For future expansion
	tree:add_le(		Fs["slmp.b.res_dataid"	],		buffer(23,1))				-- Message identification value
	tree:add_le(		Fs["slmp.b.res_devnum"	],		buffer(24,2))				-- Total division number
	tree:add_le(		Fs["slmp.b.res_datano"	],		buffer(26,2))				-- Divided data number
	
	if( commandName ) then
		cmd_data:append_text(" ("..commandName..")")
	else
		cmd_data:append_text(" (Unknown Pattern)")
	end
	
	if( exitcode == 0 ) then
		-- Normal Termination
		if 12 < length then
			res_data = tree:add(Fs["slmp.b.resdata"],buffer(28))
			if( commandFunc ) then
				commandFunc( buffer(28), bin_sub_cmd, res_data, false, true )
			else
				res_data:add(buffer(28),"Others    : " .. buffer(28))
			end
		end
	else
		-- Abnormal Termination
		strNodeNo  = string.format("0x%02x (%s)", buffer(29,1):uint(),getNodeNo(buffer(28,1):uint(),buffer(29,1):uint()))
		strDstProc = string.format("0x%04x (%s)", buffer(30,2):le_uint(), lookup(buffer(30,2):le_uint(), dstProcNoTbl, "For future expansion"))
		
		errinf = tree:add(Fs["slmp.b.errinfo"],	buffer(28,8))
		errinf:add(	Fs["slmp.b.net_num"		],	buffer(28,1))
		errinf:add(	Fs["slmp.b.node_num"	],	buffer(29,1), strNodeNo)
		errinf:add(	Fs["slmp.b.dstproc_num"	],	buffer(30,2), strDstProc)
		errinf:add(	Fs["slmp.b.dstProcSubNo"],	buffer(32,1))
		errinf:add(	Fs["slmp.b.reserved2_02"],	buffer(33,1))
		errinf:add(	Fs["slmp.b.ext_num"		],	buffer(34,2))
		if 20 < length then
			res_data = tree:add(Fs["slmp.b.resdata"],buffer(36))
			if( commandFunc ) then
				commandFunc( buffer(36), bin_sub_cmd, res_data, false, true )
			else
				res_data:add(buffer(36),"Others    : " .. buffer(36))
			end
		end
	end
end

function parse_Unknown(buffer,pinfo,tree)
	SLMPerror(tree,"Undecoded.")
end

function exitcode2result(exitcode)
	return lookup(exitcode, ExitCode,string.format("Unknown(0x%X)",exitcode))
end

function getCommandInfo(asc_cmd,asc_subcmd)
	local Entry       = nil
	
	if	CmdStrList[asc_cmd] then
		Entry = CmdStrList[asc_cmd]
	else
		if	CmdStrList[asc_cmd .. "_" .. asc_subcmd] then
			Entry = CmdStrList[asc_cmd .. "_" .. asc_subcmd]
		end
	end
	
	if Entry == nil then
		return "Unknown", nil, nil
	end
	
	return Entry[1], Entry[2], Entry[3]
end

function SLMPwarn(tree,text)
	tree:add_expert_info(expert.group.PROTOCOL, expert.severity.WARN, text )
end

function SLMPerror(tree,text)
	tree:add_expert_info(expert.group.PROTOCOL, expert.severity.ERROR,text )
end

function check_port_number(req_res, expect_port_list ,pinfo)
	local i,expect
	local result = nil
	local list=""
	local spec={
		["REQ"] = { target= pinfo.dst_port , errfmt = "Dst Port Number missmatch.(Expect: %s Actual: %u)"},
		["RES"] = { target= pinfo.src_port , errfmt = "Src Port Number missmatch.(Expect: %s Actual: %u)"},
	}
	
	if expect_port_list == nil then
		return result
	end
	
	for i,expect in ipairs(expect_port_list) do
		if list == "" then
			list = string.format("%d",expect)
		else
			list = list .. string.format(",%d",expect)
		end
	end
	for i,expect in ipairs(expect_port_list) do
		if (expect ~= spec[req_res].target) then
			result =  string.format(spec[req_res].errfmt,list,spec[req_res].target)
		else
			result =  nil
			break
		end
	end
	return result
end

function lookup(key,table,nil_value)
	local value_ = nil_value

	if table[key] then
		value_ = table[key]
	end
	return value_
end

-- Hex->String
function hexToStr(buff,size)
	local result
	
	result = string.format("%X",buff:le_uint())
	
	while (string.len(result) < size) do
		result = "0" .. result
	end
	return result
end
-- getNodeNo
function getNodeNo(netNo, nodeNo)
	local retstr
	
	if 0x00 == netNo then
		if 0xFF == nodeNo then
			retstr = "Connected station"									-- NetWork Number: 0x00          ,  Station Number: 0xFF
		else
			retstr = "For future expansion"
		end
	elseif 0x01 <= netNo and netNo <= 0xEF then
		if 0x01 <= nodeNo and nodeNo <= 0x78 then
			retstr = "Other station"										-- NetWork Number: 0x01 to 0xEF  ,  Station Number: 0x01 to 0x78
		elseif  0x7D == nodeNo then	
			retstr = "Specified management station / master station"		-- NetWork Number: 0x01 to 0xEF  ,  Station Number: 0x7D
		elseif  0x7E == nodeNo then
			retstr = "Current management station / master station"			-- NetWork Number: 0x01 to 0xEF  ,  Station Number: 0x7E
		else
			retstr = "For future expansion"
		end
	else
		retstr = "For future expansion"
	end
	
	return retstr
end

-- getNodeNo_LMT
function getNodeNo_LMT(netNo, nodeNo)
	local retstr
	
	if 0x00 == netNo then
		if 0xFF == nodeNo then
			retstr = "Connected station"									-- NetWork Number: 0x00          ,  Station Number: 0xFF
		else
			retstr = "For future expansion"
		end
	elseif 0x01 <= netNo and netNo <= 0xEF then
		if 0x7C == nodeNo then
			retstr = "Station number specification"							-- NetWork Number: 0x01 to 0xEF  ,  Station Number: 0x7C
		elseif 0x7D == nodeNo then	
			retstr = "Specified management station / master station"		-- NetWork Number: 0x01 to 0xEF  ,  Station Number: 0x7D
		elseif 0x7E == nodeNo then
			retstr = "Current management station / master station"			-- NetWork Number: 0x01 to 0xEF  ,  Station Number: 0x7E
		else
			retstr = "For future expansion"
		end
	else
		retstr = "For future expansion"
	end
	
	return retstr
end

-- getPktType
function getPktType(pktType)
	local retstr
	local strTypeName
	local low			-- Packet Sub-type	: pktType(Bit3-0)
	local hi			-- Packet type		: pktType(Bit7-4)
	
	low = bit32.extract(pktType, 0,4)
	hi = bit32.extract(pktType, 4,4)
	
	if 0 == hi then
		strTypeName = "Connecting"
		
		if 0 == low then
			retstr = "Indicates that connection packet"
		else
			retstr = "For future expansion"
		end
	elseif 1 == hi then
		strTypeName = "Verifying connection"
		
		if 0 == low then
			retstr = "Indicates that connection check packet"
		else
			retstr = "For future expansion"
		end
	elseif 4 == hi then
		strTypeName = "Normal"
		
		if 0 == low then
			retstr = "Indicates that communication packet"
		elseif 1 == low then
			retstr = "Indicates that packet to permit fragment transfer"
		elseif 3 == low then
			retstr = "Indicates that packet to cancel fragment transfer"
		else
			retstr = "For future expansion"
		end
	else
		retstr = "For future expansion"
	end
	return retstr, strTypeName
end


-- Read(0401)
function Slmp0401(buffer, subcmd, subtree, isReq, isBin)
	local offset
	
	offset = 0
	
	-- Req
	if( isReq ) then
		if( isBin ) then
			-- Binary
			offset = parseDevName(buffer, subcmd, subtree, "BIN","tarDevice")			-- Registrate device name
			subtree:add(buffer(offset,2), "deviceNum: "..buffer(offset,2):le_uint())	-- Number of device points
		else
			-- ASCII
			offset = parseDevName(buffer, subcmd, subtree, "ASC","tarDevice")			-- Registrate device name
			subtree:add(buffer(offset,4), "deviceNum: "..tonumber(buffer(offset,4):string(),16))		-- Number of device points
		end
	-- Res
	else
		subtree:add(buffer(), "data: "..buffer()) -- Read Data
	end
end

-- Write(1401)
function Slmp1401(buffer, subcmd, subtree, isReq, isBin)
	local offset
	local strdata
	local wpt		-- Write device Points
	
	offset = 0
	strdata = ""
	
	-- Req
	if( isReq ) then
		if( isBin ) then
			-- Binary
			offset = parseDevName(buffer, subcmd, subtree, "BIN","tarDevice")			-- Registrate device name
			wpt = buffer(offset,2):le_uint()
			subtree:add(buffer(offset,2), "deviceNum: "..buffer(offset,2):le_uint())	-- Number of device points
			
			offset = offset + 2
			
			if isBitwise(subcmd) then
				for i=0, wpt-1 do
					if i%2 == 0 then
						subtree:add(buffer(offset, 1), string.format("data %-4d: 0x%X", i+1, bit32.extract(buffer(offset,1):uint(),4,4)))		-- Write Data
					else
						subtree:add(buffer(offset, 1), string.format("data %-4d: 0x%X", i+1, bit32.extract(buffer(offset,1):uint(),0,4)))		-- Write Data
						offset = offset + 1
					end
				end
			else
				for i=0, wpt-1 do
					subtree:add(buffer(offset, 2), string.format("data %-4d: 0x%04X", i+1, buffer(offset,2):le_uint()))		-- Write Data
					offset = offset + 2
				end
			end
		else
			-- ASCII
			offset = parseDevName(buffer, subcmd, subtree, "ASC","tarDevice")												-- registrate device name
			wpt = tonumber(buffer(offset,4):string(),16)
			subtree:add(buffer(offset,4), "deviceNum: "..tonumber(buffer(offset,4):string(),16))							-- number of device points
			
			offset = offset + 4
			
			if isBitwise(subcmd) then
				for i=0, wpt-1 do
					subtree:add(buffer(offset, 1), string.format("data %-4d: 0x%s", i+1, buffer(offset, 1):string()))		-- Write Data
					offset = offset + 1
				end
			else
				for i=0, wpt-1 do
					subtree:add(buffer(offset, 4), string.format("data %-4d: 0x%s", i+1, buffer(offset, 4):string()))		-- Write Data
					offset = offset + 4
				end
			end
		end
	-- Res
	else
		-- does not have response data
	end
end

-- ReadRandom(0403_xxxx)
function Slmp0403(buffer, subcmd, subtree, isReq, isBin)
	if	subcmd == "0040" then
		Slmp0403_0040(buffer, subcmd, subtree, isReq, isBin)
	elseif	subcmd == "0001" or subcmd == "0003" then
		Slmp0403_0001_0003(buffer, subcmd, subtree, isReq, isBin)
	elseif	subcmd == "0000" or subcmd == "0002" or subcmd == "0080" or subcmd == "0082" then
		Slmp0403_0000_0002_0080_0082(buffer, subcmd, subtree, isReq, isBin)
	end
end

-- ReadRandom(0403_0040)
function Slmp0403_0040(buffer, subcmd, subtree, isReq, isBin)
	-- Req
	if( isReq ) then
		if( isBin ) then
			-- Binary
			tarMonitorDevice_BIN(buffer, subcmd, subtree)
		else
			-- ASCII
			tarMonitorDevice_ASC(buffer, subcmd, subtree)
		end
		
	-- Res
	else
		subtree:add(buffer(), "data: 0x"..buffer()) -- Read Data
	end
end

-- ReadRandom(0403_0001,0403_0003)
function Slmp0403_0001_0003(buffer, subcmd, subtree, isReq, isBin)
	local total
	local offset
	local btpt
	local accesstree
	local bttree
	
	-- Req
	if( isReq ) then
		if( isBin ) then
			-- Binary
			btpt = buffer(0,1):uint()
			
			subtree:add(buffer(0,1), "btAccessNum : "..buffer(0,1):uint())							-- Number of bit access points
			total = 1
			
			-- Repeat for Bit points
			for i=0,btpt-1 do
				offset = parseDevName(buffer(total), subcmd, subtree, "BIN", "btDevice"..i+1)		-- Registrate device name
				total = total + offset
			end
		else
			-- ASCII
			btpt = tonumber(buffer(0,2):string(),16)
			
			subtree:add(buffer(0,2), "btAccessNum : "..btpt)										-- Number of bit access points
			total = 2
			
			-- Repeat for Bit points
			for i=0,btpt-1 do
				offset = parseDevName(buffer(total), subcmd, subtree, "ASC", "btDevice"..i+1)		-- Registrate device name
				total = total + offset
			end
		end
		
	-- Res
	else
		subtree:add(buffer(), "data: 0x"..buffer()) -- Read Data
	end
end

-- ReadRandom(0403_0000, 0403_0002, 0403_0080, 0403_0082)
function Slmp0403_0000_0002_0080_0082(buffer, subcmd, subtree, isReq, isBin)
	-- Req
	if( isReq ) then
		if( isBin ) then
			-- Binary
			noMonitorDevice_BIN(buffer, subcmd, subtree)
		else
			-- ASCII
			noMonitorDevice_ASC(buffer, subcmd, subtree)
		end
		
	-- Res
	else
		subtree:add(buffer(), "data: 0x"..buffer()) -- Read Data
	end
end

-- WriteRandom(1402_xxxx)
function Slmp1402(buffer, subcmd, subtree, isReq, isBin)
	if	subcmd == "0001" or subcmd == "0003" then
		Slmp1402_0001_0003(buffer, subcmd, subtree, isReq, isBin)
	elseif	subcmd == "0000" or subcmd == "0002" or subcmd == "0080" or subcmd == "0082" then
		Slmp1402_0000_0002_0080_0082(buffer, subcmd, subtree, isReq, isBin)
	end
end

-- WriteRandom(1402_0001, 1402_0003)
function Slmp1402_0001_0003(buffer, subcmd, subtree, isReq, isBin)
	local total
	local offset
	local btpt
	local accesstree
	local bttree
	
	-- Req
	if( isReq ) then
		if( isBin ) then
			-- Binary
			btpt = buffer(0,1):uint()
			
			accesstree = subtree:add(buffer(0,1),"accessNum")
			accesstree:add(buffer(0,1), "btAccessNum : "..buffer(0,1):uint())														-- Number of bit access points
			total = 1
			
			-- Repeat for Bit points
			for i=0,btpt-1 do
				if "0001" == subcmd then
					bttree = subtree:add(buffer(total, 5), string.format("btDeviceData %d", i+1))
					offset = parseDevName(buffer(total), subcmd, bttree, "BIN", "btDevice")											-- Registrate device name
					bttree:add(buffer(total+offset,1), "btSetReset: "..string.format("0x%02X",buffer(total+offset,1):le_uint()))	-- Write Data
					total = total + offset + 1
				elseif "0003" == subcmd then
					bttree = subtree:add(buffer(total, 8), string.format("btDeviceData %d", i+1))
					offset = parseDevName(buffer(total), subcmd, bttree, "BIN", "btDevice")											-- Registrate device name
					bttree:add(buffer(total+offset,2), "btSetReset: "..string.format("0x%04X",buffer(total+offset,2):le_uint()))	-- Write Data
					total = total + offset + 2
				else
				end
				
			end
		else
			-- ASCII
			btpt = tonumber(buffer(0,2):string(),16)
			
			accesstree = subtree:add(buffer(0,2),"accessNum")
			accesstree:add(buffer(0,2), "btAccessNum : "..tonumber(buffer(0,2):string(),16))					-- Number of bit access points
			total = 2
			
			-- Repeat for Bit points
			for i=0,btpt-1 do
				if "0001" == subcmd then
					bttree = subtree:add(buffer(total, 10), string.format("btDeviceData %d", i+1))
					offset = parseDevName(buffer(total), subcmd, bttree, "ASC", "btDevice")						-- Registrate device name
					bttree:add(buffer(total+offset,2), "btSetReset: 0x" ..buffer(total+offset,2):string())		-- Write Data
					total = total + offset + 2
				elseif "0003" == subcmd then
					bttree = subtree:add(buffer(total, 16), string.format("btDeviceData %d", i+1))
					offset = parseDevName(buffer(total), subcmd, bttree, "ASC", "btDevice")						-- Registrate device name
					bttree:add(buffer(total+offset,4), "btSetReset: 0x" ..buffer(total+offset,4):string())		-- Write Data
					total = total + offset + 4
				else
				end
				
			end
		end
		
	-- Res
	else
		-- Does not have response data
	end
end

-- WriteRandom(1402_0000_0002_0080_0082)
function Slmp1402_0000_0002_0080_0082(buffer, subcmd, subtree, isReq, isBin)
	local total
	local offset
	local wpt
	local dwpt
	local accesstree
	local wdtree
	local dwdtree
	
	offset = 0
	
	-- Req
	if( isReq ) then
		if( isBin ) then
			-- Binary
			
			wpt = buffer(0,1):uint()
			dwpt = buffer(1,1):uint()
			
			accesstree = subtree:add(buffer(0,2),"accessNum")
			accesstree:add(buffer(0,1), "wdAccessNum : "..buffer(0,1):uint())											-- Number of word access points
			accesstree:add(buffer(1,1), "dwdAccessNum: "..buffer(1,1):uint())											-- Number of double word access points
			total = 2
			
			-- Repeat for word points	
			for i=0,wpt-1 do
				if "0000" == subcmd then
					wdtree = subtree:add(buffer(total, 6), string.format("wdDeviceData %d", i+1))
				elseif "0002" == subcmd then
					wdtree = subtree:add(buffer(total, 8), string.format("wdDeviceData %d", i+1))
				elseif "0080" == subcmd then
					wdtree = subtree:add(buffer(total, 13), string.format("wdDeviceData %d", i+1))
				elseif "0082" == subcmd then
					wdtree = subtree:add(buffer(total, 15), string.format("wdDeviceData %d", i+1))
				else
				end
				offset = parseDevName(buffer(total), subcmd, wdtree, "BIN", "wdDevice")										-- Registrate device name
				wdtree:add(buffer(total+offset,2), "wdData: "..string.format("0x%04X",buffer(total+offset,2):le_uint()))	-- Write Data
				total = total + offset + 2
			end
			
			-- Repeat for double word points
			for i=0,dwpt-1 do
				if "0000" == subcmd then
					dwdtree = subtree:add(buffer(total, 8), string.format("dwdDeviceData %d", i+1))
				elseif "0002" == subcmd then
					dwdtree = subtree:add(buffer(total, 10), string.format("dwdDeviceData %d", i+1))
				elseif "0080" == subcmd then
					dwdtree = subtree:add(buffer(total, 15), string.format("dwdDeviceData %d", i+1))
				elseif "0082" == subcmd then
					dwdtree = subtree:add(buffer(total, 17), string.format("dwdDeviceData %d", i+1))
				else
				end
				offset = parseDevName(buffer(total), subcmd, dwdtree, "BIN", "dwdDevice")									-- Registrate device name
				dwdtree:add(buffer(total+offset,4), "dwdData: "..string.format("0x%08X",buffer(total+offset,4):le_uint()))	-- Write Data
				total = total + offset + 4
			end
			
		else
			-- ASCII
			wpt = tonumber(buffer(0,2):string(),16)
			dwpt = tonumber(buffer(2,2):string(),16)
			
			accesstree = subtree:add(buffer(0,2),"accessNum")
			accesstree:add(buffer(0,2), "wdAccessNum : "..tonumber(buffer(0,2):string(),16))					-- Number of word access points
			accesstree:add(buffer(2,2), "dwdAccessNum: "..tonumber(buffer(2,2):string(),16))					-- Number of double word access points
			total = 4
			
			-- Repeat for word points
			for i=0,wpt-1 do
				if "0000" == subcmd then
					wdtree = subtree:add(buffer(total, 12), string.format("wdDeviceData %d", i+1))
				elseif "0002" == subcmd then
					wdtree = subtree:add(buffer(total, 16), string.format("wdDeviceData %d", i+1))
				elseif "0080" == subcmd then
					wdtree = subtree:add(buffer(total, 24), string.format("wdDeviceData %d", i+1))
				elseif "0082" == subcmd then
					wdtree = subtree:add(buffer(total, 32), string.format("wdDeviceData %d", i+1))
				else
				end
				offset = parseDevName(buffer(total), subcmd, wdtree, "ASC", "wdDevice")					-- Registrate device name
				wdtree:add(buffer(total+offset,4), "wdDevice: 0x"..buffer(total+offset,4):string())		-- Write Data
				total = total + offset + 4
			end
			
			-- Repeat for double word points
			for i=0,dwpt-1 do
				if "0000" == subcmd then
					dwdtree = subtree:add(buffer(total, 16), string.format("dwdDeviceData %d", i+1))
				elseif "0002" == subcmd then
					dwdtree = subtree:add(buffer(total, 20), string.format("dwdDeviceData %d", i+1))
				elseif "0080" == subcmd then
					dwdtree = subtree:add(buffer(total, 28), string.format("dwdDeviceData %d", i+1))
				elseif "0082" == subcmd then
					dwdtree = subtree:add(buffer(total, 36), string.format("dwdDeviceData %d", i+1))
				else
				end			
				offset = parseDevName(buffer(total), subcmd, dwdtree, "ASC", "dwdDevice")			-- Registrate device name
				dwdtree:add(buffer(total+offset,8), "dwdData: 0x"..buffer(total+offset,8):string())	-- Write Data
				total = total + offset + 8
			end
		end
	-- Res
	else
		-- Does not have response data
	end
end


-- EntryMonitorDevice(0801)
function Slmp0801(buffer, subcmd, subtree, isReq, isBin)
	-- Req
	if( isReq ) then
		if( isBin ) then
			-- Binary
			if(subcmd == "0040") then
				-- Specify monitor conditions
				tarMonitorDevice_BIN(buffer, subcmd, subtree)
		else
				-- Don't Specify monitor conditions
				noMonitorDevice_BIN(buffer, subcmd, subtree)
		end
	else
			-- ASCII
			if(subcmd == "0040") then
				-- Specify monitor conditions
				tarMonitorDevice_ASC(buffer, subcmd, subtree)
			else
				-- Don't Specify monitor conditions
				noMonitorDevice_ASC(buffer, subcmd, subtree)
			end 
		end
		
	-- Res
	else
		-- Does not have response data
	end
end

-- ExecuteMonitorDevice(0802)
function Slmp0802(buffer, subcmd, subtree, isReq, isBin)
	-- Req
	if( isReq ) then
		-- Does not have request data
	-- Res
	else
		subtree:add(buffer(), "data: 0x"..buffer()) -- Read Data
	end
end

-- ReadBlock(0406)
function Slmp0406(buffer, subcmd, subtree, isReq, isBin)
	local offset = 0
	local total = 0
	local wpt
	local bpt
	local wdtree
	local bttree
	
	-- Req
	if( isReq ) then
		if( isBin ) then
			-- Binary
			wpt = buffer(0,1):uint()
			bpt = buffer(1,1):uint()
			
			subtree:add(buffer(0,1), "wdDeviceBlockNum: "..buffer(0,1):uint())		-- Word device PointsNumber of word memory blocks
			subtree:add(buffer(1,1), "btDeviceBlockNum: "..buffer(1,1):uint())		-- Number of bit memory blocks
			total = 2
			
			-- Repeat for word blocks
			for i=0,wpt-1 do
				if "0000" == subcmd then
					wdtree = subtree:add(buffer(total, 6), string.format("wdDeviceBlock %d", i+1))
				elseif "0002" == subcmd then
					wdtree = subtree:add(buffer(total, 8), string.format("wdDeviceBlock %d", i+1))
				elseif "0080" == subcmd then
					wdtree = subtree:add(buffer(total, 13), string.format("wdDeviceBlock %d", i+1))
				elseif "0082" == subcmd then
					wdtree = subtree:add(buffer(total, 15), string.format("wdDeviceBlock %d", i+1))
				else
				end
				offset = parseDevName(buffer(total), subcmd, wdtree, "BIN", "typeWdDevice")									-- Registrate device name
				wdtree:add(buffer(total+offset,2), "deviceNum: "..string.format("%d",buffer(total+offset,2):le_uint()))		-- Number of device points
				total = total + offset + 2
			end
			
			-- Repeat for bit blocks
			for i=0,bpt-1 do
				if "0000" == subcmd then
					bttree = subtree:add(buffer(total, 6), string.format("btDeviceBlock %d", i+1))
				elseif "0002" == subcmd then
					bttree = subtree:add(buffer(total, 8), string.format("btDeviceBlock %d", i+1))
				elseif "0080" == subcmd then
					bttree = subtree:add(buffer(total, 13), string.format("btDeviceBlock %d", i+1))
				elseif "0082" == subcmd then
					bttree = subtree:add(buffer(total, 15), string.format("btDeviceBlock %d", i+1))
				else
				end
				offset = parseDevName(buffer(total), subcmd, bttree, "BIN", "typeBtDevice")									-- Registrate device name
				bttree:add(buffer(total+offset,2), "deviceNum: "..string.format("%d",buffer(total+offset,2):le_uint()))		-- Number of device points
				total = total + offset + 2
			end
		else
			-- ASCII
			wpt = tonumber(buffer(0,2):string(),16)
			bpt = tonumber(buffer(2,2):string(),16)
			
			subtree:add(buffer(0,2), "wdDeviceBlockNum: "..tonumber(buffer(0,2):string(),16))			-- Word device PointsNumber of word memory blocks
			subtree:add(buffer(2,2), "btDeviceBlockNum: "..tonumber(buffer(2,2):string(),16))			-- Number of bit memory blocks
			total = 4
			
			-- Repeat for word blocks
			for i=0,wpt-1 do
				if "0000" == subcmd then
					wdtree = subtree:add(buffer(total, 12), string.format("wdDeviceBlock %d", i+1))
				elseif "0002" == subcmd then
					wdtree = subtree:add(buffer(total, 16), string.format("wdDeviceBlock %d", i+1))
				elseif "0080" == subcmd then
					wdtree = subtree:add(buffer(total, 24), string.format("wdDeviceBlock %d", i+1))
				elseif "0082" == subcmd then
					wdtree = subtree:add(buffer(total, 32), string.format("wdDeviceBlock %d", i+1))
				else
				end
				offset = parseDevName(buffer(total), subcmd, wdtree, "ASC", "typeBtDevice")						-- Registrate device name
				wdtree:add(buffer(total+offset,4), "deviceNum: "..tonumber(buffer(total+offset,4):string(),16))	-- Number of device points
				total = total + offset + 4
			end
			
			-- Repeat for bit blocks
			for i=0,bpt-1 do
				if "0000" == subcmd then
					bttree = subtree:add(buffer(total, 12), string.format("btDeviceBlock %d", i+1))
				elseif "0002" == subcmd then
					bttree = subtree:add(buffer(total, 16), string.format("btDeviceBlock %d", i+1))
				elseif "0080" == subcmd then
					bttree = subtree:add(buffer(total, 24), string.format("btDeviceBlock %d", i+1))
				elseif "0082" == subcmd then
					bttree = subtree:add(buffer(total, 32), string.format("btDeviceBlock %d", i+1))
				else
				end
				offset = parseDevName(buffer(total), subcmd, bttree, "ASC", "typeBtDevice")						-- Registrate device name
				bttree:add(buffer(total+offset,4), "deviceNum: "..tonumber(buffer(total+offset,4):string(),16))	-- Number of device points
				total = total + offset + 4
			end
		end
		
	-- Res
	else
		subtree:add(buffer(), "data: 0x"..buffer()) -- Read Data
	end
end

-- WriteBlock(1406)
function Slmp1406(buffer, subcmd, subtree, isReq, isBin)
	local offset = 0
	local total = 0
	local wpt
	local bwpt
	local dbpt
	local blocktree
	local wdtrre
	local bttree
	
	-- Req
	if( isReq ) then
		if( isBin ) then
			-- Binary
			wpt = buffer(0,1):uint()
			bpt = buffer(1,1):uint()
			
			subtree:add(buffer(0,1), "wdDeviceBlockNum: "..buffer(0,1):uint())			-- Number of word memory blocks
			subtree:add(buffer(1,1), "btDeviceBlockNum: "..buffer(1,1):uint())			-- Number of bit memory blocks
			
			total = 2
			
			-- Repeat for word blocks
			for i=0,wpt-1 do
				dbpt = 0
				
				if "0000" == subcmd then
					dbpt = buffer(total+4, 2):le_uint()
					wdtree = subtree:add(buffer(total, 6+dbpt*2), string.format("wdDeviceBlock %d", i+1))
				elseif "0002" == subcmd then
					dbpt = buffer(total+6, 2):le_uint()
					wdtree = subtree:add(buffer(total, 8+dbpt*2), string.format("wdDeviceBlock %d", i+1))
				elseif "0080" == subcmd then
					dbpt = buffer(total+11, 2):le_uint()
					wdtree = subtree:add(buffer(total, 13+dbpt*2), string.format("wdDeviceBlock %d", i+1))
				elseif "0082" == subcmd then
					dbpt = buffer(total+13, 2):le_uint()
					wdtree = subtree:add(buffer(total, 15+dbpt*2), string.format("wdDeviceBlock %d", i+1))
				else
				end
				
				offset = parseDevName(buffer(total), subcmd, wdtree, "BIN", string.format("typeWdDevice"))							-- Registrate device name
				
				
				wdtree:add(buffer(total+offset,2), string.format("deviceNum: %d", buffer(total+offset,2):le_uint()))				-- Number of device points
				offset = offset + 2
				
				blocktree = wdtree:add(buffer(total+offset, 2*dbpt),string.format("wdDataBlock"))
				for j=0,dbpt-1 do
					blocktree:add(buffer(total+offset,2), string.format("data %-4d: 0x%04X", j+1, buffer(total+offset,2):le_uint()))	-- Per one data item in block
					offset = offset + 2
				end
				
				total = total + offset
			end
			
			-- Repeat for bit blocks
			for i=0,bpt-1 do
				dbpt = 0
				if "0000" == subcmd then
					dbpt = buffer(total+4, 2):le_uint()
					bttree = subtree:add(buffer(total, 6+dbpt*2), string.format("btDeviceBlockData %d", i+1))
				elseif "0002" == subcmd then
					dbpt = buffer(total+6, 2):le_uint()
					bttree = subtree:add(buffer(total, 8+dbpt*2), string.format("btDeviceBlockData %d", i+1))
				elseif "0080" == subcmd then
					dbpt = buffer(total+11, 2):le_uint()
					bttree = subtree:add(buffer(total, 13+dbpt*2), string.format("btDeviceBlockData %d", i+1))
				elseif "0082" == subcmd then
					dbpt = buffer(total+13, 2):le_uint()
					bttree = subtree:add(buffer(total, 15+dbpt*2), string.format("btDeviceBlockData %d", i+1))
				else
				end
				
				offset = parseDevName(buffer(total), subcmd, bttree, "BIN", string.format("typeBtDevice"))							-- Registrate device name
				
				
				bttree:add(buffer(total+offset,2), string.format("deviceNum: %d", buffer(total+offset,2):le_uint()))				-- Number of device points
				offset = offset + 2
				
				blocktree = bttree:add(buffer(total+offset,2*dbpt), string.format("btDataBlock"))
				for j=0,dbpt-1 do
					blocktree:add(buffer(total+offset,2),string.format("data %-4d: 0x%04X", j+1, buffer(total+offset,2):le_uint()))	-- Per one data item in block
					offset = offset + 2
				end
				
				total = total + offset
			end
		else
			-- ASCII
			wpt = tonumber(buffer(0,2):string(),16)
			bpt = tonumber(buffer(2,2):string(),16)
			
			subtree:add(buffer(0,2), "wdDeviceBlockNum: "..tonumber(buffer(0,2):string(),16))			-- Number of word memory blocks
			subtree:add(buffer(2,2), "btDeviceBlockNum: "..tonumber(buffer(2,2):string(),16))			-- Number of bit memory blocks
			total = 4
			
			-- Repeat for word blocks
			for i=0,wpt-1 do
				dbpt = 0
				
				if "0000" == subcmd then
					dbpt = tonumber(buffer(total+8, 4):string(),16)
					wdtree = subtree:add(buffer(total, 12+dbpt*4), string.format("wdDeviceBlock %d", i+1))
				elseif "0002" == subcmd then
					dbpt = tonumber(buffer(total+12, 4):string(),16)
					wdtree = subtree:add(buffer(total, 16+dbpt*4), string.format("wdDeviceBlock %d", i+1))
				elseif "0080" == subcmd then
					dbpt = tonumber(buffer(total+20, 4):string(),16)
					wdtree = subtree:add(buffer(total, 24+dbpt*4), string.format("wdDeviceBlock %d", i+1))
				elseif "0082" == subcmd then
					dbpt = tonumber(buffer(total+28, 4):string(),16)
					wdtree = subtree:add(buffer(total, 32+dbpt*4), string.format("wdDeviceBlock %d", i+1))
				else
				end
				
				offset = parseDevName(buffer(total), subcmd, wdtree, "ASC", string.format("typeWdDevice"))							-- Registrate device name
				
				wdtree:add(buffer(total+offset,4), string.format("deviceNum: %d", tonumber(buffer(total+offset,4):string(),16)))	-- Number of device points
				offset = offset + 4
				
				blocktree = wdtree:add(buffer(total+offset, 4*dbpt),string.format("wdDataBlock"))
				for j=0,dbpt-1 do
					blocktree:add(buffer(total+offset,4), string.format("data %-4d: 0x%s", j+1, buffer(total+offset,4):string()))	-- Per one data item in block
					offset = offset + 4
				end
				
				total = total + offset
			end
			
			-- Repeat for bit blocks
			for i=0,bpt-1 do
				dbpt = 0
				if "0000" == subcmd then
					dbpt = tonumber(buffer(total+8, 4):string(),16)
					bttree = subtree:add(buffer(total, 12+dbpt*4), string.format("btDeviceBlockData %d", i+1))
				elseif "0002" == subcmd then
					dbpt = tonumber(buffer(total+12, 4):string(),16)
					bttree = subtree:add(buffer(total, 16+dbpt*4), string.format("btDeviceBlockData %d", i+1))
				elseif "0080" == subcmd then
					dbpt = tonumber(buffer(total+20, 4):string(),16)
					bttree = subtree:add(buffer(total, 24+dbpt*4), string.format("btDeviceBlockData %d", i+1))
				elseif "0082" == subcmd then
					dbpt = tonumber(buffer(total+28, 4):string(),16)
					bttree = subtree:add(buffer(total, 32+dbpt*4), string.format("btDeviceBlockData %d", i+1))
				else
				end
				offset = parseDevName(buffer(total), subcmd, bttree, "ASC", string.format("typeBtDevice"))							-- Registrate device name
				
				bttree:add(buffer(total+offset,4), string.format("deviceNum: %d", tonumber(buffer(total+offset,4):string(),16)))	-- Number of device points
				offset = offset + 4
				
				blocktree = bttree:add(buffer(total+offset, 4*dbpt),string.format("btDataBlock"))
				for j=0,dbpt-1 do
					blocktree:add(buffer(total+offset,4), string.format("data %-4d: 0x%s", j+1, buffer(total+offset,4):string()))	-- Per one data item in block
					offset = offset + 4
				end
				
				total = total + offset
			end
		end
		
	-- Res
	else
		-- Does not have response data
	end
end

-- ArrayLableRead(041A)
function Slmp041A(buffer, subcmd, subtree, isReq, isBin)
	local total
	local offset
	local strdata
	local arrpt
	local expt
	local accesstree
	local lbltree
	total = 0
	offset = 0
	strdata = ""
	
	-- Req
	if( isReq ) then
		if( isBin ) then
			-- Binary
			arrpt = buffer(0,2):le_uint()
			expt = buffer(2,2):le_uint()
			
			accesstree = subtree:add(buffer(0,4),"accessNum")
			accesstree:add(buffer(0,2), "arrayNum          : "..buffer(0,2):le_uint())	-- Array Points
			accesstree:add(buffer(2,2), "labelExtensionNum : "..buffer(2,2):le_uint())	-- Extension specification labels
			total = 4
			
			-- Repeat for Extension specification label points
			for i=0,expt-1 do
				namelen = buffer(total, 2):le_uint()
				
				abbtree = subtree:add(buffer(total+0, 2 + (namelen * 2)), 	"labelDataExtension "..(i+1))
				abbtree:add(buffer(total+0, 2), 							"labelNameLengthExtension: "..buffer(total+0, 2):le_uint())				-- Label Name Length
				abbtree:add(buffer(total+2, namelen*2), 					"labelNameExtension      : "..buffer(total+2, namelen*2):le_ustring())	-- Label Name
				
				total = total + 2 + (namelen * 2)
			end
			
			-- Repeat fot array points
			for i=0,arrpt-1 do
				namelen = buffer(total, 2):le_uint()
				
				lbltree = subtree:add(buffer(total, 6 + (namelen * 2)), "labelData "..(i+1))
				lbltree:add(buffer(total + 0, 2), 						"labelNameLength: "..buffer(total+0, 2):le_uint())							-- Label Name Length
				lbltree:add(buffer(total + 2, namelen*2), 				"labelName      : "..buffer(total+2, namelen*2):le_ustring())				-- Label Name
				lbltree:add(buffer(total + 2 + (namelen * 2) + 0, 1), 	"readUnit       : "..string.format("0x%02X",buffer(total + 2 + (namelen * 2) + 0, 1):uint()))	-- Reading unit specification
				lbltree:add(buffer(total + 2 + (namelen * 2) + 1, 1), 	"reserved1      : "..string.format("0x%02X",buffer(total + 2 + (namelen * 2) + 1, 1):uint()))	-- For future expansion
				lbltree:add(buffer(total + 2 + (namelen * 2) + 2, 2), 	"dataLength     : "..buffer(total + 2 + (namelen * 2) + 2, 2):le_uint())	-- Length of array data to read

				total = total + 6 + (namelen * 2)
			end
		else
			-- ASCII
			arrpt = tonumber(buffer(0,4):string(),16)
			expt = tonumber(buffer(4,4):string(),16)
			
			accesstree = subtree:add(buffer(0,8),"accessNum")
			accesstree:add(buffer(0,4), "arrayNum          : "..tonumber(buffer(0,4):string(),16))		-- Array Points
			accesstree:add(buffer(4,4), "labelExtensionNum : "..tonumber(buffer(4,4):string(),16))		-- Extension specification labels
			total = 8
			
			-- Repeat for Extension specification labels
			for i=0,expt-1 do
				namelen = tonumber(buffer(total, 4):string(),16)
				
				abbtree = subtree:add(buffer(total+0, 4 + (namelen * 4)), "labelDataExtension "..(i+1))
				abbtree:add(buffer(total+0, 4), 		"labelNameLengthExtension: "..namelen)									-- Label Name Length
				abbtree:add(buffer(total+4, namelen*4), "labelNameExtension      : "..buffer(total+4, namelen * 4):string())	-- Label Name
				
				total = total + 4 + (namelen * 4)
			end
			
			-- Repeat for array points
			for i=0,arrpt-1 do
				namelen = tonumber(buffer(total, 4):string(),16)
				lbltree = subtree:add(buffer(total, 12 + (namelen * 4)), "labelData "..(i+1))
				lbltree:add(buffer(total+0, 4), 						"labelNameLength: "..namelen)															-- Label Name Length
				lbltree:add(buffer(total+4, namelen*4), 				"labelName      : "..buffer(total+4, namelen*4):string())								-- Label Name
				lbltree:add(buffer(total + 4 + (namelen * 4) + 0, 2), 	"readUnit       : 0x"..buffer(total + 4 + (namelen * 4) + 0, 2):string())				-- Reading unit specification
				lbltree:add(buffer(total + 4 + (namelen * 4) + 2, 2), 	"reserved1      : 0x"..buffer(total + 4 + (namelen * 4) + 2, 2):string())				-- For future expansion
				lbltree:add(buffer(total + 4 + (namelen * 4) + 4, 4), 	"dataLength     : "..tonumber(buffer(total + 4 + (namelen * 4) + 4, 4):string(),16))	-- Length of array data to read

				total = total + 12 + (namelen * 4)
			end
		end
	-- Res
	else
		local unit
		local strdata = ""
		if( isBin ) then
			-- Binary
			arrpt = buffer(0,2):le_uint()
			subtree:add(buffer(0,2),"arrayNum: "..buffer(0,2):le_uint())
			total = 2
			
			-- Repeat for array points
			for i=0,arrpt-1 do
				datalen = buffer(total + 2, 2):le_uint()
				unit = buffer(total+1, 1):int()
				-- word-unit datalen conversion
				if 0 < datalen then
					if 0 == unit then
						-- bit
						datalen = (math.floor((datalen-1) / 16) + 1) * 2
					else
						-- word
						datalen = (math.floor((datalen-1) / 2) + 1) * 2
					end
				end
				lbltree = subtree:add(buffer(total, 4 + datalen), "labelData"..(i+1))
				lbltree:add(buffer(total+0, 1),			 "dataTypeId: "..string.format("%02X",buffer(total+0, 1):uint()))	-- Data type ID
				lbltree:add(buffer(total+1, 1),			 "readUnit  : "..string.format("%02X",buffer(total+1, 1):uint()))	-- Reading unit specification
				lbltree:add(buffer(total+2, 2),			 "dataLength: "..buffer(total+2, 2):le_uint())						-- Length of array data to read
				strdata = "0x"
				for j=0,datalen-1,2 do
					strdata = string.format("%s%04X", strdata, buffer(total+4+j,2):le_uint())
				end
				if 0 == datalen then
					-- Do nothing
				else
					lbltree:add(buffer(total+4, datalen),	 "data      : "..strdata)							-- Data to read
				end
				
				
				total = total + 4 + datalen
			end
		else
			-- ASCII
			arrpt = tonumber(buffer(0,4):string(),16)
			subtree:add(buffer(0,4),"arrayNum: "..tonumber(buffer(0,4):string(),16))
			total = 4
			
			-- Repeat for array points
			for i=0,arrpt-1 do
				datalen = tonumber(buffer(total + 4, 4):string(),16)
				unit = tonumber(buffer(total+2, 2):string(),16)
				-- word-unit datalen conversion
				if 0 < datalen then
					if 0 == unit then
						-- bit
						datalen = (math.floor((datalen-1) / 16) + 1) * 2
					else
						-- word
						datalen = (math.floor((datalen-1) / 2) + 1) * 2
					end
				end
				lbltree = subtree:add(buffer(total, 8 + datalen), "labelData"..(i+1))
				lbltree:add(buffer(total+0, 2), 		"dataTypeId: "..buffer(total+0, 2):string())			-- Data type ID
				lbltree:add(buffer(total+2, 2), 		"readUnit  : "..buffer(total+2, 2):string())			-- Reading unit specification
				lbltree:add(buffer(total+4, 4), 		"dataLength: "..buffer(total+4, 4):string())			-- Length of array data to read
				strdata = "0x"
				for j=0,datalen*2-1,4 do
					strdata = strdata..buffer(total+8+j, 4):string()
				end
				lbltree:add(buffer(total+8, datalen*2), 	"data      : "..strdata)							-- Data to read
				
				total = total + 8 + datalen
			end
		end
	end
end

-- ArrayLabelWrite(141A)
function Slmp141A(buffer, subcmd, subtree, isReq, isBin)
	local total
	local offset
	local strdata
	local arrpt
	local expt
	local accesstree
	local lbltree
	
	total = 0
	offset = 0
	strdata = ""
	
	-- Req
	if( isReq ) then
		if( isBin ) then
			-- Binary
			arrpt = buffer(0,2):le_uint()
			expt = buffer(2,2):le_uint()
			
			accesstree = subtree:add(buffer(0,4),"accessNum")
			accesstree:add(buffer(0,2), "arrayNum          : "..buffer(0,2):le_uint())	-- Array Points
			accesstree:add(buffer(2,2), "labelExtensionNum : "..buffer(2,2):le_uint())	-- Extension specification labels
			total = 4
			
			-- Repeat for Extension specification labels
			for i=0,expt-1 do
				namelen = buffer(total, 2):le_uint()
				
				abbtree = subtree:add(buffer(total+0, 2 + (namelen * 2)), "labelDataExtension "..(i+1))
				abbtree:add(buffer(total+0, 2), 		"labelNameLengthExtension: "..buffer(total+0, 2):le_uint())				-- Label Name Length
				abbtree:add(buffer(total+2, namelen*2),	"labelNameExtension      : "..buffer(total+2, namelen*2):le_ustring())	-- Label Name
				
				total = total + 2 + (namelen * 2)
			end
			
			-- Repeat fot array points
			for i=0,arrpt-1 do
				namelen = buffer(total, 2):le_uint()
				unit    = buffer(total + 2 + (namelen * 2) + 0, 1):uint()
				arrlen  = buffer(total + 2 + (namelen * 2) + 2, 2):le_uint()
				
				-- Bit-wise point conversion
				if( arrlen > 0 ) then
					if(unit == 0) then
						-- bit unit
						arrlen = (math.floor((arrlen-1) / 16) +1 ) * 2
					else
						-- word unit
						arrlen = (math.floor((arrlen-1) / 2) +1 ) * 2
					end
				end
				
				lbltree = subtree:add(buffer(total, 6 + (namelen * 2) + arrlen), "labelData "..(i+1))
				lbltree:add(buffer(total+0, 2), 							"labelNameLength: "..buffer(total+0, 2):le_uint())								-- Label Name Length
				lbltree:add(buffer(total+2, namelen*2),						"labelName      : "..buffer(total+2, namelen*2):le_ustring())					-- Label Name
				lbltree:add(buffer(total + 2 + (namelen * 2) + 0, 1),		"writeUnit      : "..string.format("0x%02X",buffer(total + 2 + (namelen * 2) + 0, 1):uint()))	-- Writing unit specification
				lbltree:add(buffer(total + 2 + (namelen * 2) + 1, 1),		"reserved1      : "..string.format("0x%02X",buffer(total + 2 + (namelen * 2) + 1, 1):uint()))	-- For future expansion
				lbltree:add(buffer(total + 2 + (namelen * 2) + 2, 2),		"dataLength     : "..buffer(total + 2 + (namelen * 2) + 2, 2):le_uint())		-- Length of array data to write
				strdata = "0x"
				for j=0,arrlen-1,2 do
					strdata = string.format("%s%04X", strdata, buffer(total+6+(namelen*2)+j,2):le_uint())
				end
				lbltree:add(buffer(total + 2 + (namelen * 2) + 4, arrlen),	"writeData      : "..strdata)													-- Data to write
				
				total = total + 6 + (namelen * 2) + arrlen
			end
		else
			-- ASCII
			arrpt = tonumber(buffer(0,4):string(),16)
			expt = tonumber(buffer(4,4):string(),16)
			
			accesstree = subtree:add(buffer(0,8),"accessNum")
			accesstree:add(buffer(0,4), "arrayNum          : "..tonumber(buffer(0,4):string(),16))		-- Array Points
			accesstree:add(buffer(4,4), "labelExtensionNum : "..tonumber(buffer(4,4):string(),16))		-- Extension specification labels
			total = 8
			
			-- Repeat for Extension specification labels
			for i=0,expt-1 do
				namelen = tonumber(buffer(total, 4):string(),16)
				
				abbtree = subtree:add(buffer(total+0, 4 + (namelen * 4)), "labelDataExtension "..(i+1))
				abbtree:add(buffer(total+0, 4),			"labelNameLengthExtension: "..namelen)									-- Label Name Length
				abbtree:add(buffer(total+4, namelen*4),	"labelNameExtension      : "..buffer(total+4, namelen*4):string())		-- Label Name
				
				total = total + 4 + (namelen * 4)
			end
			
			-- Repeat for array points
			for i=0,arrpt-1 do
				namelen = tonumber(buffer(total, 4):string(),16)
				unit    = tonumber(buffer(total + 4 + (namelen * 4) + 0, 2):string(),16)
				arrlen  = tonumber(buffer(total + 4 + (namelen * 4) + 4, 4):string(),16)
				
				-- Bit-wise point conversion
				if( arrlen > 0 ) then
					if(unit == 0) then
						-- bit unit
						arrlen = (math.floor((arrlen-1) / 16) +1 ) * 2
					else
						-- word unit
						arrlen = (math.floor((arrlen-1) / 2) +1 ) * 2
					end
				end
				
				lbltree = subtree:add(buffer(total, 12 + (namelen * 4) + arrlen*2), "labelData"..(i+1))
				lbltree:add(buffer(total+0, 4),									"labelNameLength: "..namelen)														-- Label Name Length
				lbltree:add(buffer(total+4, namelen*4),							"labelName      : "..buffer(total+4, namelen*4):string())							-- Label Name
				lbltree:add(buffer(total + 4 + (namelen * 4) + 0, 2),			"writeUnit      : 0x"..buffer(total + 4 + (namelen * 4) + 0, 2):string())			-- Writing unit specification
				lbltree:add(buffer(total + 4 + (namelen * 4) + 2, 2),			"reserved1      : 0x"..buffer(total + 4 + (namelen * 4) + 2, 2):string())			-- For future expansion
				lbltree:add(buffer(total + 4 + (namelen * 4) + 4, 4),			"dataLength     : "..tonumber(buffer(total + 4 + (namelen * 4) + 4, 4):string(),16))-- Length of array data to write
				strdata = "0x"
				for j=0,arrlen*2-1,4 do
					strdata = strdata..buffer(total+12+(namelen*4)+j,4):string()
				end
				lbltree:add(buffer(total + 4 + (namelen * 4) + 8, arrlen * 2),	"writeData      : "..strdata)														-- Data to write
				
				total = total + 12 + (namelen * 4) + arrlen*2
			end
		end
	-- Res
	else
		-- Does not have response data
	end
end

-- LableReadRandom(041C)
function Slmp041C(buffer, subcmd, subtree, isReq, isBin)
	local rdpt
	local expt
	local labellen
	local extree
	local datatree
	local accesstree
	local offset = 0
		
	
	-- Req
	if( isReq ) then
		if( isBin ) then 
			-- Binary
			rdpt = buffer(0,2):le_uint()
			expt = buffer(2,2):le_uint()
			
			accesstree = subtree:add(buffer(0,4),"accessNum")
			accesstree:add(buffer(0,2),	 	"readDataNum      : "..buffer(0,2):le_uint())		-- Number of data points to be read
			if( expt == 0 ) then
				-- Extend Specify is invalid
				accesstree:add(buffer(2,2),	"reserved2        : "..string.format("0x%04X",buffer(2,2):le_uint()))		-- For future expansion
			else
				-- Extend Specify is valid
				accesstree:add(buffer(2,2),	"labelExtensionNum: "..buffer(2,2):le_uint())		-- Number of extension specification labels
			end
			offset = offset + 4
				
			-- Repeat for Extend specify label points
			for i=0,expt-1 do
				labellen = buffer(offset, 2):le_uint()
					
				extree = subtree:add(buffer(offset,2+labellen*2),string.format(	"labelDataExtension %d", i+1))
				extree:add(buffer(offset,2), string.format(				"labelNameLengthExtension: %d", buffer(offset, 2):le_uint()))				-- Label name length
				extree:add(buffer(offset+2,labellen*2), string.format(	"labelNameExtension      : %s", buffer(offset+2,labellen*2):le_ustring()))	-- Label name
				offset = offset + 2 + labellen*2
			end
				
			-- Repeat for Readdata points
			for i=0,rdpt-1 do
				labellen = buffer(offset, 2):le_uint()
					
				datatree = subtree:add(buffer(offset,2+labellen*2),string.format("labelData %d", i+1))
				datatree:add(buffer(offset,2), string.format(			"labelNameLength: %d", buffer(offset, 2):le_uint()))				-- Label name length
				datatree:add(buffer(offset+2,labellen*2), string.format("labelName      : %s", buffer(offset+2,labellen*2):le_ustring()))	-- Label name
				offset = offset + 2 + labellen*2
			end
		else
			-- ASCII
			rdpt = tonumber(buffer(0,4):string(),16)
			expt = tonumber(buffer(4,4):string(),16)
			
			accesstree = subtree:add(buffer(0,8),"accessNum")
			accesstree:add(buffer(0,4), 	"readDataNum      : "..tonumber(buffer(0,4):string(),16))		-- Number of data points to be read
			if( expt == 0 ) then
				-- Extend Specify is invalid
				accesstree:add(buffer(4,4),	"reserved2        : 0x"..buffer(4,4):string())					-- For future expansion
			else
				-- Extend Specify is valid
				accesstree:add(buffer(4,4),	"labelExtensionNum: "..tonumber(buffer(4,4):string(),16))		-- Number of extension specification labels
			end	
				offset = offset + 8
				
			-- Repeat for Extend specify label points
			for i=0,expt-1 do
				labellen = tonumber(buffer(offset, 4):string(),16)
					
				extree = subtree:add(buffer(offset,4+labellen*4),string.format("labelDataExtension %d", i+1))
				extree:add(buffer(offset,4), string.format(				"labelNameLengthExtension: %d", labellen))								-- Label name length
				extree:add(buffer(offset+4,labellen*4), string.format(	"labelNameExtension      : %s", buffer(offset+4,labellen*4):string()))	-- Label name
				offset = offset + 4 + labellen*4
			end
				
			-- Repeat for Readdata points
			for i=0,rdpt-1 do
				labellen = tonumber(buffer(offset, 4):string(),16)

				datatree = subtree:add(buffer(offset,4+labellen*4),string.format("labelData %d", i+1))
				datatree:add(buffer(offset,4), string.format(			"labelNameLength: %s", labellen))								-- Label name length
				datatree:add(buffer(offset+4,labellen*4), string.format("labelName      : %s",  buffer(offset+4,labellen*4):string()))	-- Label name
				offset = offset + 4 + labellen*4
			end
		end
		
	-- Res
	else
		local datatree
		local datalen
		if( isBin ) then
			-- Binary
			rdpt = buffer(0,2):le_uint()
			subtree:add(buffer(0,2),"readDataNum: "..buffer(0,2):le_uint())				-- Number of data points to be read
			offset = 2
			for i=0, rdpt-1 do
				datalen = buffer(offset+2,2):le_uint()
				datatree = subtree:add(buffer(offset,4+datalen), string.format("labelData %d", i+1))
				datatree:add(buffer(offset+0,1), "dataTypeId: "..string.format("0x%02X", buffer(offset+0,1):uint()))		-- Data type ID
				datatree:add(buffer(offset+1,1), "reserved1 : "..string.format("0x%02X", buffer(offset+1,1):uint()))		-- For future expansion
				datatree:add(buffer(offset+2,2), "dataLength: "..buffer(offset+2,2):le_uint())								-- Length of data to read
				datatree:add(buffer(offset+4,datalen), string.format("data      : 0x%s",buffer(offset+4,datalen)))			-- Data to read
				offset = offset + 4 + datalen
			end
		else
			-- ASCII
			rdpt = tonumber(buffer(0,4):string(),16)
			subtree:add(buffer(0,4),"readDataNum: "..tonumber(buffer(0,4):string(),16))					-- Number of data points to be read
			offset = 4
			for i=0, rdpt-1 do
				datalen = tonumber(buffer(offset+4,4):string())
				datatree = subtree:add(buffer(offset,8+datalen*2), string.format("labelData %d", i+1))
				datatree:add(buffer(offset+0,2), 		"dataTypeId: 0x"..buffer(offset+0,2):string())			-- Data type ID
				datatree:add(buffer(offset+2,2), 		"reserved1 : 0x"..buffer(offset+2,2):string())			-- For future expansion
				datatree:add(buffer(offset+4,4), 		"dataLength: "..datalen)								-- Length of data to read
				datatree:add(buffer(offset+8,datalen*2),"data      : 0x"..buffer(offset+8,datalen*2):string())	-- Data to read
				offset = offset + 8 + datalen*2
			end
		end
	end
end

-- LableWriteRandom(141B)
function Slmp141B(buffer, subcmd, subtree, isReq, isBin)
	local wdpt
	local expt
	local labellen
	local datalen
	local extree
	local datatree
	local accesstree
	local offset = 0
		
	-- Req
	if( isReq ) then
		if( isBin ) then 
			-- Binary
			wdpt = buffer(0,2):le_uint()
			expt = buffer(2,2):le_uint()
			
			accesstree = subtree:add(buffer(0,4),"accessNum")
			accesstree:add(buffer(0,2), 		"writeDataNum     : "..buffer(0,2):le_uint())	-- Number of data points to write
			if( expt == 0 ) then
				-- Extend Specify is invalid
				accesstree:add(buffer(2,2),		"reserved2        : "..string.format("0x%04X",buffer(2,2):le_uint()))	-- For future expansion
			else
				-- Extend Specify is valid
				accesstree:add(buffer(2,2), 	"labelExtensionNum: "..buffer(2,2):le_uint())	-- Number of extension specification labels
			end
				offset = offset + 4
				
			-- Repeat for Extend specify label points
			for i=0,expt-1 do
				labellen = buffer(offset, 2):le_uint()
					
				extree = subtree:add(buffer(offset,2+labellen*2),string.format("labelDataExtension %d", i+1))
				extree:add(buffer(offset,2), string.format(				"labelNameLengthExtension: %d", buffer(offset, 2):le_uint()))				-- Label name length
				extree:add(buffer(offset+2,labellen*2), string.format(	"labelNameExtension      : %s", buffer(offset+2,labellen*2):le_ustring()))	-- Label name
				offset = offset + 2 + labellen*2
			end
				
			-- Repeat for write data points
			for i=0,wdpt-1 do
				labellen = buffer(offset, 2):le_uint()
				datalen = buffer(offset+2+labellen*2, 2):le_uint()
					
				datatree = subtree:add(buffer(offset,4+labellen*2+datalen),string.format("labelData %d", i+1))
				-- Label name
				datatree:add(buffer(offset,2), string.format(			"labelNameLength: %d", buffer(offset, 2):le_uint()))				-- Label name length
				datatree:add(buffer(offset+2,labellen*2), string.format("labelName      : %s", buffer(offset+2,labellen*2):le_ustring()))	-- Label name
				offset = offset + 2 + labellen*2
					
				-- Write data
				datatree:add(buffer(offset,2), string.format(			"dataLength     : %d", buffer(offset, 2):le_uint()))				-- Length of data to write
				datatree:add(buffer(offset+2,datalen), string.format(	"writeData      : 0x%s", buffer(offset+2,datalen)))					-- Write data
				offset = offset + 2 + datalen
				end
		else
			-- ASCII
			wdpt = tonumber(buffer(0,4):string(),16)
			expt = tonumber(buffer(4,4):string(),16)
			
			accesstree = subtree:add(buffer(0,8),"accessNum")
			accesstree:add(buffer(0,4), 		"writeDataNum     : "..tonumber(buffer(0,4):string(),16))		-- Number of data points to write
			if( expt == 0 ) then
				-- Extend Specify is invalid
				accesstree:add(buffer(4,4), "reserved2        : 0x"..buffer(4,4):string())					-- For future expansion
			else
				-- Extend Specify is valid
				accesstree:add(buffer(4,4), "labelExtensionNum: "..tonumber(buffer(4,4):string(),16))		-- Number of extension specification labels
			end
				offset = offset + 8
				
			-- Repeat for Extend specify label points
			for i=0,expt-1 do
				labellen = tonumber(buffer(offset, 4):string(),16)

				extree = subtree:add(buffer(offset,4+labellen*4),string.format("labelDataExtension %d", i+1))
				extree:add(buffer(offset,4), string.format(				"labelNameLengthExtension: %s", labellen))									-- Label name length
				extree:add(buffer(offset+4,labellen*4), string.format(	"labelNameExtension      : %s", buffer(offset+4,labellen*4):string()))		-- Label name
				offset = offset + 4 + labellen*4
			end
				
			-- Repeat for write data points
			for i=0,wdpt-1 do
				labellen = tonumber(buffer(offset, 4):string(),16)
				datalen = tonumber(buffer(offset+4+labellen*4, 4):string(),16)
					
				datatree = subtree:add(buffer(offset,8+labellen*4+datalen*2),string.format("labelData %d", i+1))
				-- Label name
				datatree:add(buffer(offset,4), string.format(			"labelNameLength: %d", labellen))								-- Label name length
				datatree:add(buffer(offset+4,labellen*4), string.format("labelName      : %s", buffer(offset+4,labellen*4):string()))	-- Label name
				offset = offset + 4 + labellen*4
					
				-- Write data
				datatree:add(buffer(offset,4), string.format(			"dataLength     : %d", datalen))								-- Length of data to write
				datatree:add(buffer(offset+4,datalen*2), string.format(	"writeData      : 0x%s", buffer(offset+4,datalen*2):string()))	-- Write data
					offset = offset + 4 + datalen*2
				end
			end
		
	-- Res
	else
		-- Does not have response data
	end
end

-- MemoryRead(0613)
function Slmp0613(buffer, subcmd, subtree, isReq, isBin)
	-- Req
	if( isReq ) then
		-- Binary
		if( isBin ) then
			subtree:add(buffer(0 , 4), "startAddr            : "..string.format("%08X",buffer(0,4):le_uint()))	-- Starting address
			subtree:add(buffer(4 , 2), "wl                   : "..buffer(4 , 2):le_uint())						-- Word length
		
		-- ASCII
		else
			subtree:add(buffer(0 , 8), "startAddr            : "..buffer(0 , 8):string())						-- Starting address
			subtree:add(buffer(8 , 4), "wl                   : "..buffer(8 , 4):string())						-- Word length
		end
		
	-- Res
	else
		subtree:add(buffer(), "wdDataBlock            : "..buffer())											-- Data (word unit)
	end
end

-- MemoryWrite(1613)
function Slmp1613(buffer, subcmd, subtree, isReq, isBin)
	-- Req
	if( isReq ) then
		-- Binary
		if( isBin ) then
			subtree:add(buffer(0 , 4), "startAddr            : "..string.format("%08X",buffer(0,4):le_uint()))	-- Starting address
			subtree:add(buffer(4 , 2), "wl                   : "..buffer(4 , 2):le_uint())						-- Word length
			subtree:add(buffer(6), "data                 : "..buffer(6))										-- Data (word unit)
		-- ASCII
		else
			subtree:add(buffer(0 , 8), "startAddr            : "..buffer(0 , 8):string())						-- Starting address
			subtree:add(buffer(8 , 4), "wl                   : "..buffer(8 , 4):string())						-- Word length
			subtree:add(buffer(12), "data                 : "..buffer(12):string())								-- Data (word unit)
		end
		
	-- Res
	else
		-- Does not have response data
	end
end

-- ExtendUnitRead(0601)
function Slmp0601(buffer, subcmd, subtree, isReq, isBin)
	-- Req
	if( isReq ) then
		-- Binary
		if( isBin ) then
			subtree:add(buffer(0 , 4), "startAddr            : "..string.format("%08X",buffer(0,4):le_uint()))	-- Starting address
			subtree:add(buffer(4 , 2), "byteNum              : "..buffer(4 , 2):le_uint())						-- Number of bytes
			subtree:add(buffer(6 , 2), "unitNo               : "..buffer(6 , 2):le_uint())						-- Module number
		
		-- ASCII
		else
			subtree:add(buffer(0 , 8), "startAddr            : "..buffer(0 , 8):string())						-- Starting address
			subtree:add(buffer(8 , 4), "byteNum              : "..buffer(8 , 4):string())						-- Number of bytes
			subtree:add(buffer(12 , 4),"unitNo               : "..buffer(12 , 4):string())						-- Module number
		end
		
	-- Res
	else
		subtree:add(buffer(), "data : "..buffer())																-- Data
	end
end

-- ExtendUnitWrite(1601)
function Slmp1601(buffer, subcmd, subtree, isReq, isBin)
	-- Req
	if( isReq ) then
		-- Binary
		if( isBin ) then
			subtree:add(buffer(0 , 4), "startAddr            : "..string.format("%08X",buffer(0,4):le_uint()))	-- Starting address
			subtree:add(buffer(4 , 2), "byteNum              : "..buffer(4 , 2):le_uint())						-- Number of bytes
			subtree:add(buffer(6 , 2), "unitNo               : "..buffer(6 , 2):le_uint())						-- Module number
			subtree:add(buffer(8), "data                 : "..buffer(8))										-- Data
		
		-- ASCII
		else
			subtree:add(buffer(0 , 8), "startAddr            : "..buffer(0 , 8):string())						-- Starting address
			subtree:add(buffer(8 , 4), "byteNum              : "..buffer(8 , 4):string())						-- Number of bytes
			subtree:add(buffer(12 , 4),"unitNo               : "..buffer(12 , 4):string())						-- Module number
			subtree:add(buffer(16), "data                 : "..buffer(16):string())								-- Data
		end
		
	-- Res
	else
		-- Does not have response data
	end
end

-- RemoteRun(1001)
function Slmp1001(buffer, subcmd, subtree, isReq, isBin)
	-- Req
	if( isReq ) then
		-- Binary
		if( isBin ) then
			local modeTbl = {
				[1] = "Does not perform forced execution.",
				[3] = "Performs forced execution.",
			}
			
			local clearModeTbl = {
				[0] = "Does not clear the internal memory.",
				[1] = "Clears the internal memory outside the latch range.",
				[2] = "Clears the entire internal memory including the latch range.",
			}
			
			local modeTemp = lookup(buffer(0,2):le_uint(),modeTbl,"For future expansion")
			subtree:add(buffer(0 , 2), string.format("mode                 : 0x%04x [%s] ",buffer(0 , 2):le_uint(), modeTemp))			-- Mode
			
			local clearModeTemp = lookup(buffer(2,1):le_uint(),clearModeTbl,"For future expansion")
			subtree:add(buffer(2 , 1), string.format("clearMode            : 0x%02x [%s] ",buffer(2 , 1):le_uint(), clearModeTemp))		-- Clear mode
			
			subtree:add(buffer(3 , 1), "reserved1            : "..buffer(3 , 1))														-- For future expansion
		
		-- ASCII
		else
			local modeTbl = {
				["0001"] = "Does not perform forced execution.",
				["0003"] = "Performs forced execution.",
			}
			
			local clearModeTbl = {
				["00"] = "Does not clear the internal memory.",
				["01"] = "Clears the internal memory outside the latch range.",
				["02"] = "Clears the entire internal memory including the latch range.",
			}
			
			local modeTemp = lookup(buffer(0,4):string(),modeTbl,"For future expansion")
			subtree:add(buffer(0 , 4), string.format("mode                 : 0x%04x [%s] ",buffer(0 , 4):string(), modeTemp))			-- Mode
			
			local clearModeTemp = lookup(buffer(4,2):string(),clearModeTbl,"For future expansion")
			subtree:add(buffer(4 , 2), string.format("clearMode            : 0x%0x [%s] ",buffer(4 , 2):string(), clearModeTemp))		-- Clear mode
			
			subtree:add(buffer(6 , 2), "reserved1            : "..buffer(6 , 2):string())												-- For future expansion
		end
		
	-- Res
	else
		-- Does not have response data
	end
end

-- RemoteStop(1002)
function Slmp1002(buffer, subcmd, subtree, isReq, isBin)
	-- Req
	if( isReq ) then
		-- Binary
		if( isBin ) then
			local modeTbl = {
				[1] = "Does not perform forced execution.",
				[3] = "Performs forced execution.",
			}
			
			local modeTemp = lookup(buffer(0,2):le_uint(),modeTbl,"For future expansion")
			subtree:add(buffer(0 , 2), string.format("mode                 : 0x%04x [%s] ",buffer(0 , 2):le_uint(), modeTemp))	-- Mode
			
		-- ASCII
		else
			local modeTbl = {
				["0001"] = "Does not perform forced execution.",
				["0003"] = "Performs forced execution.",
			}
			
			local modeTemp = lookup(buffer(0,4):string(),modeTbl,"For future expansion")
			subtree:add(buffer(0 , 4), string.format("mode                 : 0x%04x [%s] ",buffer(0 , 4):string(), modeTemp))	-- Mode
			
		end
		
	-- Res
	else
		-- Does not have response data
	end
end

-- RemotePause(1003)
function Slmp1003(buffer, subcmd, subtree, isReq, isBin)
	-- Req
	if( isReq ) then
		-- Binary
		if( isBin ) then
			local modeTbl = {
				[1] = "Does not perform forced execution.",
				[3] = "Performs forced execution.",
			}
			
			local modeTemp = lookup(buffer(0,2):le_uint(),modeTbl,"For future expansion")
			subtree:add(buffer(0 , 2), string.format("mode                 : 0x%04x [%s] ",buffer(0 , 2):le_uint(), modeTemp))	-- Mode
			
		-- ASCII
		else
			local modeTbl = {
				["0001"] = "Does not perform forced execution.",
				["0003"] = "Performs forced execution.",
			}
			
			local modeTemp = lookup(buffer(0,4):string(),modeTbl,"For future expansion")
			subtree:add(buffer(0 , 4), string.format("mode                 : 0x%04x [%s] ",buffer(0 , 4):string(), modeTemp))	-- Mode
			
		end
		
	-- Res
	else
		-- Does not have response data
	end
end

-- RemoteLatchClear(1005)
function Slmp1005(buffer, subcmd, subtree, isReq, isBin)
	-- Req
	if( isReq ) then
		-- Binary
		if( isBin ) then
			local modeTbl = {
				[1] = "Does not perform forced execution.",
				[3] = "Performs forced execution.",
			}
			
			local modeTemp = lookup(buffer(0,2):le_uint(),modeTbl,"For future expansion")
			subtree:add(buffer(0 , 2), string.format("mode                 : 0x%04x [%s] ",buffer(0 , 2):le_uint(), modeTemp))	-- Mode
			
		-- ASCII
		else
			local modeTbl = {
				["0001"] = "Does not perform forced execution.",
				["0003"] = "Performs forced execution.",
			}
			
			local modeTemp = lookup(buffer(0,4):string(),modeTbl,"For future expansion")
			subtree:add(buffer(0 , 4), string.format("mode                 : 0x%04x [%s] ",buffer(0 , 4):string(), modeTemp))	-- Mode
			
		end
		
	-- Res
	else
		-- Does not have response data
	end
end

-- RemoteReset(1006)
function Slmp1006(buffer, subcmd, subtree, isReq, isBin)
	-- Req
	if( isReq ) then
		-- Binary
		if( isBin ) then
			subtree:add(buffer(0 , 2), string.format("mode                 : 0x%04x ",buffer(0 , 2):le_uint()))	-- Mode
		-- ASCII
		else
			subtree:add(buffer(0 , 4), string.format("mode                 : 0x%04x ",buffer(0 , 4):string()))	-- Mode
		end
		
	-- Res
	else
		-- Does not have response data
	end
end

-- RemoteReadTypeName(0101)
function Slmp0101(buffer, subcmd, subtree, isReq, isBin)
	-- Req
	if( isReq ) then
		-- Does not have request data
	-- Res
	else
		-- Binary
		if( isBin ) then
			subtree:add(buffer(0 , 16), "procType                : "..buffer(0 , 16):string())								-- Processor module name
			subtree:add(buffer(16 , 2), string.format("procTypeCode            : 0x%04x",buffer(16 , 2):le_uint()))			-- Processor module name code
		-- ASCII
		else
			subtree:add(buffer(0 , 16), "procType                : ".. buffer(0 , 16):string())								-- Processor module name
			subtree:add(buffer(16 , 4), string.format("procTypeCode            : 0x%04x",buffer(16 , 4):string()))			-- Processor module name code
		end
		
	end
end

-- FileReadDirectoryFile(1810)
function Slmp1810(buffer, subcmd, subtree, isReq, isBin)
	
	-- Req
	if( isReq ) then
		-- ReadDirectoryAsciiSjis
		if( subcmd == "0000" ) then
			-- Binary
			if( isBin ) then
				subtree:add(buffer(0,4),  "reserved4        : "..buffer(0,4))								-- For future expansion
				subtree:add(buffer(4,2), string.format("driveNo          : %s (%d)" ,lookup(buffer(4,2):le_uint(), DriveBIN, "For future expansion"), buffer(4,2):le_uint()))		-- Drive number
				subtree:add(buffer(6,2),  "startFileNo      : "..buffer(6,2):le_uint())						-- Starting file number
				subtree:add(buffer(8,2),  "fileNum          : "..buffer(8,2):le_uint())						-- Number of files
				subtree:add(buffer(10,2), "directoryNameNum : "..buffer(10,2):le_uint())					-- Number of directory characters
			
			-- ASCII
			else
				subtree:add(buffer(0,4),  "reserved4        : "..buffer(0,4):string())						-- For future expansion
				subtree:add(buffer(4,4), string.format("driveNo          : %s (%d)" ,lookup(tonumber(buffer(4,4):string()), DriveBIN, "For future expansion"), buffer(4,4):string()))		-- Drive number
				subtree:add(buffer(8,4),  "startFileNo      : "..buffer(8,4):string())						-- Starting file number
				subtree:add(buffer(12,4), "fileNum          : "..buffer(12,4):string())						-- Number of files
				subtree:add(buffer(16,4), "directoryNameNum : "..buffer(16,4):string())						-- Number of directory characters
				
			end
		-- ReadDirectoryUnicode
		elseif( subcmd == "0040" ) then
			local filelen
			
			-- Binary
			if( isBin ) then
				filelen = buffer(12,2):le_uint()
				
				subtree:add(buffer(0,4),  "reserved4        : "..buffer(0,4))								-- For future expansion
				subtree:add(buffer(4,2), string.format("driveNo          : %s (%d)" ,lookup(buffer(4,2):le_uint(), DriveBIN, "For future expansion"), buffer(4,2):le_uint()))		-- Drive number
				subtree:add(buffer(6,4),  "startFileNo      : "..buffer(6,4):le_uint())						-- Starting file number
				subtree:add(buffer(10,2), "fileNum          : "..buffer(10,2):le_uint())					-- Number of files
				subtree:add(buffer(12,2), "directoryNameNum : "..buffer(12,2):le_uint())					-- Number of directory path name characters
				
				if( filelen > 0 ) then
					subtree:add(buffer(14 ,(filelen*2)), "Directory path name: "..buffer(14 ,(filelen*2)))	-- Directory path name
				end
			-- ASCII
			else
				filelen = tonumber(buffer(20,4):string())
				
				subtree:add(buffer(0,4),  "reserved4         : "..buffer(0,4):string())							-- For future expansion
				subtree:add(buffer(4,4), string.format("driveNo           : %s (%d)" ,lookup(tonumber(buffer(4,4):string()), DriveBIN, "For future expansion"), buffer(4,4):string()))		-- Drive number
				subtree:add(buffer(8,8),  "startFileNo       : "..buffer(8,8):string())							-- Starting file number
				subtree:add(buffer(16,4), "fileNum           : "..buffer(16,4):string())							-- Number of files
				subtree:add(buffer(20,4), "directoryNameNum  : "..buffer(20,4):string())				-- Number of directory path name characters
				
				if( filelen > 0 ) then
					subtree:add(buffer(24,(filelen * 4)), "directoryPathName : "..buffer(24,(filelen * 4)):string())		-- Directory path name
				end
			end
		end
	-- Res
	else
		local fileInfoNum
		local offset_
		
		-- ReadDirectoryAsciiSjis
		if( subcmd == "0000" ) then
			-- Binary
			if( isBin ) then
				fileInfoNum = buffer(0,2):le_uint()
				
				subtree:add(buffer(0,2), "fileInfoNum            : "..buffer(0,2))																-- Number of file information
				offset_= 2
				
				for n =1, fileInfoNum do
					sta_tree = subtree:add(buffer( offset_ + 0, 32), 	  "dirFileInfo ["..(n).."]" )
					
					sta_tree:add(buffer( offset_ +  0 ,  8),  "fileName             : "..buffer(offset_ +  0  , 8):string())					-- File name
					sta_tree:add(buffer( offset_ +  8 ,  3),  "Extension            : "..buffer(offset_ +  8  , 3):string())					-- Extension
					sta_tree:add(buffer( offset_ +  11,  2),  "atribute             : "..buffer(offset_ +  11 , 2):le_uint())					-- Attributions
					sta_tree:add(buffer( offset_ +  13,  7),  "reserved7            : "..buffer(offset_ +  13 , 7))								-- For future expansion
					sta_tree:add(buffer( offset_ +  20,  2),  "reserved2-1          : "..buffer(offset_ +  20 , 2))								-- For future expansion
					sta_subtree = sta_tree:add(buffer( offset_ +  22 , 2),  "lastEditTime         : "..buffer(offset_ +  22 , 2):le_uint())		-- Time last edited
					local buf_lastEditTime = buffer(offset_ +  22 , 2):le_uint()
					local lastEditTime_T = bit.rshift(bit.band(buf_lastEditTime,0xF800),11)
					local lastEditTime_M = bit.rshift(bit.band(buf_lastEditTime,0x07E0),5)
					local lastEditTime_HS = bit.band(buf_lastEditTime,0x001F)
					sta_subtree:add(buffer( offset_ +  22,  2),  "Hour of the current time   : " ..lastEditTime_T)
					sta_subtree:add(buffer( offset_ +  22,  2),  "Minute of the current time : " ..lastEditTime_M)
					sta_subtree:add(buffer( offset_ +  22,  2),  "Current second / 2         : " ..lastEditTime_HS)
					sta_subtree2 = sta_tree:add(buffer( offset_ +  24 , 2),  "lastEditDate         : "..buffer(offset_ +  24 , 2):le_uint())	-- Date last edited
					local buf_lastEditDate = buffer(offset_ +  24 , 2):le_uint()
					local lastEditDate_Y = bit.rshift(bit.band(buf_lastEditDate,0xFE00),9)
					local lastEditDate_M = bit.rshift(bit.band(buf_lastEditDate,0x01E0),5)
					local lastEditDate_D = bit.band(buf_lastEditDate,0x001F)
					sta_subtree2:add(buffer( offset_ +  24,  2),  string.format("current year          : %d(%d) ", (1980 + lastEditDate_Y) , lastEditDate_Y))
					sta_subtree2:add(buffer( offset_ +  24,  2),  "current month         : " ..lastEditDate_M)
					sta_subtree2:add(buffer( offset_ +  24,  2),  "current day           : " ..lastEditDate_D)
					sta_tree:add(buffer( offset_ +  26,  2),  "reserved2-2          : "..buffer(offset_ +  26 , 2))								-- For future expansion
					sta_tree:add(buffer( offset_ +  28,  4),  "fileSize             : "..buffer(offset_ +  28 , 4):le_uint())					-- File size
					
					offset_ = offset_ + 32
				end
				
			-- ASCII
			else
				fileInfoNum = buffer(0,4):le_uint()
				
				subtree:add(buffer(0,4), "fileInfoNum            : "..buffer(0,4):string())														-- Number of file information
				offset_= 4
				
				for n =1, fileInfoNum do
					sta_tree = subtree:add(buffer( offset_ + 0, 53), 	  "dirFileInfo ["..(n).."]" )
					
					sta_tree:add(buffer( offset_ +  0 ,  8),  "fileName             : "..buffer(offset_ +  0  ,  8):string())		-- File name
					sta_tree:add(buffer( offset_ +  8 ,  3),  "Extension            : "..buffer(offset_ +  8  ,  3):string())		-- Extension
					sta_tree:add(buffer( offset_ +  11,  4),  "atribute             : "..buffer(offset_ +  11 ,  4):string())		-- Attributions
					sta_tree:add(buffer( offset_ +  15,  14), "reserved7            : "..buffer(offset_ +  15 , 14):string())		-- For future expansion
					sta_tree:add(buffer( offset_ +  29,  4),  "reserved2-1          : "..buffer(offset_ +  29 ,  4):string())		-- For future expansion
					sta_tree:add(buffer( offset_ +  33 , 4),  "lastEditTime         : "..buffer(offset_ +  33 ,  4):string())		-- Time last edited
					sta_tree:add(buffer( offset_ +  37 , 4),  "lastEditDate         : "..buffer(offset_ +  37 ,  4):string())		-- Date last edited
					sta_tree:add(buffer( offset_ +  41,  4),  "reserved2-2          : "..buffer(offset_ +  41 ,  4):string())		-- For future expansion
					sta_tree:add(buffer( offset_ +  45,  8),  "fileSize             : "..buffer(offset_ +  45 ,  8):string())		-- File size
					
					offset_ = offset_ + 53
				end
				
				
			end
		-- ReadDirectoryUnicode
		elseif( subcmd == "0040" ) then
			local filelen
			
			-- Binary
			if( isBin ) then
				fileInfoNum = buffer(0,2):le_uint()
				
				subtree:add(buffer(0,2), "fileInfoNum            : "..buffer(0,2):le_uint())																		-- Number of file information
				subtree:add(buffer(2,4), "endFileNo              : "..buffer(2,4):le_uint())																		-- Last file number
				offset_ = 6
				
				for n =1, fileInfoNum do
					filelen = buffer( offset_ +  0 ,  2):le_uint()
					filelen = filelen * 2
					
					sta_tree = subtree:add(buffer( offset_ , (23 + filelen) ), 	  "File Info ["..(n).."]" )
					
					sta_tree:add(buffer( offset_ ,  2),  "fileNameNum              : "..buffer(offset_ ,  2):le_uint())													-- Number of file name characters
					if( filelen > 0 ) then
						sta_tree:add(buffer(offset_ +  2, filelen), "fileName                 : "..buffer(offset_ + 2,filelen):le_ustring())								-- File name
					end
					
					sta_tree:add(buffer( offset_ +  2 + filelen,  2),    "attributions             : "..buffer(offset_ + 2 + filelen ,  2):le_uint()) 					-- Attributions
					sta_tree:add(buffer( offset_ +  4 + filelen,  7),    "reserved7                : "..buffer(offset_ + 4 + filelen , 7))								-- For future expansion
					sta_tree:add(buffer( offset_ +  11 + filelen,  2),   "reserved2-1              : "..buffer(offset_ + 11 + filelen ,  2))							-- For future expansion
					sta_subtree =  sta_tree:add(buffer( offset_ +  13 + filelen, 2),    "lastEditTime             : "..buffer(offset_ + 13 + filelen , 2):le_uint())	-- Time last edited
					local buf_lastEditTime = buffer( offset_ +  13 + filelen , 2):le_uint()
					local lastEditTime_T = bit.rshift(bit.band(buf_lastEditTime,0xF800),11)
					local lastEditTime_M = bit.rshift(bit.band(buf_lastEditTime,0x07E0),5)
					local lastEditTime_HS = bit.band(buf_lastEditTime,0x001F)
					sta_subtree:add(buffer( offset_ +  13 + filelen,  2),  "Hour of the current time   : " ..lastEditTime_T)
					sta_subtree:add(buffer( offset_ +  13 + filelen,  2),  "Minute of the current time : " ..lastEditTime_M)
					sta_subtree:add(buffer( offset_ +  13 + filelen,  2),  "Current second / 2         : " ..lastEditTime_HS)
					sta_subtree2 = sta_tree:add(buffer( offset_ +  15 + filelen, 2),    "lastEditDate             : "..buffer(offset_ + 15 + filelen , 2):le_uint())	-- Date last edited
					local buf_lastEditDate = buffer(offset_ +  15 + filelen , 2):le_uint()
					local lastEditDate_Y = bit.rshift(bit.band(buf_lastEditDate,0xFE00),9)
					local lastEditDate_M = bit.rshift(bit.band(buf_lastEditDate,0x01E0),5)
					local lastEditDate_D = bit.band(buf_lastEditDate,0x001F)
					sta_subtree2:add(buffer( offset_ +  15 + filelen,  2),  string.format("current year             : %d (%d)", (1980 + lastEditDate_Y), lastEditDate_Y))
					sta_subtree2:add(buffer( offset_ +  15 + filelen,  2),  "current month            : " ..lastEditDate_M)
					sta_subtree2:add(buffer( offset_ +  15 + filelen,  2),  "current day              : " ..lastEditDate_D)
					sta_tree:add(buffer( offset_ +  17 + filelen ,  2),  "reserved2-2              : "..buffer(offset_ + 17 + filelen , 2))								-- For future expansion
					sta_tree:add(buffer( offset_ +  19 + filelen ,  4),  "fileSize                 : "..buffer(offset_ + 19 + filelen , 4):le_uint())					-- File size
					
					offset_ = offset_ + 23 + filelen
				end
			
			-- ASCII
			else
				fileInfoNum = buffer(0,4):le_uint()
				
				subtree:add(buffer(0,4), "fileInfoNum            : "..buffer(0,4):string())																-- Number of file information
				subtree:add(buffer(4,8), "endFileNo              : "..buffer(4,8):string())																-- Last file number
				offset_ = 12
				
				for n =1, fileInfoNum do
					filelen = buffer( offset_ +  0 ,  4):le_uint()
					
					sta_tree = subtree:add(buffer( offset_, (46 + filelen)), 	  "File Info ["..(n).."]" )
					
					sta_tree:add(buffer( offset_ ,  4),  "fileNameNum              : "..buffer(offset_ +  0 ,  8):string())								-- Number of file name characters
					if( filelen > 0 ) then
						sta_tree:add(buffer(offset_ +  4, filelen), "fileName                 : "..buffer(offset_ + 2,filelen):string())				-- File name
					end
					
					sta_tree:add(buffer( offset_ +  4 + filelen,  4),   "Attributions             : "..buffer(offset_ + 4 + filelen ,  4):string())		-- Attributions
					sta_tree:add(buffer( offset_ +  8 + filelen,  14),  "reserved7                : "..buffer(offset_ +  8 + filelen , 14):string())	-- For future expansion
					sta_tree:add(buffer( offset_ +  22 + filelen,  4),  "reserved2-1              : "..buffer(offset_ +  22 + filelen ,  4):string())	-- For future expansion
					sta_tree:add(buffer( offset_ +  26 + filelen , 4),  "lastEditTime             : "..buffer(offset_ +  26 + filelen , 4):string())	-- Time last edited
					sta_tree:add(buffer( offset_ +  30 + filelen , 4),  "lastEditDate             : "..buffer(offset_ +  30 + filelen , 4):string())	-- Date last edited
					sta_tree:add(buffer( offset_ +  34 + filelen,  4),  "reserved2-2              : "..buffer(offset_ +  34 + filelen , 4):string())	-- For future expansion
					sta_tree:add(buffer( offset_ +  38 + filelen,  8),  "fileSize                 : "..buffer(offset_ +  38 + filelen , 8):string())	-- File size
					
					offset_ = offset_ + 46 + filelen
				end
			end
		end
	end
end

-- FileSearchDirectoryFile(1811)
function Slmp1811(buffer, subcmd, subtree, isReq, isBin)
	
	local filelen
	
	-- Req
	if( isReq ) then
		-- Binary
		if( isBin ) then
			filelen = buffer(8,2):le_uint()
			
			subtree:add(buffer(0,4), "charFilePassword           : "..buffer(0,4):string())			-- File password characters
			subtree:add(buffer(4,2), string.format("driveNo                    : %s (%d)" ,lookup(buffer(4,2):le_uint(), DriveBIN, "For future expansion"), buffer(4,2):le_uint()))		-- Drive number
			subtree:add(buffer(6,2), "directoryNameNum           : "..buffer(6,2))					-- Number of directory characters
			subtree:add(buffer(8,2), "fileNameNum                : "..buffer(8,2):le_uint())		-- Number of file name characters
			
			if( filelen > 0 ) then
				if(subcmd == "0000") then
					subtree:add(buffer(10,filelen), "charFileName               : "..buffer(10,filelen):string())		-- File name
				else
					subtree:add(buffer(10,(filelen * 2)), "charFileName               : "..buffer(10,(filelen * 2)):le_ustring())		-- File name
				end
			end
		
		-- ASCII
		else
			filelen = tonumber(buffer(12,4):string())
			
			subtree:add(buffer(0,4), "charFilePassword           : "..buffer(0,4):string())				-- File password characters
			subtree:add(buffer(4,4), string.format("driveNo                    : %s (%d)" ,lookup(tonumber(buffer(4,4):string()), DriveBIN, "For future expansion"), buffer(4,4):string()))		-- Drive number
			subtree:add(buffer(8,4), "directoryNameNum           : "..buffer(8,4):string())				-- Number of directory characters
			subtree:add(buffer(12,4), "fileNameNum                : "..buffer(12,4):string())			-- Number of file name characters
			
			if( filelen > 0 ) then
				if(subcmd == "0000") then
					subtree:add(buffer(16,filelen), "charFileName               : "..buffer(16,filelen):string())		-- File name
				else
					subtree:add(buffer(16,(filelen * 4)), "charFileName               : "..buffer(16,(filelen * 4)))		-- File name
				end
			end
		end
		
	-- Res
	else
		-- Binary
		if( isBin ) then
			subtree:add(buffer(0,2), "fileNo                  : "..buffer(0,2))								-- File number
		-- ASCII
		else
			subtree:add(buffer(0,4), "fileNo                  : "..buffer(0,4))								-- File number
		end
	end
end

-- FileOpenFile(1827)
function Slmp1827(buffer, subcmd, subtree, isReq, isBin)
	
	local filelen
	
	-- Req
	if( isReq ) then
		local openMode_tbl = {
			["0000"] = "opened to read data",
			["0100"] = "opened to write data"
		}
		
		-- Binary
		if( isBin ) then
			if( subcmd == "0000" ) then
				filelen = buffer(8,2):le_uint()
				
				subtree:add(buffer(0,4), "charFilePassword    : "..buffer(0,4):string())					-- File password characters
				subtree:add(buffer(4,2), string.format("opneMode            : %s (0x%04X)" ,lookup(hexToStr(buffer(4,2), 4), openMode_tbl, "For future expansion"), buffer(4,2):le_uint()))	-- Open Mode
				subtree:add(buffer(6,2), string.format("driveNo             : %s (%d)" ,lookup(buffer(6,2):le_uint(), DriveBIN, "For future expansion"), buffer(6,2):le_uint()))		-- Drive number
				subtree:add(buffer(8,2), "fileNameNum         : "..filelen)										-- Number of file name characters
				subtree:add(buffer(10,filelen), "charFileName        : "..buffer(10,filelen):string())			-- File name
			end
		-- ASCII
		else
			if( subcmd == "0000" ) then
				filelen = tonumber(buffer(12,4):string())
				
				subtree:add(buffer(0,4), "charFilePassword    : "..buffer(0,4):string())					-- File password characters
				subtree:add(buffer(4,2), string.format("opneMode            : %s (0x%04d)" ,lookup(buffer(4,4):string(), openMode_tbl, "For future expansion"), buffer(4,4):string()))	-- Open Mode
				subtree:add(buffer(8,4), string.format("driveNo             : %s (%d)" ,lookup(tonumber(buffer(8,4):string()), DriveBIN, "For future expansion"), buffer(8,4):string()))		-- Drive number
				subtree:add(buffer(12,4), "fileNameNum         : "..buffer(12,4):string())						-- Number of file name characters
				subtree:add(buffer(16,filelen), "charFileName        : "..buffer(16,filelen):string())			-- File name
			end
		end
	
	-- Res
	else
		-- Binary
		if( isBin ) then
			subtree:add(buffer(0,2), "filePointerNo: "..buffer(0,2))								-- File number
		-- ASCII
		else
			subtree:add(buffer(0,4), "filePointerNo: "..buffer(0,4))								-- File number
		end
	end
end

-- FileReadFile(1828)
function Slmp1828(buffer, subcmd, subtree, isReq, isBin)
	
	-- Req
	if( isReq ) then
		-- Binary
		if( isBin ) then
			subtree:add(buffer(0,2), "filePointerNo       : "..buffer(0,2):le_uint())							-- File pointer number
			subtree:add(buffer(2,4), "offsetAddr          : "..string.format("0x%08X",buffer(2,4):le_uint()))	-- Offset address
			subtree:add(buffer(6,2), "byteNum             : "..buffer(6,2):le_uint())							-- Number of bytes to read
		
		-- ASCII
		else
			subtree:add(buffer(0,4),  "filePointerNo       : "..buffer(0,4):string())							-- File pointer number
			subtree:add(buffer(4,8),  "offsetAddr          : "..string.format("0x%s",buffer(4,8):string()))		-- Offset address
			subtree:add(buffer(12,4), "byteNum             : "..buffer(12,4):string())							-- Number of bytes to read
		end
	
	--Res
	else
		local readlen
		
		-- Binary
		if( isBin ) then
			readlen = buffer(0,2):le_uint()
			
			subtree:add(buffer(0,2), "byteNum      : "..buffer(0,2):le_uint())									-- Number of bytes to read
			subtree:add(buffer(2, readlen), string.format("data         : 0x%s", buffer(2,readlen)))			-- Data
		-- ASCII
		else
			readlen = buffer(0,4):le_uint()
			
			subtree:add(buffer(0,4), "byteNum      : "..buffer(0,4):string())									-- Number of bytes to read
			subtree:add(buffer(4, readlen), string.format("data         : 0x%s", buffer(4,readlen):string()))	-- Data
			
		end
	end
end

-- FileWriteFile(1829)
function Slmp1829(buffer, subcmd, subtree, isReq, isBin)
	
	-- Req
	if( isReq ) then
		-- Binary
		if( isBin ) then
			subtree:add(buffer(0,2), "filePointerNo       : "..buffer(0,2):le_uint())							-- File pointer number
			subtree:add(buffer(2,4), "offsetAddr          : "..string.format("0x%08X",buffer(2,4):uint()))		-- Offset address
			subtree:add(buffer(6,2), "byteNum             : "..buffer(6,2):le_uint())							-- Number of bytes to write
			subtree:add(buffer(8),   string.format("data                : 0x%s", buffer(8)))					-- Data
		
		-- ASCII
		else
			subtree:add(buffer(0,4),  "filePointerNo       : "..buffer(0,4):string())							-- File pointer number
			subtree:add(buffer(4,8),  "offsetAddr          : "..string.format("0x%s",buffer(4,8):string()))		-- Offset address
			subtree:add(buffer(12,4), "byteNum             : "..buffer(12,4):string())							-- Number of bytes to write
			subtree:add(buffer(16),   string.format("data                : 0x%s", buffer(16):string()))			-- Data
		end
	
	-- Res
	else
		-- Binary
		if( isBin ) then
			subtree:add(buffer(0,2), "byteNum              : "..buffer(0,2):le_uint())							-- Number of bytes to write
		-- ASCII
		else
			subtree:add(buffer(0,4), "byteNum              : "..buffer(0,4):string())							-- Number of bytes to write
		end
	end
end

-- FileCloseFile(182A)
function Slmp182A(buffer, subcmd, subtree, isReq, isBin)
	
	-- Req
	if( isReq ) then
		local closeType_tbl = {
			["0000"] = "Normal close.",
			["0001"] = "Forced close 1.",
			["0002"] = "Forced close 2."
		}
		-- Binary
		if( isBin ) then
			subtree:add(buffer(0,2), "filePointerNo          : "..buffer(0,2):le_uint())							-- File pointer number
			subtree:add(buffer(2,2), string.format("closeType              : %s (0x%04X)" ,lookup(hexToStr(buffer(2,2), 4), closeType_tbl, "For future expansion"), buffer(2,2):le_uint()))	-- Close type
			
		-- ASCII
		else
			subtree:add(buffer(0,4), "filePointerNo        : "..buffer(0,4):string())							-- File pointer number
			subtree:add(buffer(4,2), string.format("closeType            : %s (0x%04d)" ,lookup(buffer(4,4):string(), closeType_tbl, "For future expansion"), buffer(4,4):string()))	-- Open Mode
			
		end
	
	-- Res
	else
	end
end

-- ReadFileInfo(FileInfo)(0201)
function Slmp0201(buffer, subcmd, subtree, isReq, isBin)
	local FilePasswordtree
	
	-- Req
	if( isReq ) then
		-- Binary
		if( isBin ) then
			FilePasswordtree = subtree:add(buffer(0,4), "filePassword") 
			FilePasswordtree:add(buffer(0,3), "File password       :" ..buffer(0,3))				-- File password
			FilePasswordtree:add(buffer(3,1), "Setting flag :"..buffer(3,1))						-- Setting flag
			subtree:add(buffer(4,2), string.format("driveName            : %s (0x%04X)" ,lookup(hexToStr(buffer(4,2), 4), DriveName_tbl, "For future expansion"), buffer(4,2):le_uint()))	-- Drive name
			subtree:add(buffer(6,2), "startFileNo: "..buffer(6,2):le_uint())						-- Starting file number
			subtree:add(buffer(8,2), "reqFileNum: "..buffer(8,2):le_uint())							-- Number of files to request
			
		-- ASCII
		else
			FilePasswordtree = subtree:add(buffer(0,8), "filePassword") 
			FilePasswordtree:add(buffer(0,6), "File password :" ..buffer(0,6):string())				-- File password
			FilePasswordtree:add(buffer(6,2), "Setting flag         :"..buffer(6,2):string())				-- Setting flag
			subtree:add(buffer(8,4), string.format("driveName            : %s (0x%04d)" ,lookup(buffer(8,4):string(), DriveName_tbl, "For future expansion"), buffer(8,4):string()))	-- Drive name
			subtree:add(buffer(12,4), "startFileNo          : "..buffer(12,4):string())						-- Starting file number
			subtree:add(buffer(16,4), "reqFileNum           : "..buffer(16,4):string())						-- Number of files to request
			
		end
	
	-- Res
	else
		local fileInfoNum
		local offset_
		
		-- Binary
		if( isBin ) then
			fileInfoNum = buffer(2,2):le_uint()
			
			subtree:add(buffer(0,2), "fileNumAll: "..buffer(0,2):le_uint())													-- Total number of registered files
			subtree:add(buffer(2,2), "fileInfoNum: "..buffer(2,2):le_uint())												-- Number of file information
			offset_ = 4
			
			for n =1, fileInfoNum do
				sta_tree = subtree:add(buffer( offset_ + 0, 22), 	  "fileInfo ["..(n).."]" )
				sta_tree:add(buffer( offset_ +  0 ,  2),  "fileNo            : "..buffer(offset_ +  0 ,  2):le_uint())			-- File number
				sta_tree:add(buffer( offset_ +  2 ,  8),  "fileName          : "..buffer(offset_ +  2 ,  8):string())		-- File name
				sta_tree:add(buffer( offset_ +  10 ,  3), "fileExtension     : "..buffer(offset_ +  10 , 3):string())				-- Extension
				sta_tree:add(buffer( offset_ +  13,  1),  "fileAttribute     : "..buffer(offset_ +  13 ,  1))				-- Attributions
				sta_subtree = sta_tree:add(buffer( offset_ +  14 , 2),  "lastEditDate      : "..buffer(offset_ +  14 , 2):le_uint())		-- Time last edited
					local buf_lastEditTime = buffer(offset_ +  14 , 2):le_uint()
					local lastEditTime_T = bit.rshift(bit.band(buf_lastEditTime,0xF800),11)
					local lastEditTime_M = bit.rshift(bit.band(buf_lastEditTime,0x07E0),5)
					local lastEditTime_HS = bit.band(buf_lastEditTime,0x001F)
					sta_subtree:add(buffer( offset_ +  14,  2),  "Hour of the current time   : " ..lastEditTime_T)
					sta_subtree:add(buffer( offset_ +  14,  2),  "Minute of the current time : " ..lastEditTime_M)
					sta_subtree:add(buffer( offset_ +  14,  2),  "Current second / 2         : " ..lastEditTime_HS)
				sta_subtree2 = sta_tree:add(buffer( offset_ +  16 , 2),  "lastEditDate      : "..buffer(offset_ +  16 , 2):le_uint())	-- Date last edited
					local buf_lastEditDate = buffer(offset_ +  16 , 2):le_uint()
					local lastEditDate_Y = bit.rshift(bit.band(buf_lastEditDate,0xFE00),9)
					local lastEditDate_M = bit.rshift(bit.band(buf_lastEditDate,0x01E0),5)
					local lastEditDate_D = bit.band(buf_lastEditDate,0x001F)
					sta_subtree2:add(buffer( offset_ +  16,  2),  string.format("current year          : %d(%d) ", (1980 + lastEditDate_Y) , lastEditDate_Y))
					sta_subtree2:add(buffer( offset_ +  16,  2),  "current month         : " ..lastEditDate_M)
					sta_subtree2:add(buffer( offset_ +  16,  2),  "current day           : " ..lastEditDate_D)
				sta_tree:add(buffer( offset_ +  18,  4), string.format("fileSize          : 0x%08x", buffer(offset_ +  18 , 4):le_uint()))			-- File size
				
				offset_ = offset_ + 22
			end
		-- ASCII
		else
			fileInfoNum = buffer(2,4):le_uint()
			
			subtree:add(buffer(0,4), "fileNumAll: "..buffer(0,4):le_uint())													-- Total number of registered files
			subtree:add(buffer(4,4), "fileInfoNum: "..buffer(4,4):le_uint())												-- Number of file information
			offset_ = 8
			
			for n =1, fileInfoNum do
				sta_tree = subtree:add(buffer( offset_ + 0, 32), 	  "fileInfo ["..(n).."]" )
				sta_tree:add(buffer( offset_ +  0 ,  4),  "fileNo            : "..buffer(offset_ +  0 ,  4):string())		-- File number
				sta_tree:add(buffer( offset_ +  4 ,  8),  "fileName          : "..buffer(offset_ +  4 ,  8):string())		-- File name
				sta_tree:add(buffer( offset_ +  12 ,  3), "fileExtension     : "..buffer(offset_ +  12 , 3):string())		-- Extension
				sta_tree:add(buffer( offset_ +  15,  1),  "fileAttribute     : "..buffer(offset_ +  15 ,  1):string())		-- Attributions
				sta_tree:add(buffer( offset_ +  16 , 4),  "lastEditTime      : "..buffer(offset_ +  16 , 4):string())		-- Time last edited
				sta_tree:add(buffer( offset_ +  20 , 4),  "lastEditDate      : "..buffer(offset_ +  20, 4):string())		-- Date last edited
				sta_tree:add(buffer( offset_ +  24,  8),  "fileSize          : "..buffer(offset_ +  24 , 8):string())		-- File size
				
				offset_ = offset_ + 32
			end
		end
	end
end

-- ReadFileInfo(FileInfoDetail)(0202)
function Slmp0202(buffer, subcmd, subtree, isReq, isBin)
	local FilePasswordtree

	-- Req
	if( isReq ) then
		-- Binary
		if( isBin ) then
			FilePasswordtree = subtree:add(buffer(0,4), "filePassword") 
			FilePasswordtree:add(buffer(0,3), "File password        : " ..buffer(0,3))						-- File password
			FilePasswordtree:add(buffer(3,1), "Setting flag :"..buffer(3,1))						-- Setting flag
			subtree:add(buffer(4,2), string.format("driveName            : %s (0x%04X)" ,lookup(hexToStr(buffer(4,2), 4), DriveName_tbl, "For future expansion"), buffer(4,2):le_uint()))	-- Drive name
			subtree:add(buffer(6,2), "startFileNo: "..buffer(6,2):le_uint())						-- Starting file number
			subtree:add(buffer(8,2), "reqFileNum: "..buffer(6,2):le_uint())							-- Number of files to request
			
		-- ASCII
		else
			FilePasswordtree = subtree:add(buffer(0,8), "filePassword") 
			FilePasswordtree:add(buffer(0,6), "File password :" ..buffer(0,6):string())				-- File password
			FilePasswordtree:add(buffer(6,2), "Setting flag         :"..buffer(6,2):string())				-- Setting flag
			subtree:add(buffer(8,4), string.format("driveName            : %s (0x%04d)" ,lookup(buffer(8,4):string(), DriveName_tbl, "For future expansion"), buffer(8,4):string()))	-- Drive name
			subtree:add(buffer(12,4), "startFileNo          : "..buffer(12,4):string())						-- Starting file number
			subtree:add(buffer(16,4), "reqFileNum           : "..buffer(16,4):string())						-- Number of files to request
			
		end
	
	-- Res
	else
		local fileInfoNum
		local offset_
		
		-- Binary
		if( isBin ) then
			fileInfoNum = buffer(2,2):le_uint()
			
			subtree:add(buffer(0,2), "fileNumAll          : "..buffer(0,2):le_uint())														-- Total number of registered files
			subtree:add(buffer(2,2), "fileInfoNum         : "..buffer(2,2):le_uint())														-- Number of file information
			offset_ = 4
			
			for n =1, fileInfoNum do
				sta_tree = subtree:add(buffer( offset_ + 0, 54), 	  "fileInfo ["..(n).."]" )
				sta_tree:add(buffer( offset_ +  0 ,  2),  "fileNo              : "..buffer(offset_ +  0 ,  2):le_uint())					-- File number
				sta_tree:add(buffer( offset_ +  2 ,  8),  "fileName             : "..buffer(offset_ +  2 ,  8):string())				-- File name
				sta_tree:add(buffer( offset_ +  10 ,  3), "fileExtension       : "..buffer(offset_ +  10 , 3):string())						-- Extension
				sta_tree:add(buffer( offset_ +  13,  1),  "fileAttribute          : "..buffer(offset_ +  13 ,  1))						-- Attributions
				sta_subtree = sta_tree:add(buffer( offset_ +  14 , 2),  "lastEditTime         : "..buffer(offset_ +  14 , 2):le_uint())		-- Time last edited
					local buf_lastEditTime = buffer(offset_ +  14 , 2):le_uint()
					local lastEditTime_T = bit.rshift(bit.band(buf_lastEditTime,0xF800),11)
					local lastEditTime_M = bit.rshift(bit.band(buf_lastEditTime,0x07E0),5)
					local lastEditTime_HS = bit.band(buf_lastEditTime,0x001F)
					sta_subtree:add(buffer( offset_ +  14,  2),  "Hour of the current time   : " ..lastEditTime_T)
					sta_subtree:add(buffer( offset_ +  14,  2),  "Minute of the current time : " ..lastEditTime_M)
					sta_subtree:add(buffer( offset_ +  14,  2),  "Current second / 2         : " ..lastEditTime_HS)
				sta_subtree2 = sta_tree:add(buffer( offset_ +  16 , 2),  "lastEditDate         : "..buffer(offset_ +  16 , 2):le_uint())		-- Date last edited
					local buf_lastEditDate = buffer(offset_ +  16 , 2):le_uint()
					local lastEditDate_Y = bit.rshift(bit.band(buf_lastEditDate,0xFE00),9)
					local lastEditDate_M = bit.rshift(bit.band(buf_lastEditDate,0x01E0),5)
					local lastEditDate_D = bit.band(buf_lastEditDate,0x001F)
					sta_subtree2:add(buffer( offset_ +  16,  2),  string.format("current year          : %d(%d) ", (1980 + lastEditDate_Y) , lastEditDate_Y))
					sta_subtree2:add(buffer( offset_ +  16,  2),  "current month         : " ..lastEditDate_M)
					sta_subtree2:add(buffer( offset_ +  16,  2),  "current day           : " ..lastEditDate_D)
				sta_tree:add(buffer( offset_ +  18,  4),  string.format("fileSize            : 0x%08x", buffer(offset_ +  18 , 4):le_uint()))	-- File size
				sta_tree:add(buffer( offset_ +  22,  32),  "preface             : "..buffer(offset_ +  22 , 32):string())				-- Header text
				
				offset_ = offset_ + 54
			end
		-- ASCII
		else
			fileInfoNum = buffer(2,4):le_uint()
			
			subtree:add(buffer(0,4), "fileNumAll          : "..buffer(0,4):le_uint())										-- Total number of registered files
			subtree:add(buffer(4,4), "fileInfoNum         : "..buffer(4,4):le_uint())												-- Number of file information
			offset_ = 8
			
			for n =1, fileInfoNum do
				sta_tree = subtree:add(buffer( offset_ + 0, 64), 	  "File Info ["..(n).."]" )
				sta_tree:add(buffer( offset_ +  0 ,  4),  "fileNo               : "..buffer(offset_ +  0 ,  4):string())				-- File number
				sta_tree:add(buffer( offset_ +  4 ,  8),  "fileName             : "..buffer(offset_ +  4 ,  8):string())				-- File name
				sta_tree:add(buffer( offset_ +  12 ,  3), "fileExtension        : "..buffer(offset_ +  12 , 3):string())				-- Extension
				sta_tree:add(buffer( offset_ +  15,  1),  "fileAttribute        : "..buffer(offset_ +  15 ,  1):string())				-- Attributions
				sta_tree:add(buffer( offset_ +  16 , 4),  "lastEditTime         : "..buffer(offset_ +  16 , 4):string())				-- Time last edited
				sta_tree:add(buffer( offset_ +  20 , 4),  "lastEditTime         : "..buffer(offset_ +  20, 4):string())					-- Date last edited
				sta_tree:add(buffer( offset_ +  24,  8),  "fileSize             : "..buffer(offset_ +  24 , 8):string())				-- File size
				sta_tree:add(buffer( offset_ +  32,  32), "preface              : "..buffer(offset_ +  32 , 32):string())				-- Header text
				
				offset_ = offset_ + 64
			end
		end
	end
end

-- FileSearch(0203)
function Slmp0203(buffer, subcmd, subtree, isReq, isBin)
	local FilePasswordtree
	local FileNametree
	
	-- Req
	if( isReq ) then
		-- Binary
		if( isBin ) then
			FilePasswordtree = subtree:add(buffer(0 , 4), "filePassword") 
			FilePasswordtree:add(buffer(0 , 3), "File password        :" ..buffer(0 , 3))			-- File password
			FilePasswordtree:add(buffer(3 , 1), "Setting flag :"..buffer(3 , 1))						-- Setting flag
			subtree:add(buffer(4,2), string.format("driveName            : %s (0x%04X)" ,lookup(hexToStr(buffer(4,2), 4), DriveName_tbl, "For future expansion"), buffer(4,2):le_uint()))	-- Drive name
			FileNametree = subtree:add(buffer(6 , 12), "fileNameAll") 
			FileNametree:add(buffer(6 ,  8),  "fileName               : "..buffer(6 , 8):string())		-- File name
			FileNametree:add(buffer(14 , 3), "fileExtension        : "..buffer(14 , 3):string())	-- Extension
			FileNametree:add(buffer(17 , 1),  "fileAttribute          : "..buffer(17 , 1))				-- Attributions
			
		-- ASCII
		else
			FilePasswordtree = subtree:add(buffer(0 , 8), "filePassword") 
			FilePasswordtree:add(buffer(0 , 6), "File password :" ..buffer(0 , 6):string())				-- File password
			FilePasswordtree:add(buffer(6 , 2), "Setting flag :"..buffer(6 , 2):string())				-- Setting flag
			subtree:add(buffer(8,4), string.format("driveName            : %s (0x%04d)" ,lookup(buffer(8,4):string(), DriveName_tbl, "For future expansion"), buffer(8,4):string()))	-- Drive name
			FileNametree = subtree:add(buffer(12 , 12), "fileNameAll") 
			FileNametree:add(buffer(12 , 8),  "fileName               : "..buffer(12 , 8):string())		-- File name
			FileNametree:add(buffer(20 , 3),  "fileExtension          : "..buffer(20 , 3):string())		-- Extension
			FileNametree:add(buffer(23 , 1),  "fileAttribute          : "..buffer(23 , 1):string())		-- Attributions
			
		end
	
	-- Res
	else
		-- Binary
		if( isBin ) then
			subtree:add(buffer(0,2), "fileNo: "..buffer(0,2):le_uint())									-- File number
			subtree:add(buffer(2,4), "fileSize: "..buffer(2,4):le_uint())								-- File size
		-- ASCII
		else
			subtree:add(buffer(0,4), "fileNo: "..buffer(0,4):string())									-- File number
			subtree:add(buffer(4,4), "fileSize: "..buffer(4,4):string())								-- File size
			
		end
	end
end

-- FileRead(0206)
function Slmp0206(buffer, subcmd, subtree, isReq, isBin)
	local FilePasswordtree
	local FileNametree
	
	-- Req
	if( isReq ) then
		-- Binary
		if( isBin ) then
			FilePasswordtree = subtree:add(buffer(0 , 4), "filePassword") 
			FilePasswordtree:add(buffer(0 , 3), "File password :" ..buffer(0 , 3))									-- File password
			FilePasswordtree:add(buffer(3 , 1), "Setting flag :"..buffer(3 , 1))						-- Setting flag
			subtree:add(buffer(4,2), string.format("driveName            : %s (0x%04X)" ,lookup(hexToStr(buffer(4,2), 4), DriveName_tbl, "For future expansion"), buffer(4,2):le_uint()))	-- Drive name
			subtree:add(buffer(6,2), "fileNo: "..buffer(6 , 2))											-- File number
			FileNametree = subtree:add(buffer(8 , 12), "fileNameAll") 
			FileNametree:add(buffer(8 ,  8),  "fileName             : "..buffer(8 , 8):string())		-- File name
			FileNametree:add(buffer(16 , 3), "fileExtension        : "..buffer(16 , 3):string())					-- Extension
			FileNametree:add(buffer(19 , 1),  "fileAttribute          : "..buffer(19 , 1))				-- Attributions
			subtree:add(buffer(20,4), "offsetAddr: "..string.format("%08X",buffer(20,4):le_uint()))		-- Offset address
			subtree:add(buffer(24,2), "byteNum: "..buffer(24 , 2):le_uint())							-- Number of bytes to read
			
		-- ASCII
		else
			FilePasswordtree = subtree:add(buffer(0 , 8), "filePassword") 
			FilePasswordtree:add(buffer(0 , 6), "File password :" ..buffer(0 , 6):string())				-- File password
			FilePasswordtree:add(buffer(6 , 2), "Setting flag           : "..buffer(6 , 2):string())					-- Setting flag
			subtree:add(buffer(8,4), string.format("driveName            : %s (0x%04d)" ,lookup(buffer(8,4):string(), DriveName_tbl, "For future expansion"), buffer(8,4):string()))	-- Drive name
			subtree:add(buffer(12,4), "fileNo                 : "..buffer(12 , 4):string())									-- File number
			FileNametree = subtree:add(buffer(16 , 12), "fileNameAll") 
			FileNametree:add(buffer(16 , 8), "fileName               : "..buffer(16 , 8):string())						-- File name
			FileNametree:add(buffer(24 , 3), "fileExtension          : "..buffer(24 , 3):string())						-- Extension
			FileNametree:add(buffer(27 , 1), "fileAttribute          : "..buffer(27 ,  1):string())						-- Attributions
			subtree:add(buffer(28,8), "offsetAddr             : "..buffer(28 , 8):string())								-- Offset address
			subtree:add(buffer(36,4), "byteNum                : "..buffer(36 , 4):string())								-- Number of bytes to read
			
		end
	
	-- Res
	else
		subtree:add(buffer(), "data : "..buffer()) -- Data
	end
end

-- FileWrite(1203)
function Slmp1203(buffer, subcmd, subtree, isReq, isBin)
	local FilePasswordtree
	local FileNametree
	
	-- Req
	if( isReq ) then
		-- Binary
		if( isBin ) then
			FilePasswordtree = subtree:add(buffer(0 , 4), "filePassword") 
			FilePasswordtree:add(buffer(0 , 3), "File password        : " ..buffer(0 , 3))							-- File password
			FilePasswordtree:add(buffer(3 , 1), "Setting flag :"..buffer(3 , 1))						-- Setting flag
			
			subtree:add(buffer(4,2), string.format("driveName            : %s (0x%04X)" ,lookup(hexToStr(buffer(4,2), 4), DriveName_tbl, "For future expansion"), buffer(4,2):le_uint()))	-- Drive name
			subtree:add(buffer(6,2), "fileNo: "..buffer(6 , 2):le_uint())											-- File number
			
			FileNametree = subtree:add(buffer(8 , 12), "fileNameAll") 
			FileNametree:add(buffer(8 ,  8),  "fileName             : "..buffer(8 , 8):string())		-- File name
			FileNametree:add(buffer(16 , 3),  "fileExtension        : "..buffer(16 , 3):string())					-- Extension
			FileNametree:add(buffer(19 , 1),  "fileAttribute        : "..buffer(19 , 1))				-- Attributions
			
			subtree:add(buffer(20,4), "offsetAddr: "..string.format("%08X",buffer(20,4):le_uint()))		-- Offset address
			subtree:add(buffer(24,2), "byteNum              : "..buffer(24 , 2):le_uint())							-- Number of bytes to write
			subtree:add(buffer(26), "data: "..buffer(26))												-- Data
			
		-- ASCII
		else
			FilePasswordtree = subtree:add(buffer(0 , 8), "filePassword") 
			FilePasswordtree:add(buffer(0 , 6), "File password :" ..buffer(0 , 6):string())				-- File password
			FilePasswordtree:add(buffer(6 , 2), "Setting flag         : "..buffer(6 , 2):string())					-- Setting flag
			
			subtree:add(buffer(8,4), string.format(   "driveName            : %s (0x%04d)" ,lookup(buffer(8,4):string(), DriveName_tbl, "For future expansion"), buffer(8,4):string()))	-- Drive name
			subtree:add(buffer(12,4), "fileNo              : "..buffer(12 , 4):string())										-- File number
			
			FileNametree = subtree:add(buffer(16 , 12), "File name") 
			FileNametree:add(buffer(16 , 8), "fileName             : "..buffer(16 , 8):string())		-- File name
			FileNametree:add(buffer(24 , 3), "fileExtension        : "..buffer(24 , 3):string())		-- Extension
			FileNametree:add(buffer(27 , 1), "fileAttribute        : "..buffer(27 ,  1):string())		-- Attributions
			
			subtree:add(buffer(28,8), "offsetAddr           : "..buffer(28 , 8):string())				-- Offset address
			subtree:add(buffer(36,4), "byteNum              : "..buffer(36 , 4):string())				-- Number of bytes to write
			subtree:add(buffer(40),   "data                 : "..buffer(40))							-- Data
			
		end
	
	-- Res
	else
		subtree:add(buffer(), "data                 : "..buffer()) -- Data
	end
end

-- Accessing CAN application objects(4020)
function Slmp4020(buffer, subcmd, subtree, isReq, isBin)
	if	subcmd == "0001" then
		Slmp4020_0001_0003_0005(buffer, subcmd, subtree, isReq, isBin)
	elseif	subcmd == "0002" then
		Slmp4020_0002_0004_0006(buffer, subcmd, subtree, isReq, isBin)
	elseif	subcmd == "0003" then
		Slmp4020_0001_0003_0005(buffer, subcmd, subtree, isReq, isBin)
	elseif	subcmd == "0004" then
		Slmp4020_0002_0004_0006(buffer, subcmd, subtree, isReq, isBin)
	elseif	subcmd == "0005" then
		Slmp4020_0001_0003_0005(buffer, subcmd, subtree, isReq, isBin)
	elseif	subcmd == "0006" then
		Slmp4020_0002_0004_0006(buffer, subcmd, subtree, isReq, isBin)
	elseif	subcmd == "0007" then
		Slmp4020_0007(buffer, subcmd, subtree, isReq, isBin)
	elseif	subcmd == "0008" then
		Slmp4020_0008(buffer, subcmd, subtree, isReq, isBin)
	elseif	subcmd == "0009" then
		Slmp4020_0009(buffer, subcmd, subtree, isReq, isBin)
	elseif	subcmd == "000A" then
		Slmp4020_000A(buffer, subcmd, subtree, isReq, isBin)
	elseif	subcmd == "000B" then
		Slmp4020_000B(buffer, subcmd, subtree, isReq, isBin)
	end
end

-- ReadObject(4020_0001)
-- ObjectIDReadBlock(4020_0003)
-- ObjectSubIDReadBlock(4020_0005)
function Slmp4020_0001_0003_0005(buffer, subcmd, subtree, isReq, isBin)
	-- Common to Req and Res
	local index               = buffer(  0, 2)  -- Index
	local subIndex            = buffer(  2, 1)  -- SubIndex
	local reserved_1          = buffer(  3, 1)  -- For future expansion (fixed to 0)
	local dataValueNum        = buffer(  4, 2)  -- Data reading size

	subtree:add(index            ,string.format("index                  : 0x%04x", index:le_uint() ))
	subtree:add(subIndex         ,string.format("subIndex               : 0x%02x", subIndex:le_uint() ))
	subtree:add(reserved_1       ,string.format("reserved1              : ".. reserved_1 ))
	subtree:add(dataValueNum     ,string.format("dataValueNum           : %u", dataValueNum:le_uint() ))

	if( isReq ) then
	-- Req
	else
	-- Res
		subtree:add(buffer(6), "Data                   : "..buffer(6))	-- Data
	end
end

-- WriteObject(4020_0002)
-- ObjectIDWriteBlock(4020_0004)
-- ObjectSubIDWriteBlock(4020_0006)
function Slmp4020_0002_0004_0006(buffer, subcmd, subtree, isReq, isBin)
	-- Common to Req and Res
	local index               = buffer(  0, 2)  -- Index
	local subIndex            = buffer(  2, 1)  -- SubIndex
	local reserved_1          = buffer(  3, 1)  -- For future expansion (fixed to 0)
	local dataValueNum        = buffer(  4, 2)  -- Data size (1 or more)

	subtree:add(index            ,string.format("index                   : 0x%04x", index:le_uint() ))
	subtree:add(subIndex         ,string.format("subIndex                : 0x%02x", subIndex:le_uint() ))
	subtree:add(reserved_1       ,string.format("reserved                : ".. reserved_1 ))
	subtree:add(dataValueNum     ,string.format("dataValueNum            : %u", dataValueNum:le_uint() ))

	if( isReq ) then
	-- Req
		subtree:add(buffer(6), "data                    : "..buffer(6))	-- Data
	else
	-- Res
	end
end

-- NmtStateUpload(4020_0007)
function Slmp4020_0007(buffer, subcmd, subtree, isReq, isBin)
	if( isReq ) then
	-- Req
	else
	-- Res
		local stateTbl = {
			[1] = "Init",
			[2] = "Pre-Operational",
			[4] = "Safe-Operational",
			[8] = "Operational",
		}
		local currentState        = buffer(  0, 2)  -- Current NMT state
		local requestState        = buffer(  2, 2)  -- Latest NMT state received from the master station

		subtree:add(currentState     ,"currentState                : " .. lookup(currentState:le_uint(), stateTbl, "For future expansion") )
		subtree:add(requestState     ,"requestState                : " .. lookup(requestState:le_uint(), stateTbl, "For future expansion") )
	end
end

-- NmtStateDownload(4020_0008)
function Slmp4020_0008(buffer, subcmd, subtree, isReq, isBin)
	if( isReq ) then
	-- Req
		local stateTbl = {
			[1] = "Init",
			[2] = "Pre-Operational",
			[4] = "Safe-Operational",
			[8] = "Operational",
		}
		local requestState        = buffer(  0, 2)  -- Transition destination NMT state

		subtree:add(requestState     ,"requestState           : " .. lookup(requestState:le_uint(), stateTbl, "For future expansion") )
	else
	-- Res
	end
end

-- GetOdList(4020_0009)
function Slmp4020_0009(buffer, subcmd, subtree, isReq, isBin)
	-- Common to Req and Res
	local listTypeTbl = {
		[0] = "Number of reply objects for each list type",
		[1] = "Index of supporting object",
		[2] = "Index of object that can be mapped to RPDO",
		[3] = "Index of object that can be mapped to TPDO",
	}
	local listType            = buffer(  0, 2)  -- Specifies format to read
	local offset              = buffer(  2, 2)  -- Reading start position of list
	local objectNum           = buffer(  4, 2)  -- Number of objects

	subtree:add(listType         , "listType               : " .. lookup(listType:le_uint(), listTypeTbl, "For future expansion") )
	subtree:add(offset           ,string.format("offset                 : %u", offset:le_uint() ))
	subtree:add(objectNum        ,string.format("objectNum              : %u", objectNum:le_uint() ))

	if( isReq ) then
	-- Req
	else
	-- Res
		subtree:add(buffer(6), "indexList              : "..buffer(6))	-- Index list
	end
end

-- GetObjectDescription(4020_000A)
function Slmp4020_000A(buffer, subcmd, subtree, isReq, isBin)
	-- Common to Req and Res
	local index               = buffer(  0, 2)  -- Object Index

		subtree:add(index            ,string.format("index                  : 0x%04x", index:le_uint() ))

	if( isReq ) then
	-- Req
	else
	-- Res
		local objectCodeTbl = {
			[7] = "VAR",
			[8] = "ARRAY",
			[9] = "RECORD",
		}
		local reserved            = buffer(  2, 2)  -- For future expansion (fixed to 0)
		local maxSubIndex         = buffer(  4, 1)  -- Number of entries that object supports
		local objectCode          = buffer(  5, 1)  -- Object code

		subtree:add(reserved         ,string.format("reserved               : ".. reserved ))
		subtree:add(maxSubIndex      ,string.format("maxSubIndex            : 0x%02x", maxSubIndex:le_uint() ))
		subtree:add(objectCode       , "objectCode             : " .. lookup(objectCode:le_uint(), objectCodeTbl, "For future expansion") )

		subtree:add(buffer(6), "objectName             : "..buffer(6))	-- Object name
	end
end

-- GetEntryDescription(4020_000B)
function Slmp4020_000B(buffer, subcmd, subtree, isReq, isBin)
	-- Common to Req and Res
	local index               = buffer(  0, 2)  -- Entry Index
	local subIndex            = buffer(  2, 1)  -- Entory Sub Index
	local entryValueInfo      = buffer(  3, 1)  -- Specifies description of value to read

		subtree:add(index            ,string.format("index                  : 0x%04x", index:le_uint() ))
		subtree:add(subIndex         ,string.format("subIndex               : 0x%02x", subIndex:le_uint() ))
		subtree:add(entryValueInfo   ,string.format("entryValueInfo"))
		subtree:add(entryValueInfo   ,string.format("               .%d.. ....  Specifies whether or not to read the maximum value"            ,bit32.extract(entryValueInfo:le_uint(),6,1)))
		subtree:add(entryValueInfo   ,string.format("               ..%d. ....  Specifies whether or not to read the minimum value"            ,bit32.extract(entryValueInfo:le_uint(),5,1)))
		subtree:add(entryValueInfo   ,string.format("               ...%d ....  Specifies whether or not to read the default value"        ,bit32.extract(entryValueInfo:le_uint(),4,1)))
		subtree:add(entryValueInfo   ,string.format("               .... %d...  Specifies whether or not to read the unit"      ,bit32.extract(entryValueInfo:le_uint(),3,1)))

	if( isReq ) then
	-- Req
	else
	-- Res
		local entryDataTypeTbl = {
			[2] = "INTEGER8",
			[3] = "INTEGER16",
			[4] = "INTEGER32",
			[5] = "UNSIGNED8",
			[6] = "UNSIGNED16",
			[7] = "UNSIGNED32",
			[9] = "VISIBLE_STRING",
		}
		local entryDataType       = buffer(  4, 2)  -- Entry data type
		local entryBitLength      = buffer(  6, 2)  -- Entry bit length
		local entryObjectAccess   = buffer(  8, 2)  -- Entry access type

		subtree:add(entryDataType    ,"entryDataType          : " .. lookup(entryDataType:le_uint(), entryDataTypeTbl, "For future expansion") )
		subtree:add(entryBitLength   ,string.format("entryBitLength         : %u", entryBitLength:le_uint() ))
		subtree:add(entryObjectAccess,string.format("entryObjectAccess"))
		subtree:add(entryObjectAccess,string.format("     .... .... %d... ....  TPDO mapping possible" ,bit32.extract(entryObjectAccess:le_uint(),7,1)))
		subtree:add(entryObjectAccess,string.format("     .... .... .%d.. ....  RPDO mapping possible" ,bit32.extract(entryObjectAccess:le_uint(),6,1)))

		subtree:add(buffer(10), "entryData              : "..buffer(10))	-- Data
	end
end

-- NodeSearch(0E30)
function Slmp0E30(buffer, subcmd, subtree, isReq, isBin)
	if	subcmd == "0000" then
		Slmp0E30_0000(buffer, subcmd, subtree, isReq, isBin)
	elseif	subcmd == "0001" then
		Slmp0E30_0001(buffer, subcmd, subtree, isReq, isBin)
	end
end


function Slmp0E30_0000(buffer, subcmd, subtree, isReq, isBin)
	local addrsize		-- Client IP address size
	local ipAddrSizeTbl = {
		[4] = "IPv4(0x04)",
		[16] = "IPv6(0x10)",
	}
	
	-- Req
	if( isReq ) then
		if( isBin ) then
			-- Binary
			addrsize = buffer(6,1):uint()

			subtree:add(buffer(0,6), 		"clientMacAddr   : "..buf2macaddr(buffer(0,6)))											-- Client MAC address
			subtree:add(buffer(6,1), 		"clientIPAddrSize: "..lookup(addrsize, ipAddrSizeTbl, "For future expansion"))			-- Client IP address size
			subtree:add(buffer(7,addrsize), "clientIPAddr    : "..buf2ipaddr_v4v6(buffer(7,addrsize),addrsize,isBin))				-- Client IP address
		else
			-- ASCII
			addrsize = tonumber(buffer(12,2):string(),16)
			
			subtree:add(buffer(0,12),			"clientMacAddr   : "..buf2macaddr_asc(buffer(0,12)))								-- Client MAC address
			subtree:add(buffer(12,2), 			"clientIPAddrSize: "..lookup(addrsize, ipAddrSizeTbl, "For future expansion"))		-- Client IP address size
			subtree:add(buffer(14,addrsize*2),	"clientIPAddr    : "..buf2ipaddr_v4v6(buffer(14,addrsize*2),addrsize,isBin))		-- Client IP address
		end

	-- Res
	else
		local clientlen
		local serverlen
		local hostlen
		local targetlen
		local offset = 0
		local status
		local serverStatusTbl = {
			[0x0000] = "Normal status(0x0000)",
		}
		local protocol
		local serverProtocolTbl = {
			[0x00] = "TCP(0x00)",
			[0x01] = "UDP(0x01)"
		}
		if( isBin ) then
			-- Binary
			clientlen = buffer(6,1):uint()
			subtree:add(buffer(0,6), 							"clientMacAddr        : "..buf2macaddr(buffer(0,6)))												-- Client MAC address
			subtree:add(buffer(6,1), 							"clientIPAddrSize     : "..lookup(clientlen, ipAddrSizeTbl, "For future expansion"))				-- Client IP address size
			subtree:add(buffer(7,clientlen), 					"clientIPAddr         : "..buf2ipaddr_v4v6(buffer(7,clientlen),clientlen,isBin))					-- Client IP address
			offset = offset + 7 + clientlen
			
			serverlen = buffer(offset+6,1):uint()
			subtree:add(buffer(offset+0,6), 		  			"serverMacAddr        : "..buf2macaddr(buffer(offset+0,6)))											-- Server MAC address
			subtree:add(buffer(offset+6,1), 		  			"serverIPAddrSize     : "..lookup(serverlen, ipAddrSizeTbl, "For future expansion"))				-- Size of IP address to set for server
			
			subtree:add(buffer(offset+7,serverlen),				"serverIPAddr         : "..buf2ipaddr_v4v6(buffer(offset+7,serverlen),serverlen,isBin))				-- IP address to set for server
			subtree:add(buffer(offset+7+serverlen,serverlen), 	"serverSubnetMask     : "..buf2ipaddr_v4v6(buffer(offset+7+serverlen,serverlen),serverlen,isBin))	-- Subnet mask to set for server
			subtree:add(buffer(offset+7+serverlen*2,serverlen),	"serverDefaultGWIPAddr: "..buf2ipaddr_v4v6(buffer(offset+7+serverlen*2,serverlen),serverlen,isBin))	-- Default gateway IP address to set for server
			offset = offset + 7 + serverlen*3
			
			hostlen = buffer(offset,1):uint()
			subtree:add(buffer(offset,1), 		 				"serverHostnameSize   : "..hostlen)																	-- Size of host name to set for server
			subtree:add(buffer(offset+1,hostlen), 				"serverHostname       : "..buffer(offset+1,hostlen):string())										-- Host name to set for server
			subtree:add(buffer(offset+1+hostlen,2),				"serverVendorCode     : "..string.format("0x%04X",buffer(offset+1+hostlen,2):le_uint()))			-- Server vendor code
			subtree:add(buffer(offset+3+hostlen,4),				"serverModelCode      : "..string.format("0x%08X",buffer(offset+3+hostlen,4):le_uint()))			-- Server model code
			subtree:add(buffer(offset+7+hostlen,2),				"serverMachineVersion : "..string.format("0x%04X",buffer(offset+7+hostlen,2):le_uint()))			-- Server machine version
			offset = offset + 9 + hostlen
			
			targetlen = buffer(offset,1):uint()
			subtree:add(buffer(offset,1), 						"targetUnitIPAddrSize : "..lookup(targetlen, ipAddrSizeTbl, "For future expansion"))				-- Size of IP address of other communication target unit
			subtree:add(buffer(offset+1,targetlen), 			"targetUnitIPAddr     : "..buf2ipaddr_v4v6(buffer(offset+1,targetlen),targetlen,isBin))				-- IP address of other communication target unit
			subtree:add(buffer(offset+1+targetlen,2), 			"targetUnitPortNo     : "..string.format("0x%04X",buffer(offset+1+targetlen,2):le_uint()))			-- Communication port number of other communication target unit
			status = buffer(offset+3+targetlen,2):le_uint()
			subtree:add(buffer(offset+3+targetlen,2), 			"serverStatus         : "..lookup(status, serverStatusTbl,"Abnormal status (defined by server manufacturer)"))		-- Server status
			subtree:add(buffer(offset+5+targetlen,2), 			"serverPortNo         : "..string.format("0x%04X",buffer(offset+5+targetlen,2):le_uint()))			-- Server communication port number
			protocol = buffer(offset+7+targetlen,1):uint()
			subtree:add(buffer(offset+7+targetlen,1), 			"serverProtocol       : "..lookup(protocol, serverProtocolTbl, "For future expansion"))				-- Server communication protocol setting
		else
			-- ASCII
			clientlen = tonumber(buffer(12,2):string(),16)
			subtree:add(buffer(0,12), 								"clientMacAddr        : "..buf2macaddr_asc(buffer(0,6)))										-- Client MAC address
			subtree:add(buffer(12,2), 								"clientIPAddrSize     : "..lookup(clientlen, ipAddrSizeTbl, "For future expansion"))			-- Client IP address size
			subtree:add(buffer(14,clientlen*2), 					"clientIPAddr         : "..buf2ipaddr_v4v6(buffer(7,clientlen*2),clientlen,isBin))				-- Client IP address
			offset = offset + 14 + clientlen*2
			
			serverlen = tonumber(buffer(offset+12,2):string(),16)
			subtree:add(buffer(offset+0,12), 		  				"serverMacAddr        : "..buf2macaddr_asc(buffer(offset+0,12)))											-- Server MAC address
			subtree:add(buffer(offset+12,2), 		  				"serverIPAddrSize     : "..lookup(serverlen, ipAddrSizeTbl, "For future expansion"))						-- Size of IP address to set for server
			subtree:add(buffer(offset+14,serverlen*2),				"serverIPAddr         : "..buf2ipaddr_v4v6(buffer(offset+14,serverlen*2),serverlen,isBin))					-- IP address to set for server
			subtree:add(buffer(offset+14+serverlen*2,serverlen*2), 	"serverSubnetMask     : "..buf2ipaddr_v4v6(buffer(offset+14+serverlen*2,serverlen*2),serverlen,isBin))		-- Subnet mask to set for server
			subtree:add(buffer(offset+14+serverlen*4,serverlen*2),	"serverDefaultGWIPAddr: "..buf2ipaddr_v4v6(buffer(offset+14+serverlen*4,serverlen*2),serverlen,isBin))		-- Default gateway IP address to set for server
			offset = offset + 7 + serverlen*6
			
			hostlen = tonumber(buffer(offset,2):string(),16)
			subtree:add(buffer(offset,2), 		 					"serverHostnameSize   : "..buffer(offset,2):string())														-- Size of host name to set for server
			subtree:add(buffer(offset+2,hostlen), 					"serverHostname       : "..buffer(offset+2,hostlen):string())												-- Host name to set for server
			subtree:add(buffer(offset+2+hostlen,4),					"serverVendorCode     : 0x"..buffer(offset+2+hostlen,4):string())											-- Server vendor code
			subtree:add(buffer(offset+6+hostlen,8),					"serverModelCode      : 0x"..buffer(offset+6+hostlen,8):string())											-- Server model code
			subtree:add(buffer(offset+14+hostlen,4),				"serverMachineVersion : 0x"..buffer(offset+14+hostlen,4):string())											-- Server machine version
			offset = offset + 18 + hostlen
			
			targetlen = tonumber(buffer(offset,2):string(),16)
			subtree:add(buffer(offset,2), 							"targetUnitIPAddrSize : "..lookup(targetlen, ipAddrSizeTbl, "For future expansion"))						-- Size of IP address of other communication target unit
			subtree:add(buffer(offset+2,targetlen*2), 				"targetUnitIPAddr     : "..buf2ipaddr_v4v6(buffer(offset+2,targetlen*2),targetlen,isBin))					-- IP address of other communication target unit
			subtree:add(buffer(offset+2+targetlen*2,4), 			"targetUnitPortNo     : 0x"..buffer(offset+2+targetlen*2,4):string())											-- Communication port number of other communication target unit
			status = tonumber(buffer(offset+1+targetlen*2,2):string(),16)
			subtree:add(buffer(offset+6+targetlen*2,4), 			"serverStatus         : "..lookup(status, serverStatusTbl,"Abnormal status (defined by server manufacturer)"))	-- Server status
			subtree:add(buffer(offset+10+targetlen*2,4), 			"serverPortNo         : 0x"..buffer(offset+10+targetlen*2,4):string())										-- Server communication port number
			protocol = tonumber(buffer(offset+14+targetlen*2,2):string(),16)
			subtree:add(buffer(offset+14+targetlen*2,2), 			"serverProtocol       : "..lookup(protocol, serverProtocolTbl, "For future expansion"))						-- Server communication protocol setting
		end
	end
end

function Slmp0E30_0001(buffer, subcmd, subtree, isReq, isBin)
	local addrsize		-- Client IP address size
	local ipAddrSizeTbl = {
		[4] = "IPv4(0x04)",
		[16] = "IPv6(0x10)",
	}
	
	-- Req
	if( isReq ) then
		if( isBin ) then
			-- Binary
			addrsize = buffer(6,1):uint()

			subtree:add(buffer(0,6), 		"clientMacAddr   : "..buf2macaddr(buffer(0,6)))											-- Client MAC address
			subtree:add(buffer(6,1), 		"clientIPAddrSize: "..lookup(addrsize, ipAddrSizeTbl, "For future expansion"))			-- Client IP address size
			subtree:add(buffer(7,addrsize), "clientIPAddr    : "..buf2ipaddr_v4v6(buffer(7,addrsize),addrsize,isBin))				-- Client IP address
		else
			-- ASCII
			addrsize = tonumber(buffer(12,2):string(),16)
			
			subtree:add(buffer(0,12),			"clientMacAddr   : "..buf2macaddr_asc(buffer(0,12)))								-- Client MAC address
			subtree:add(buffer(12,2), 			"clientIPAddrSize: "..lookup(addrsize, ipAddrSizeTbl, "For future expansion"))		-- Client IP address size
			subtree:add(buffer(14,addrsize*2),	"clientIPAddr    : "..buf2ipaddr_v4v6(buffer(14,addrsize*2),addrsize,isBin))		-- Client IP address
		end

	-- Res
	else
		local clientlen
		local serverlen
		local hostlen
		local modeltlen
		local targetlen
		local offset = 0
		local status
		local serverStatusTbl = {
			[0x0000] = "Normal status(0x0000)",
		}
		local protocol
		local serverProtocolTbl = {
			[0x00] = "TCP(0x00)",
			[0x01] = "UDP(0x01)"
		}
		if( isBin ) then
			-- Binary
			clientlen = buffer(6,1):uint()
			subtree:add(buffer(0,6), 							"clientMacAddr        : "..buf2macaddr(buffer(0,6)))												-- Client MAC address
			subtree:add(buffer(6,1), 							"clientIPAddrSize     : "..lookup(clientlen, ipAddrSizeTbl, "For future expansion"))				-- Client IP address size
			subtree:add(buffer(7,clientlen), 					"clientIPAddr         : "..buf2ipaddr_v4v6(buffer(7,clientlen),clientlen,isBin))					-- Client IP address
			offset = offset + 7 + clientlen
			
			serverlen = buffer(offset+6,1):uint()
			subtree:add(buffer(offset+0,6), 		  			"serverMacAddr        : "..buf2macaddr(buffer(offset+0,6)))											-- Server MAC address
			subtree:add(buffer(offset+6,1), 		  			"serverIPAddrSize     : "..lookup(serverlen, ipAddrSizeTbl, "For future expansion"))				-- Size of IP address to set for server
			
			subtree:add(buffer(offset+7,serverlen),				"serverIPAddr         : "..buf2ipaddr_v4v6(buffer(offset+7,serverlen),serverlen,isBin))				-- IP address to set for server
			subtree:add(buffer(offset+7+serverlen,serverlen), 	"serverSubnetMask     : "..buf2ipaddr_v4v6(buffer(offset+7+serverlen,serverlen),serverlen,isBin))	-- Subnet mask to set for server
			subtree:add(buffer(offset+7+serverlen*2,serverlen),	"serverDefaultGWIPAddr: "..buf2ipaddr_v4v6(buffer(offset+7+serverlen*2,serverlen),serverlen,isBin))	-- Default gateway IP address to set for server
			offset = offset + 7 + serverlen*3
			
			hostlen = buffer(offset,1):uint()
			subtree:add(buffer(offset,1), 		 				"serverHostnameSize   : "..hostlen)																	-- Size of host name to set for server
			subtree:add(buffer(offset+1,hostlen), 				"serverHostname       : "..buffer(offset+1,hostlen):string())										-- Host name to set for server
			subtree:add(buffer(offset+1+hostlen,2),				"serverVendorCode     : "..string.format("0x%04X",buffer(offset+1+hostlen,2):le_uint()))			-- Server vendor code
			subtree:add(buffer(offset+3+hostlen,4),				"serverModelCode      : "..string.format("0x%08X",buffer(offset+3+hostlen,4):le_uint()))			-- Server model code
			offset = offset + 7 + hostlen

			modeltlen = buffer(offset,1):uint()
			subtree:add(buffer(offset,1), 		 				"serverModelNameSize  : "..modeltlen)																-- Server model name size
			subtree:add(buffer(offset+1,modeltlen), 			"serverModelName      : "..buffer(offset+1,modeltlen):string())										-- Server model name
			subtree:add(buffer(offset+1+modeltlen,2),			"serverMachineVersion : "..string.format("0x%04X",buffer(offset+modeltlen,2):le_uint()))			-- Server machine version
			offset = offset + 3 + modeltlen
			
			targetlen = buffer(offset,1):uint()
			subtree:add(buffer(offset,1), 						"targetUnitIPAddrSize : "..lookup(targetlen, ipAddrSizeTbl, "For future expansion"))				-- Size of IP address of other communication target unit
			subtree:add(buffer(offset+1,targetlen), 			"targetUnitIPAddr     : "..buf2ipaddr_v4v6(buffer(offset+1,targetlen),targetlen,isBin))				-- IP address of other communication target unit
			subtree:add(buffer(offset+1+targetlen,2), 			"targetUnitPortNo     : "..string.format("0x%04X",buffer(offset+1+targetlen,2):le_uint()))			-- Communication port number of other communication target unit
			status = buffer(offset+3+targetlen,2):le_uint()
			subtree:add(buffer(offset+3+targetlen,2), 			"serverStatus         : "..lookup(status, serverStatusTbl,"Abnormal status (defined by server manufacturer)"))		-- Server status
			subtree:add(buffer(offset+5+targetlen,2), 			"serverPortNo         : "..string.format("0x%04X",buffer(offset+5+targetlen,2):le_uint()))			-- Server communication port number
			protocol = buffer(offset+7+targetlen,1):uint()
			subtree:add(buffer(offset+7+targetlen,1), 			"serverProtocol       : "..lookup(protocol, serverProtocolTbl, "For future expansion"))				-- Server communication protocol setting
		else
			-- ASCII
			clientlen = tonumber(buffer(12,2):string(),16)
			subtree:add(buffer(0,12), 								"clientMacAddr        : "..buf2macaddr_asc(buffer(0,6)))										-- Client MAC address
			subtree:add(buffer(12,2), 								"clientIPAddrSize     : "..lookup(clientlen, ipAddrSizeTbl, "For future expansion"))			-- Client IP address size
			subtree:add(buffer(14,clientlen*2), 					"clientIPAddr         : "..buf2ipaddr_v4v6(buffer(7,clientlen*2),clientlen,isBin))				-- Client IP address
			offset = offset + 14 + clientlen*2
			
			serverlen = tonumber(buffer(offset+12,2):string(),16)
			subtree:add(buffer(offset+0,12), 		  				"serverMacAddr        : "..buf2macaddr_asc(buffer(offset+0,12)))											-- Server MAC address
			subtree:add(buffer(offset+12,2), 		  				"serverIPAddrSize     : "..lookup(serverlen, ipAddrSizeTbl, "For future expansion"))						-- Size of IP address to set for server
			subtree:add(buffer(offset+14,serverlen*2),				"serverIPAddr         : "..buf2ipaddr_v4v6(buffer(offset+14,serverlen*2),serverlen,isBin))					-- IP address to set for server
			subtree:add(buffer(offset+14+serverlen*2,serverlen*2), 	"serverSubnetMask     : "..buf2ipaddr_v4v6(buffer(offset+14+serverlen*2,serverlen*2),serverlen,isBin))		-- Subnet mask to set for server
			subtree:add(buffer(offset+14+serverlen*4,serverlen*2),	"serverDefaultGWIPAddr: "..buf2ipaddr_v4v6(buffer(offset+14+serverlen*4,serverlen*2),serverlen,isBin))		-- Default gateway IP address to set for server
			offset = offset + 7 + serverlen*6
			
			hostlen = tonumber(buffer(offset,2):string(),16)
			subtree:add(buffer(offset,2), 		 					"serverHostnameSize   : "..buffer(offset,2):string())														-- Size of host name to set for server
			subtree:add(buffer(offset+2,hostlen), 					"serverHostname       : "..buffer(offset+2,hostlen):string())												-- Host name to set for server
			subtree:add(buffer(offset+2+hostlen,4),					"serverVendorCode     : 0x"..buffer(offset+2+hostlen,4):string())											-- Server vendor code
			subtree:add(buffer(offset+6+hostlen,8),					"serverModelCode      : 0x"..buffer(offset+6+hostlen,8):string())											-- Server model code
			offset = offset + 14 + hostlen
			
			modeltlen = tonumber(buffer(offset,2):string(),16)
			subtree:add(buffer(offset,2), 		 				"serverModelNameSize  : "..buffer(offset,2):string())															-- Server model name size
			subtree:add(buffer(offset+2,modeltlen), 			"serverModelName      : "..buffer(offset+2,modeltlen):string())													-- Server model name
			subtree:add(buffer(offset+2+modeltlen,4),			"serverMachineVersion : 0x"..buffer(offset+2+modeltlen,4):string())				 								-- Server machine version
			offset = offset + 6 + modeltlen
						
			targetlen = tonumber(buffer(offset,2):string(),16)
			subtree:add(buffer(offset,2), 							"targetUnitIPAddrSize : "..lookup(targetlen, ipAddrSizeTbl, "For future expansion"))						-- Size of IP address of other communication target unit
			subtree:add(buffer(offset+2,targetlen*2), 				"targetUnitIPAddr     : "..buf2ipaddr_v4v6(buffer(offset+2,targetlen*2),targetlen,isBin))					-- IP address of other communication target unit
			subtree:add(buffer(offset+2+targetlen*2,4), 			"targetUnitPortNo     : 0x"..buffer(offset+2+targetlen*2,4):string())										-- Communication port number of other communication target unit
			status = tonumber(buffer(offset+1+targetlen*2,2):string(),16)
			subtree:add(buffer(offset+6+targetlen*2,4), 			"serverStatus         : "..lookup(status, serverStatusTbl,"Abnormal status (defined by server manufacturer)"))	-- Server status
			subtree:add(buffer(offset+10+targetlen*2,4), 			"serverPortNo         : 0x"..buffer(offset+10+targetlen*2,4):string())										-- Server communication port number
			protocol = tonumber(buffer(offset+14+targetlen*2,2):string(),16)
			subtree:add(buffer(offset+14+targetlen*2,2), 			"serverProtocol       : "..lookup(protocol, serverProtocolTbl, "For future expansion"))						-- Server communication protocol setting
		end
	end
end

-- IPAddressSet(0E31)
function Slmp0E31(buffer, subcmd, subtree, isReq, isBin)
	local clientlen
	local serverlen
	local hostlen
	local targetlen
	local offset = 0
	local ipAddrSizeTbl = {
		[4] = "IPv4(0x04)"	,
		[16] = "IPv6(0x10)",
	}
	local protocol
	local serverProtocolTbl = {
		[0x00] = "TCP(0x00)",
		[0x01] = "UDP(0x01)"
	}
	
	-- Req
	if( isReq ) then
		if( isBin ) then
			-- Binary
			clientlen = buffer(6,1):uint()
			subtree:add(buffer(0,6), 							"clientMacAddr         : "..buf2macaddr(buffer(0,6)))												-- Client MAC address
			subtree:add(buffer(6,1), 							"clientIPAddrSize      : "..lookup(clientlen, ipAddrSizeTbl, "For future expansion"))				-- Client IP address size
			subtree:add(buffer(7,clientlen), 					"clientIPAddr          : "..buf2ipaddr_v4v6(buffer(7,clientlen),clientlen,isBin))					-- Client IP address
			offset = offset + 7 + clientlen
			
			serverlen = buffer(offset+6,1):uint()
			subtree:add(buffer(offset+0,6), 		  			"serverMacAddr         : "..buf2macaddr(buffer(offset+0,6)))										-- Server MAC address
			subtree:add(buffer(offset+6,1), 		  			"serverIPAddrSize      : "..lookup(serverlen, ipAddrSizeTbl, "For future expansion"))				-- Size of IP address to set for server
			subtree:add(buffer(offset+7,serverlen),				"serverIPAddr          : "..buf2ipaddr_v4v6(buffer(offset+7,serverlen),serverlen,isBin))			-- IP address to set for server
			subtree:add(buffer(offset+7+serverlen,serverlen), 	"serverSubnetMask      : "..buf2ipaddr_v4v6(buffer(offset+7+serverlen,serverlen),serverlen,isBin))	-- Subnet mask to set for server
			subtree:add(buffer(offset+7+serverlen*2,serverlen),	"serverDefaultGWIPAddr : "..buf2ipaddr_v4v6(buffer(offset+7+serverlen*2,serverlen),serverlen,isBin))-- Default gateway IP address to set for server
			offset = offset + 7 + serverlen*3
			
			hostlen = buffer(offset,1):uint()
			subtree:add(buffer(offset,1), 		  				"serverHostnameSize    : "..hostlen)																-- Size of host name to set for server
			subtree:add(buffer(offset+1,hostlen), 				"serverHostname        : "..buffer(offset+1,hostlen):string())										-- Host name to set for server
			offset = offset + 1 + hostlen
			
			targetlen = buffer(offset,1):uint()
			subtree:add(buffer(offset,1), 						"targetUnitIPAddrSize  : "..lookup(targetlen, ipAddrSizeTbl, "For future expansion"))				-- Size of IP address of other communication target unit
			subtree:add(buffer(offset+1,targetlen), 			"targetUnitIPAddr      : "..buf2ipaddr_v4v6(buffer(offset+1,targetlen),targetlen,isBin))			-- IP address of other communication target unit
			subtree:add(buffer(offset+1+targetlen,2), 			"targetUnitPortNo      : "..string.format("0x%04X",buffer(offset+1+targetlen,2):le_uint()))			-- Communication port number of other communication target unit
			protocol = buffer(offset+3+targetlen,1):uint()
			subtree:add(buffer(offset+3+targetlen,1), 			"serverProtocol        : "..lookup(protocol, serverProtocolTbl, "For future expansion"))			-- Communication protocol setting to set for server
		else
			-- ASCII
			clientlen = tonumber(buffer(12,2):string(),16)
			subtree:add(buffer(0,12), 								"clientMacAddr        : "..buf2macaddr_asc(buffer(0,12)))												-- Client MAC address
			subtree:add(buffer(12,2), 								"clientIPAddrSize     : "..lookup(clientlen, ipAddrSizeTbl, "For future expansion"))					-- Client IP address size
			subtree:add(buffer(14,clientlen*2), 					"clientIPAddr         : "..buf2ipaddr_v4v6(buffer(14,clientlen*2),clientlen,isBin))						-- Client IP address
			offset = offset + 14 + clientlen*2

			serverlen = tonumber(buffer(offset+12,2):string(),16)
			subtree:add(buffer(offset+0,12), 		  				"serverMacAddr        : "..buf2macaddr_asc(buffer(offset+0,12)))										-- Server MAC address
			subtree:add(buffer(offset+12,2), 		  				"serverIPAddrSize     : "..lookup(serverlen, ipAddrSizeTbl, "For future expansion"))					-- Size of IP address to set for server
			subtree:add(buffer(offset+14,serverlen*2),				"serverIPAddr         : "..buf2ipaddr_v4v6(buffer(offset+14,serverlen*2),serverlen,isBin))				-- IP address to set for server
			subtree:add(buffer(offset+14+serverlen*2,serverlen*2),	"serverSubnetMask     : "..buf2ipaddr_v4v6(buffer(offset+14+serverlen*2,serverlen*2),serverlen,isBin))	-- Subnet mask to set for server
			subtree:add(buffer(offset+14+serverlen*4,serverlen*2),	"serverDefaultGWIPAddr: "..buf2ipaddr_v4v6(buffer(offset+14+serverlen*4,serverlen*2),serverlen,isBin))	-- Default gateway IP address to set for server
			offset = offset + 14 + serverlen*6

			hostlen = tonumber(buffer(offset,2):string(),16)
			subtree:add(buffer(offset,2), 		  					"serverHostnameSize   : "..hostlen)																		-- Size of host name to set for server
			subtree:add(buffer(offset+2,hostlen), 					"serverHostname       : "..buffer(offset+2,hostlen):string())											-- Host name to set for server
			offset = offset + 2 + hostlen
			
			targetlen = tonumber(buffer(offset,2):string(),16)
			subtree:add(buffer(offset,2), 							"targetUnitIPAddrSize : "..lookup(targetlen,ipAddrSizeTbl, "For future expansion"))						-- Size of IP address of other communication target unit
			subtree:add(buffer(offset+2,targetlen*2), 				"targetUnitIPAddr     : "..buf2ipaddr_v4v6(buffer(offset+2,targetlen*2),targetlen,isBin))				-- IP address of other communication target unit
			subtree:add(buffer(offset+2+targetlen*2,4), 			"targetUnitPortNo     : 0x"..buffer(offset+2+targetlen*2,4):string())										-- Communication port number of other communication target unit
			protocol = tonumber(buffer(offset+6+targetlen*2,2):string(),16)
			subtree:add(buffer(offset+6+targetlen*2,2), 			"serverProtocol       : "..lookup(protocol, serverProtocolTbl, "For future expansion"))					-- Communication protocol setting to set for server
		end
	-- Res
	else
		if( isBin ) then
			subtree:add(buffer(0,6),"clientMacAddr: "..buf2macaddr(buffer(0,6)))		-- Client MAC address
		else
			subtree:add(buffer(0,12),"clientMacAddr: "..buf2macaddr_asc(buffer(0,12)))		-- Client MAC address
		end
	end
end

-- DeviceInfoCompare(0E32)
function Slmp0E32(buffer, subcmd, subtree, isReq, isBin)
	local compareTargetTbl = {
		[0] = "0:no comparison target",
		[1] = "1:comparison target"
	}
	
	-- Req
	if( isReq ) then
		-- Binary
		if( isBin ) then
			local targetDeviceversion = bit32.extract(buffer(0,2):le_uint(),2,1)
			local targetModelnamecode = bit32.extract(buffer(0,2):le_uint(),1,1)
			local targetVendorcode    = bit32.extract(buffer(0,2):le_uint(),0,1)
			
			subtree:add(buffer(0,2), "compareTarget    : "..string.format("0x%04x",buffer(0,2):le_uint()))			-- Comparison target
				subtree:add(buffer(0,2), string.format("        .... .... .... .%d.. Device version(%s)", bit32.extract(buffer(0,2):le_uint(),2,1),
																										lookup(targetDeviceversion, compareTargetTbl, "Unkown")))
				subtree:add(buffer(0,2), string.format("        .... .... .... ..%d. Model name code(%s)", bit32.extract(buffer(0,2):le_uint(),1,1),
																										lookup(targetModelnamecode, compareTargetTbl, "Unkown")))
				subtree:add(buffer(0,2), string.format("        .... .... .... ...%d Vendor code(%s)", bit32.extract(buffer(0,2):le_uint(),0,1),
																										lookup(targetVendorcode, compareTargetTbl, "Unkown")))
			subtree:add(buffer(2,2), "vendorCode       : "..string.format("0x%04x",buffer(2,2):le_uint()))			-- Vendor code
			subtree:add(buffer(4,4), "modelCode        : "..string.format("0x%08x",buffer(4,4):le_uint()))			-- Model code
			subtree:add(buffer(8,2), "machineVersion   : "..string.format("0x%04x",buffer(8,2):le_uint()))			-- Machine version
		else
			-- ASCII
			local targetDeviceversion = bit32.extract(buffer(0,4):string(),2,1)
			local targetModelnamecode = bit32.extract(buffer(0,4):string(),1,1)
			local targetVendorcode    = bit32.extract(buffer(0,4):string(),0,1)
			
			subtree:add(buffer(0,4), "compareTarget    : "..string.format("0x%04x",buffer(0,4):string()))			-- Comparison target
				subtree:add(buffer(0,4), string.format("        .... .... .... .%d.. Device version(%s)", bit32.extract(buffer(0,4):string(),2,1),
																										lookup(targetDeviceversion, compareTargetTbl, "Unkown")))
				subtree:add(buffer(0,4), string.format("        .... .... .... ..%d. Model name code(%s)", bit32.extract(buffer(0,4):string(),1,1),
																										lookup(targetModelnamecode, compareTargetTbl, "Unkown")))
				subtree:add(buffer(0,4), string.format("        .... .... .... ...%d Vendor code(%s)", bit32.extract(buffer(0,4):string(),0,1),
																										lookup(targetVendorcode, compareTargetTbl, "Unkown")))
			subtree:add(buffer(4,4), "vendorCode       : 0x"..buffer(4,4):string())									-- Vendor code
			subtree:add(buffer(8,8), "modelCode        : 0x"..buffer(8,8):string())									-- Model code
			subtree:add(buffer(16,4), "machineVersion   : 0x"..buffer(16,4):string())								-- Machine version
		end

	else
		-- Res
		local compareResultTbl = {
			[0] = "0:indicates match",
			[1] = "1:indicates mismatch"
		}
		
		-- Binary
		if( isBin ) then
			targetDeviceversion = bit32.extract(buffer(0,2):le_uint(),2,1)
			targetModelnamecode = bit32.extract(buffer(0,2):le_uint(),1,1)
			targetVendorcode    = bit32.extract(buffer(0,2):le_uint(),0,1)
			buf_bit15           = bit32.extract(buffer(2,2):le_uint(),15,1)
			buf_bit14           = bit32.extract(buffer(2,2):le_uint(),14,1)
			
			subtree:add(buffer(0,2), "compareTarget       : "..string.format("0x%04x",buffer(0,2):le_uint()))									-- Comparison target
				subtree:add(buffer(0,2), string.format("        .... .... .... .%d.. Device version(%s)", bit32.extract(buffer(0,2):le_uint(),2,1),
																											lookup(targetDeviceversion, compareTargetTbl, "Unkown")))
				subtree:add(buffer(0,2), string.format("        .... .... .... ..%d. Model name code(%s)", bit32.extract(buffer(0,2):le_uint(),1,1),
																											lookup(targetModelnamecode, compareTargetTbl, "Unkown")))
				subtree:add(buffer(0,2), string.format("        .... .... .... ...%d Vendor code(%s)", bit32.extract(buffer(0,2):le_uint(),0,1),
																											lookup(targetVendorcode, compareTargetTbl, "Unkown")))
			subtree:add(buffer(2,2), "compareResult       : "..string.format("0x%04x",buffer(2,2):le_uint()))		-- Comparison result
				if(targetDeviceversion == 0) then
					subtree:add(buffer(2,2), string.format("        %d%d.. .... .... .... Device version details(-:no comparison target)", bit32.extract(buffer(2,2):le_uint(),15,1),
																													bit32.extract(buffer(2,2):le_uint(),14,1)))
					subtree:add(buffer(2,2), string.format("        .... .... .... .%d.. Device version(-:no comparison target)", bit32.extract(buffer(2,2):le_uint(),2,1)))
				else
					subtree:add(buffer(2,2), string.format("        %d%d.. .... .... .... Device version details(%s)", bit32.extract(buffer(2,2):le_uint(),15,1),
																													bit32.extract(buffer(2,2):le_uint(),14,1),
																													getString_DeviceVersionDetails(buf_bit15,buf_bit14)
																													))
					subtree:add(buffer(2,2), string.format("        .... .... .... .%d.. Device version(%s)", bit32.extract(buffer(2,2):le_uint(),2,1),
																											lookup(targetDeviceversion, compareResultTbl, "Unkown")))
				end
				if(targetModelnamecode == 0) then
					subtree:add(buffer(2,2), string.format("        .... .... .... ..%d. Model name code(-:no comparison target)", bit32.extract(buffer(2,2):le_uint(),1,1)))
				else
					subtree:add(buffer(2,2), string.format("        .... .... .... ..%d. Model name code(%s)", bit32.extract(buffer(2,2):le_uint(),1,1),
																											lookup(targetModelnamecode, compareResultTbl, "Unkown")))
				end
				if(targetVendorcode == 0) then
					subtree:add(buffer(2,2), string.format("        .... .... .... ...%d Vendor code(-:no comparison target)", bit32.extract(buffer(2,2):le_uint(),0,1)))
				else
					subtree:add(buffer(2,2), string.format("        .... .... .... ...%d Vendor code(%s)", bit32.extract(buffer(2,2):le_uint(),0,1),
																											lookup(targetVendorcode, compareResultTbl, "Unkown")))
				end
		else
			-- ASCII
			targetDeviceversion = bit32.extract(buffer(0,4):string(),2,1)
			targetModelnamecode = bit32.extract(buffer(0,4):string(),1,1)
			targetVendorcode    = bit32.extract(buffer(0,4):string(),0,1)
			buf_bit15           = bit32.extract(buffer(2,4):string(),15,1)
			buf_bit14           = bit32.extract(buffer(2,4):string(),14,1)
			
			subtree:add(buffer(0,4), "compareTarget    : "..buffer(0,4):le_uint())									-- Comparison target
				subtree:add(buffer(0,4), string.format("        .... .... .... .%d.. Device version(%s)", bit32.extract(buffer(0,4):string(),2,1),
																											lookup(targetDeviceversion, compareTargetTbl, "Unkown")))
				subtree:add(buffer(0,4), string.format("        .... .... .... ..%d. Model name code(%s)", bit32.extract(buffer(0,4):string(),1,1),
																											lookup(targetModelnamecode, compareTargetTbl, "Unkown")))
				subtree:add(buffer(0,4), string.format("        .... .... .... ...%d Vendor code(%s)", bit32.extract(buffer(0,4):string(),0,1),
																											lookup(targetVendorcode, compareTargetTbl, "Unkown")))
			subtree:add(buffer(4,4), "compareResult       : "..string.format("0x%04x",buffer(4,4):le_uint()))		-- Comparison result
				if(targetDeviceversion == 0) then
					subtree:add(buffer(4,4), string.format("        %d%d.. .... .... .... Device version details(-:no comparison target)", bit32.extract(buffer(4,4):string(),15,1),
																													bit32.extract(buffer(4,4):string(),14,1)))
					subtree:add(buffer(4,4), string.format("        .... .... .... .%d.. Device version(-:no comparison target)", bit32.extract(buffer(4,4):string(),2,1)))
				else
					subtree:add(buffer(4,4), string.format("        %d%d.. .... .... .... Device version details(%s)", bit32.extract(buffer(4,4):string(),15,1),
																													bit32.extract(buffer(4,4):string(),14,1),
																													getString_DeviceVersionDetails(buf_bit15,buf_bit14)
																													))
					subtree:add(buffer(4,4), string.format("        .... .... .... .%d.. Device version(%s)", bit32.extract(buffer(4,4):string(),2,1),
																											lookup(targetDeviceversion, compareResultTbl, "Unkown")))
				end
				if(targetModelnamecode == 0) then
					subtree:add(buffer(4,4), string.format("        .... .... .... ..%d. Model name code(-:no comparison target)", bit32.extract(buffer(4,4):string(),1,1)))
				else
					subtree:add(buffer(4,4), string.format("        .... .... .... ..%d. Model name code(%s)", bit32.extract(buffer(4,4):string(),1,1),
																											lookup(targetModelnamecode, compareResultTbl, "Unkown")))
				end
				if(targetVendorcode == 0) then
					subtree:add(buffer(4,4), string.format("        .... .... .... ...%d Vendor code(-:no comparison target)", bit32.extract(buffer(4,4):string(),0,1)))
				else
					subtree:add(buffer(4,4), string.format("        .... .... .... ...%d Vendor code(%s)", bit32.extract(buffer(4,4):string(),0,1),
																											lookup(targetVendorcode, compareResultTbl, "Unkown")))
				end

		end
	end
end

-- ParameterGet(0E33)
function Slmp0E33(buffer, subcmd, subtree, isReq, isBin)
	-- Req
	if( isReq ) then
		-- Binary
		if( isBin ) then
			ParaNo = tonumber(buffer(0,2):le_uint())

			subtree:add(buffer(0,2), "parameterNum         : "..ParaNo)	-- Number of parameters to acquire
			
			for i=0,ParaNo*2-1,2 do
				subtree:add(buffer(2+i,2), "parameterID          : "..string.format("0x%04X", buffer(2+i,2):le_uint()))	-- Parameter ID
			end

		else
			-- ASCII
			ParaNo = tonumber(buffer(0,4):string())
			subtree:add(buffer(0,4), "parameterNum         : "..ParaNo)	-- Number of parameters to acquire
			
			for i=0,ParaNo*4-1,4 do
				subtree:add(buffer(4+i,4), "parameterID          : "..string.format("0x%04X", buffer(4+i,4):string()))	-- Parameter ID
			end
		end
	else
		-- Res
		-- Binary
		if( isBin ) then
			local parameter_Size = 0
			ParaNo = tonumber(buffer(0,2):le_uint())
			subtree:add(buffer(0,2), "parameterNum         : "..ParaNo)	-- Number of parameters to acquire
			local	offset_ = 2
			
			for i=1,ParaNo ,1 do
				subtree:add(buffer(offset_,2), "parameterID          : "..string.format("0x%04X", buffer(2,2):le_uint()))	-- Parameter ID
				offset_ = offset_ + 2
				subtree:add(buffer(offset_,2), "parameterSize        : "..string.format("0x%04X", buffer(4,2):le_uint()))	-- Size parameter value
				parameter_Size = buffer(offset_,2):le_uint()
				offset_ = offset_ + 2
				subtree:add(buffer(offset_,parameter_Size), "parameterValue       : "..string.format("0x%s", buffer(offset_,parameter_Size)))	-- Parameter value
				offset_ = offset_ + parameter_Size
			end
		else
			-- ASCII
			local parameter_Size = 0
			ParaNo = tonumber(buffer(0,4):le_uint())
			subtree:add(buffer(0,4), "parameterNum  : "..ParaNo)	-- Number of parameters to acquire
			local	offset_ = 4
			
			for i=1,ParaNo ,1 do
				subtree:add(buffer(offset_,4), "parameterID              : "..string.format("0x%04X", buffer(4,4):string()))	-- Parameter ID
				offset_ = offset_ + 4
				subtree:add(buffer(offset_,4), "parameterSize            : "..string.format("0x%04X", buffer(8,4):string()))	-- Size parameter value
				parameter_Size = buffer(offset_,4):le_uint()
				offset_ = offset_ + 4
				subtree:add(buffer(offset_,parameter_Size), "parameterValue           : "..buffer(offset_,parameter_Size):string())	-- Parameter value
				offset_ = offset_ + parameter_Size
			end
		end
	end
end

-- ParameterSet(0E34)
function Slmp0E34(buffer, subcmd, subtree, isReq, isBin)
	-- Req
	if( isReq ) then
		-- Binary
		if( isBin ) then
			ParaNo = tonumber(buffer(0,2):le_uint())
			offset = 0
			
			subtree:add(buffer(0,2), "parameterNum         : "..ParaNo)	-- Number of parameters to set
			
			for i=0,ParaNo*2-1,2 do
				subtree:add(buffer(2+offset,2), "parameterID          : "..string.format("0x%04X", buffer(2+offset,2):le_uint()))		-- Parameter ID
				subtree:add(buffer(4+offset,2), "parameterSize        : "..string.format("0x%04X", buffer(4+offset,2):le_uint()))		-- Size parameter value
				ParaLen = tonumber(buffer(4+offset,2):le_uint())
				subtree:add(buffer(6+offset,ParaLen),"parameterValue       : "..string.format("0x%s", buffer(6+offset,ParaLen)))		-- Parameter value
				offset = offset+4+ParaLen
			end
		else
			-- ASCII
			ParaNo = tonumber(buffer(0,4):string())
			offset = 0
			
			subtree:add(buffer(0,4), "parameterNum         : "..ParaNo)	-- Number of parameters to set
			
			for i=0,ParaNo*4-1,4 do
				subtree:add(buffer(4+offset,4), "parameterID          : "..string.format("0x%04X", buffer(4+offset,4):string()))		-- Parameter ID
				subtree:add(buffer(8+offset,4), "parameterSize        : "..string.format("0x%04X", buffer(8+offset,4):string()))		-- Size parameter value
				ParaLen = tonumber(buffer(8+offset,4):string())
				subtree:add(buffer(12+offset,ParaLen*2),"parameterValue       : "..string.format("0x%s", buffer(12+offset,ParaLen*2):string()))			-- Parameter value
				offset = offset+8+ParaLen
			end
		end
	else
		-- Res
		-- Does not have response data.
	end
end

-- ParameterSetStart(0E35)
function Slmp0E35(buffer, subcmd, subtree, isReq, isBin)
	-- Req
	if( isReq ) then
		-- Does not have request data.
	else
		-- Res
		-- Does not have response data.
	end
end

-- ParameterSetEnd(0E36)
function Slmp0E36(buffer, subcmd, subtree, isReq, isBin)
	-- Req
	if( isReq ) then
		-- Does not have request data.
	else
		-- Res
		-- Does not have response data.
	end
end

-- ParameterSetCancel(0E3A)
function Slmp0E3A(buffer, subcmd, subtree, isReq, isBin)
	-- Req
	if( isReq ) then
		-- Does not have request data.
	else
		-- Res
		-- Does not have response data.
	end
end

-- DeviceIdentificationInfoGet(0E28)
function Slmp0E28(buffer, subcmd, subtree, isReq, isBin)
	local targetInfoTbl = {
		[0] = "0:Not acquired",
		[1] = "1:Acquired"
	}
	
	-- Req
	if( isReq ) then
		subtree:add(buffer(0,2), string.format("targetInfo : 0x%04x",buffer(0,2):le_uint()))						-- Status code
			subtree:add(buffer(0,2), string.format("        .... .%d.. .... .... Supported function(%s)", bit32.extract(buffer(0,2):le_uint(),10,1),
																										lookup(bit32.extract(buffer(0,2):le_uint(),10,1), targetInfoTbl, "Unkown")))
			subtree:add(buffer(0,2), string.format("        .... ..%d. .... .... Number of RWw and RWr points retained(%s)", bit32.extract(buffer(0,2):le_uint(),9,1),
																										lookup(bit32.extract(buffer(0,2):le_uint(),9,1), targetInfoTbl, "Unkown")))
			subtree:add(buffer(0,2), string.format("        .... ...%d .... .... Number of RX and RY points retained(%s)", bit32.extract(buffer(0,2):le_uint(),8,1),
																										lookup(bit32.extract(buffer(0,2):le_uint(),8,1), targetInfoTbl, "Unkown")))
			subtree:add(buffer(0,2), string.format("        .... .... %d... .... Unit model name string(%s)", bit32.extract(buffer(0,2):le_uint(),7,1),
																										lookup(bit32.extract(buffer(0,2):le_uint(),7,1), targetInfoTbl, "Unkown")))
			subtree:add(buffer(0,2), string.format("        .... .... .%d.. .... Manufacturer string(%s)", bit32.extract(buffer(0,2):le_uint(),6,1),
																										lookup(bit32.extract(buffer(0,2):le_uint(),6,1), targetInfoTbl, "Unkown")))
			subtree:add(buffer(0,2), string.format("        .... .... ..%d. .... Firmware and hardware versions(%s)", bit32.extract(buffer(0,2):le_uint(),5,1),
																										lookup(bit32.extract(buffer(0,2):le_uint(),5,1), targetInfoTbl, "Unkown")))
			subtree:add(buffer(0,2), string.format("        .... .... ...%d .... Model name code(%s)", bit32.extract(buffer(0,2):le_uint(),4,1),
																										lookup(bit32.extract(buffer(0,2):le_uint(),4,1), targetInfoTbl, "Unkown")))
			subtree:add(buffer(0,2), string.format("        .... .... .... %d... Vendor code(%s)", bit32.extract(buffer(0,2):le_uint(),3,1),
																										lookup(bit32.extract(buffer(0,2):le_uint(),3,1), targetInfoTbl, "Unkown")))
			subtree:add(buffer(0,2), string.format("        .... .... .... .%d.. Device version(%s)", bit32.extract(buffer(0,2):le_uint(),2,1),
																										lookup(bit32.extract(buffer(0,2):le_uint(),2,1), targetInfoTbl, "Unkown")))
			subtree:add(buffer(0,2), string.format("        .... .... .... ..%d. Size(%s)", bit32.extract(buffer(0,2):le_uint(),1,1),
																										lookup(bit32.extract(buffer(0,2):le_uint(),1,1), targetInfoTbl, "Unkown")))
		subtree:add(buffer(2,2), string.format("reserved2  : 0x%04x", buffer(2,2):le_uint()))						-- For future expansion (fixed to 1)
		subtree:add(buffer(4,2), string.format("reserved2  : 0x%04x", buffer(4,2):le_uint()))						-- For future expansion (fixed to 0x8000)
	else
		local supportFunctionTbl = {
			[0] = "0:Not supported",
			[1] = "1:supported"
		}
		-- Res
		subtree:add(buffer( 0 ,2), string.format("targetInfo : 0x%04x",buffer( 0 ,2):le_uint()))				-- Status code
			subtree:add(buffer(0,2), string.format("        .... .%d.. .... .... Supported function(%s)", bit32.extract(buffer(0,2):le_uint(),10,1),
																										lookup(bit32.extract(buffer(0,2):le_uint(),10,1), targetInfoTbl, "Unkown")))
			subtree:add(buffer(0,2), string.format("        .... ..%d. .... .... Number of RWw and RWr points retained(%s)", bit32.extract(buffer(0,2):le_uint(),9,1),
																										lookup(bit32.extract(buffer(0,2):le_uint(),9,1), targetInfoTbl, "Unkown")))
			subtree:add(buffer(0,2), string.format("        .... ...%d .... .... Number of RX and RY points retained(%s)", bit32.extract(buffer(0,2):le_uint(),8,1),
																										lookup(bit32.extract(buffer(0,2):le_uint(),8,1), targetInfoTbl, "Unkown")))
			subtree:add(buffer(0,2), string.format("        .... .... %d... .... Unit model name string(%s)", bit32.extract(buffer(0,2):le_uint(),7,1),
																										lookup(bit32.extract(buffer(0,2):le_uint(),7,1), targetInfoTbl, "Unkown")))
			subtree:add(buffer(0,2), string.format("        .... .... .%d.. .... Manufacturer string(%s)", bit32.extract(buffer(0,2):le_uint(),6,1),
																										lookup(bit32.extract(buffer(0,2):le_uint(),6,1), targetInfoTbl, "Unkown")))
			subtree:add(buffer(0,2), string.format("        .... .... ..%d. .... Firmware and hardware versions(%s)", bit32.extract(buffer(0,2):le_uint(),5,1),
																										lookup(bit32.extract(buffer(0,2):le_uint(),5,1), targetInfoTbl, "Unkown")))
			subtree:add(buffer(0,2), string.format("        .... .... ...%d .... Model name code(%s)", bit32.extract(buffer(0,2):le_uint(),4,1),
																										lookup(bit32.extract(buffer(0,2):le_uint(),4,1), targetInfoTbl, "Unkown")))
			subtree:add(buffer(0,2), string.format("        .... .... .... %d... Vendor code(%s)", bit32.extract(buffer(0,2):le_uint(),3,1),
																										lookup(bit32.extract(buffer(0,2):le_uint(),3,1), targetInfoTbl, "Unkown")))
			subtree:add(buffer(0,2), string.format("        .... .... .... .%d.. Device version(%s)", bit32.extract(buffer(0,2):le_uint(),2,1),
																										lookup(bit32.extract(buffer(0,2):le_uint(),2,1), targetInfoTbl, "Unkown")))
			subtree:add(buffer(0,2), string.format("        .... .... .... ..%d. Size(%s)", bit32.extract(buffer(0,2):le_uint(),1,1),
																										lookup(bit32.extract(buffer(0,2):le_uint(),1,1), targetInfoTbl, "Unkown")))
		subtree:add(buffer( 2, 2), string.format("reserved2         : 0x%04x", buffer(2,2):le_uint()))				-- For future expansion (fixed to 1)
		subtree:add(buffer( 4, 2), string.format("reserved2         : 0x%04x", buffer(4,2):le_uint()))				-- For future expansion (fixed to 0x8000)
		subtree:add(buffer( 6, 2), string.format("reserved2         : 0x%04x", buffer(6,2):le_uint()))				-- For future expansion (fixed to 0x004A)
		subtree:add(buffer( 8 ,2), string.format("machineVersion    : 0x%04x", buffer(8,2):le_uint()))				-- Machine version
		subtree:add(buffer(10 ,2), string.format("vendorCode        : 0x%04x", buffer(10,2):le_uint()))				-- Vendor code
		subtree:add(buffer(12 ,4), string.format("modelCode         : 0x%08x", buffer(12,4):le_uint()))				-- Model code
		subtree:add(buffer(16 ,2), string.format("firmwareVersion   : 0x%04x", buffer(16,2):le_uint()))				-- Firmware version
		subtree:add(buffer(18 ,2), string.format("hardwareVersion   : 0x%04x", buffer(18,2):le_uint()))				-- Hardware version
		subtree:add(buffer(20,32), "makerString       : 0x"..buffer(20,32))											-- Maker string
		subtree:add(buffer(52,20), "moduleModelString : 0x"..buffer(52,20))											-- Unit model name string
		subtree:add(buffer(72, 2), string.format("rxPoints          : 0x%04x", buffer(72,2):le_uint()))				-- Number of RX points to retain
		subtree:add(buffer(74, 2), string.format("ryPoints          : 0x%04x", buffer(74,2):le_uint()))				-- Number of RY points to retain
		subtree:add(buffer(76, 2), string.format("rwwPoints         : 0x%04x", buffer(76,2):le_uint()))				-- Number of RWw points to retain
		subtree:add(buffer(78, 2), string.format("rwrPoints         : 0x%04x", buffer(78,2):le_uint()))				-- Number of RWr points to retain
		subtree:add(buffer(80, 2), string.format("supportFunction   : 0x%04x", buffer(80,2):le_uint()))				-- Supported function
			subtree:add(buffer(80,2), string.format("        .... .... .... .%d.. Remote reset support(%s)", bit32.extract(buffer(80,2):le_uint(),2,1),
																										lookup(bit32.extract(buffer(80,2):le_uint(),2,1), supportFunctionTbl, "Unkown")))
			subtree:add(buffer(80,2), string.format("        .... .... .... ...%d SLMP support(%s)", bit32.extract(buffer(80,2):le_uint(),0,1),
																										"1:supported"))
	end
end


-- StatusRead(0E44)
function Slmp0E44(buffer, subcmd, subtree, isReq, isBin)
	-- Req
	if( isReq ) then
		-- Does not have request data.
	else
		local statusCodeTbl = {
			[0] = "Normal status",
		}
		
		-- Res
		if( isBin ) then
			-- Binary
			subtree:add(buffer(0,2), string.format("reserved2         : 0x%04X", buffer(0,2):le_uint()))	-- For future expansion (fixed to 1)
			subtree:add(buffer(2,2), string.format("statusCode        : %s (0x%04X) ", lookup(buffer(2,2):le_uint(), statusCodeTbl, "Abnormal status"),buffer(2,2):le_uint()))			-- Status code
		else
			-- ASCII
			subtree:add(buffer(0,4), string.format("reserved2         : 0x%04X", buffer(0,4):string()))	-- For future expansion (fixed to 1)
			subtree:add(buffer(4,4), string.format("statusCode        : %s (0x%04X) ", lookup(buffer(4,4):string(), statusCodeTbl, "Abnormal status"),buffer(4,4):string()))			-- Status code
		end
	end

end

-- CommunicationSettingGet(0E45)
function Slmp0E45(buffer, subcmd, subtree, isReq, isBin)
	local getTargetTbl = {
		[0] = "0:no acquisition target",
		[1] = "1:acquisition target"
	}
	
	if( isReq ) then
		-- Req
		if( isBin ) then
			-- Binary
			subtree:add(buffer(0,2), "getTarget            : "..buffer(0,2):le_uint())	-- Acquisition target
				subtree:add(buffer(0,2), string.format("        .... .... .... ..%d. Timeout value(%s)", bit32.extract(buffer(0,2):le_uint(),1,1),
																											lookup(bit32.extract(buffer(0,2):le_uint(),1,1), getTargetTbl, "Unkown")))
				subtree:add(buffer(0,2), string.format("        .... .... .... ...%d Communication port number(%s)", bit32.extract(buffer(0,2):le_uint(),0,1),
																											lookup(bit32.extract(buffer(0,2):le_uint(),0,1), getTargetTbl, "Unkown")))
		else
			-- ASCII
			subtree:add(buffer(0,4), "getTarget            : "..buffer(0,4):string())	-- Acquisition target
				subtree:add(buffer(0,4), string.format("        .... .... .... ..%d. Timeout value(%s)", bit32.extract(buffer(0,4):string(),1,1),
																											lookup(bit32.extract(buffer(0,4):string(),1,1), getTargetTbl, "Unkown")))
				subtree:add(buffer(0,4), string.format("        .... .... .... ...%d Communication port number(%s)", bit32.extract(buffer(0,4):string(),0,1),
																											lookup(bit32.extract(buffer(0,4):string(),0,1), getTargetTbl, "Unkown")))
		end
	else
		-- Res
		if( isBin ) then
			-- Binary
			subtree:add(buffer(0,2), string.format("getTarget            : 0x%02X", buffer(0,2):le_uint()))	-- Acquisition target
				subtree:add(buffer(0,2), string.format("        .... .... .... ..%d. Timeout value(%s)", bit32.extract(buffer(0,2):le_uint(),1,1),
																											lookup(bit32.extract(buffer(0,2):le_uint(),1,1), getTargetTbl, "Unkown")))
				subtree:add(buffer(0,2), string.format("        .... .... .... ...%d Communication port number(%s)", bit32.extract(buffer(0,2):le_uint(),0,1),
																											lookup(bit32.extract(buffer(0,2):le_uint(),0,1), getTargetTbl, "Unkown")))
			subtree:add(buffer(2,2), string.format("portNo               : 0x%04X", buffer(2,2):le_uint()))	-- Communication port number
			subtree:add(buffer(4,4), string.format("timeoutValue         : 0x%08X", buffer(4,4):le_uint()))	-- Timeout value
		else
			-- ASCII
			subtree:add(buffer(0,4), string.format("getTarget            : 0x%02X", buffer(0,4):string()))	-- Acquisition target
				subtree:add(buffer(0,4), string.format("        .... .... .... ..%d. Timeout value(%s)", bit32.extract(buffer(0,4):string(),1,1),
																											lookup(bit32.extract(buffer(0,4):string(),1,1), getTargetTbl, "Unkown")))
				subtree:add(buffer(0,4), string.format("        .... .... .... ...%d Communication port number(%s)", bit32.extract(buffer(0,4):string(),0,1),
																											lookup(bit32.extract(buffer(0,4):string(),0,1), getTargetTbl, "Unkown")))
			subtree:add(buffer(4,4), string.format("portNo               : 0x%04X", buffer(4,4):string()))	-- Communication port number
			subtree:add(buffer(8,8), string.format("timeoutValue         : 0x%08X", buffer(8,8):string()))	-- Timeout value
		end
	end
end

-- StatusRead2(0E53)
function Slmp0E53(buffer, subcmd, subtree, isReq, isBin)
	if( isReq ) then
		-- Req
		-- Does not have request data.
	else
		-- Res
		local serverStateTbl = {
			[0] = "Normal",
			[1] = "Abnormal"
		}
		
		local statusCodeTbl = {
			[0] = "Normal status",
		}
		
		if( isBin ) then
			-- Binary
			local ipAddrSize      = buffer(0,1)
			local offset_         = 0
			
			subtree:add(buffer(offset_,1), "unitIPAddrSize  : "..buffer(offset_,1):le_uint())							-- Size of IP addresses of the server and the other communication target unit
			offset_ = offset_ + 1
			if(ipAddrSize:uint() == 4) then
				subtree:add(buffer(offset_,ipAddrSize:uint()), string.format("serverIPAddr      : %s ",buf2ipaddr(buffer(offset_,ipAddrSize:uint()))))		-- Server IP address
			else
				subtree:add(buffer(offset_,ipAddrSize:uint()), string.format("serverIPAddr      : %s ",buf2ipv6addr(buffer(offset_,ipAddrSize:uint()))))		-- Server IP address
			end
			
			offset_ = offset_ + ipAddrSize:uint()
			if(ipAddrSize:uint() == 4) then
				subtree:add(buffer(offset_,ipAddrSize:uint()), string.format("targetUnitIPAddr  : %s",buf2ipaddr(buffer(offset_,ipAddrSize:uint()))))	-- IP address of other communication target unit
			else
				subtree:add(buffer(offset_,ipAddrSize:uint()), string.format("targetUnitIPAddr  : %s",buf2ipv6addr(buffer(offset_,ipAddrSize:uint()))))	-- IP address of other communication target unit
			end
			offset_ = offset_ + ipAddrSize:uint()
			subtree:add(buffer(offset_,1), string.format("serverState       : %s (0x%02X) ", lookup(buffer(offset_,1):le_uint(), serverStateTbl, "For future expansion"),buffer(offset_,1):le_uint()))		-- Operating state
			offset_ = offset_ + 1
			subtree:add(buffer(offset_,2), string.format("statusCode        : %s (0x%04X) ", lookup(buffer(offset_,2):le_uint(), statusCodeTbl, "Abnormal status"),buffer(offset_,2):le_uint()))			-- Status code
			offset_ = offset_ + 2
			subtree:add(buffer(offset_,2), string.format("reserved2         : 0x%04X", buffer(offset_,2):le_uint()))								-- For future expansion (fixed to 0)
			
		else
			-- ASCII
			local ipAddrSize      = buffer(0,2)
			local offset_         = 0
			
			subtree:add(buffer(offset_,2), "unitIPAddrSize  : "..buffer(offset_,2):string())							-- Size of IP addresses of the server and the other communication target unit
			offset_ = offset_ + 2
			if(ipAddrSize == 4) then
				subtree:add(buffer(offset_,ipAddrSize), string.format("serverIPAddr  : %s", buf2ipaddr(buffer(offset_,ipAddrSize):string())))			-- Server IP address
			else
				subtree:add(buffer(offset_,ipAddrSize), string.format("serverIPAddr  : %s", buf2ipv6addr(buffer(offset_,ipAddrSize):string())))			-- Server IP address
			end
			offset_ = offset_ + ipAddrSize
			if(ipAddrSize == 4) then
				subtree:add(buffer(offset_,ipAddrSize), string.format("targetUnitIPAddr  : %s", buf2ipaddr(buffer(offset_,ipAddrSize):string())))		-- IP address of other communication target unit
			else
				subtree:add(buffer(offset_,ipAddrSize), string.format("targetUnitIPAddr  : %s", buf2ipv6addr(buffer(offset_,ipAddrSize):string())))		-- IP address of other communication target unit
			end
			offset_ = offset_ + ipAddrSize
			subtree:add(buffer(offset_,1), string.format("serverState  : %s 0x%02X ", lookup(buffer(offset_,2):string(), serverStateTbl, "For future expansion"),buffer(offset_,2):string()))					-- Operating state
			offset_ = offset_ + 2
			subtree:add(buffer(offset_,4), "statusCode  : "..buffer(offset_,4):string())								-- Status code
			offset_ = offset_ + 4
			subtree:add(buffer(offset_,4), "reserved2  : "..buffer(offset_,4):string())									-- For future expansion (fixed to 0)
		end
	end
end

-- DataMonitoring(0E29)
function Slmp0E29(buffer, subcmd, subtree, isReq, isBin)
	if( isReq ) then
		-- Req
		local offset_         = 0
		
		subtree:add(buffer(0,2), string.format("reserved2            : 0x%04X", buffer(0,2):le_uint()))											-- For future expansion (fixed to 0x8000)
		subtree:add(buffer(2,2), string.format("monitorDataNum       : 0x%04X", buffer(2,2):le_uint()))											-- Number of monitoring data to acquire
		local monitorData_Num = buffer(2,2):le_uint()
		offset_  = 4
		
		local n
		for n = 1, monitorData_Num do
			local MonitoringDataID = buffer(offset_ , 2)
			subtree:add(MonitoringDataID,string.format("monitorDataID[%3d]   : 0x%04X", n , MonitoringDataID:le_uint() ))		-- Monitoring data ID
			offset_ = offset_ + 2
		end
		
	else
		-- Res
		local offset_         = 0
		
		subtree:add(buffer(0,2), string.format("reserved2           : 0x%04X", buffer(0,2):le_uint()))											-- For future expansion (fixed to 0x8000)
		subtree:add(buffer(2,2), string.format("monitorDataNum      : 0x%04X", buffer(2,2):le_uint()))											-- Number of monitoring data to acquire
		local monitorData_Num = buffer(2,2):le_uint()
		offset_  = 4
		
		local n
		for n = 1, monitorData_Num do
			local buf_monitor_data_size  = buffer(offset_ + 2 , 2)
			local buf_monitor_data       = buffer(offset_, 4 + buf_monitor_data_size:le_uint())
			local buf_monitor_data_id    = buf_monitor_data(0 , 2)
			local buf_monitor_data_value = buf_monitor_data(4 , buf_monitor_data_size:le_uint())
			
			monitortree = subtree:add(buf_monitor_data(), string.format("monitorData[%3d]      : 0x%s", n ,buf_monitor_data()))
			monitortree:add(buf_monitor_data_id, string.format("monitorDataID    : 0x%04X", buf_monitor_data_id:le_uint() ))				-- Monitoring data ID
			monitortree:add(buf_monitor_data_size, string.format("monitorDataSize  : 0x%04X", buf_monitor_data_size:le_uint() ))			-- Monitoring data size
			monitortree:add(buf_monitor_data_value, string.format("monitorDataValue : 0x%X", buf_monitor_data_value:le_uint() ))			-- Monitoring data value
			offset_ = offset_ + buf_monitor_data_size:le_uint() + 4
		end
		
	end
end

-- NodeIndication(3070)
function Slmp3070(buffer, subcmd, subtree, isReq, isBin)
	-- Req/Res
	local macaddr      = buffer(0,6)
	
	subtree:add(macaddr     ,"dstMacAddr             : "..buf2macaddr(macaddr(0,6)))		-- Request target MAC address
	
	if( isReq ) then
	-- Req
		local indicator_list = {
			[0] = "Display Finish",
			[1] = "Display Start",
		}
		local indicator    = buffer(6,2)
		subtree:add(indicator,"startStop              : " .. lookup(indicator:le_uint(), indicator_list, "unknown") )																												-- Indicator display instruction
	else
	-- Res
	end
end

-- NetworkConfig(0E90_xxxx)
function Slmp0E90(buffer, subcmd, subtree, isReq, isBin)
	if 		subcmd == "0000" then
		Slmp0E90_0000(buffer, subcmd, subtree, isReq, isBin)
	elseif	subcmd == "0001" then
		Slmp0E90_0001(buffer, subcmd, subtree, isReq, isBin)
	end
end

-- NetworkConfigMain(0E90_0000)
function Slmp0E90_0000(buffer, subcmd, subtree, isReq, isBin)
	local StrSingleSendFlagTbl = {
		[  0 ] = "false (All commands are sent)",					-- 0 = All commands are sent.
		[  1 ] = "true  (Only this command is independently sent)",	-- 1 = Only this command is independently sent.
	}
	
	local TimeMasterSlaveTbl = {
		[  0x00 ] = "TimeMaster",
		[  0x01 ] = "TimeSlave",
		[  0x02 ] = "TimeMaster(Grandmaster ID only)",
	}
	
	if( isReq ) then
	-- Req
		local single_send_flag    = buffer(  0, 1)
		local tslt_rate           = buffer(  1, 1)
		local master_info         = buffer(  2, 1)
		local detect_info         = buffer(  3, 1)
		local relay_config        = buffer(  4,12)
		local sync_device_num     = buffer( 16, 1)
		local no_send_interval    = buffer( 17, 1)
		local reserved_1          = buffer( 18, 1)
		local time_Master_Slave   = buffer( 19, 1)
		local gm_identity         = buffer( 20, 8)
		local sync_mode           = buffer( 28, 1)
		local sync_domain_no      = buffer( 29, 1)
		local sync_period_sync    = buffer( 30, 1)
		local sync_timeout_sync   = buffer( 31, 1)
		local sync_period_ann     = buffer( 32, 1)
		local sync_timeout_ann    = buffer( 33, 1)
		local sync_period_delay   = buffer( 34, 1)
		local sync_timeout_delay  = buffer( 35, 1)
		local sync_delay_mode     = buffer( 36, 3)
		local sync_unsync_count   = buffer( 39, 1)
		local sync_unsync_window  = buffer( 40, 4)
		local sync_master_time    = buffer( 44,10)
		local reserved_2          = buffer( 54, 2)
		local rx_mcast_group_num  = buffer( 56, 2)
		local reserved_3          = buffer( 58, 2)
--		local rx_mcast_group      = buffer( 60   )
		
		local StrSingleSendFlag = lookup(bit32.extract(single_send_flag:le_uint(),0,1),StrSingleSendFlagTbl,"Unknown")
		
		subtree:add(single_send_flag ,string.format("singleTransmit                   : %s",  StrSingleSendFlag     ))										-- Single transmission flag
		subtree:add(tslt_rate        ,string.format("timeslotMagnification            : %d",  tslt_rate:le_uint()   ))										-- Time width magnification setting of each timeslot
		subtree:add(master_info      ,"masterNodeSetting                :")																					-- Master station specific setting
		subtree:add(master_info      ,string.format("           %d%d%d%d %d%d%d.     Master Station Identifier number (%d)", 
																					bit32.extract( master_info:le_uint(),7,1),
																					bit32.extract( master_info:le_uint(),6,1),
																					bit32.extract( master_info:le_uint(),5,1),
																					bit32.extract( master_info:le_uint(),4,1),
																					bit32.extract( master_info:le_uint(),3,1),
																					bit32.extract( master_info:le_uint(),2,1),
																					bit32.extract( master_info:le_uint(),1,1),
																					bit32.extract( master_info:le_uint(),1,7) ))
		subtree:add(master_info      ,string.format("           .... ....%d    CC-Link IE Field network coexistence.",
																					bit32.extract( master_info:le_uint(),0,1) ))
		subtree:add(detect_info      ,"detectedTopology                 : ")																				-- Detection configuration information
		subtree:add(detect_info      ,string.format("           .... ....%d    Detection topology.",
																					bit32.extract( detect_info:le_uint(),0,1) ))
		local childtree = subtree:add(relay_config     ,"relaySetting                     : "..relay_config)												-- Relay setting
		local n,m
		for n = 0, 11 do
			for m = 0,  1 do
				local pos         = relay_config( n ,1) 
				local port_config = bit32.extract(pos:le_uint(),(4*m),4)
				local filter  = {	[0] = "disable filtering",
									[1] = "disable broadcast/multicast transmission",
									[2] = "disable relay other than the CC-Link IE field network frame",
									[3] = "not used"}
				local tmptree =  childtree:add(pos,string.format("         port[%2d]              : ",( 2*n + m + 1 ) ) .. port_config)
				tmptree:add(pos,string.format("                    %d... TS magnification setting"   ,bit32.extract(port_config,3,1) ) )
				tmptree:add(pos,string.format("                    .%d.. Loop port setting"       ,bit32.extract(port_config,2,1) ) )
				tmptree:add(pos,string.format("                    ..%d%d Filter setting(%s)"     ,bit32.extract(port_config,1,1),bit32.extract(port_config,0,1),filter[bit32.extract(port_config,0,2)]) )
			end
		end
		subtree:add(sync_device_num   ,string.format("generalTimeSyncDeviceNum         : %3d",       sync_device_num:le_uint()))							-- Number of general-purpose time synchronization devices
		subtree:add(no_send_interval  ,string.format("transmissionProhibitedTime       : %3d [us]",  no_send_interval:le_uint()))							-- Transmission prohibition time
		subtree:add(reserved_1        ,string.format("reserved                         : "..reserved_1))													-- For future expansion (fixed to 0)
		local TimeMasterSlaveSetting = lookup(bit32.extract(time_Master_Slave:le_uint(),0,1),TimeMasterSlaveTbl,"For future expansion")
		subtree:add(time_Master_Slave ,string.format("timeMasterSlave                  : %02x (%s)", time_Master_Slave:le_uint(), TimeMasterSlaveSetting))	-- Time Master / Time Slave setting
		subtree:add(gm_identity       ,              "grandMasterClockIdentity         : ".. gm_identity)													-- Grandmaster ID
		
		local synctree = subtree:add(buffer(28,26),"timeSynchronization              : ")
			synctree:add(sync_mode         ,string.format("timeSynchronizationMethod      : %4d",sync_mode:le_uint()))										-- time synchronization::Time synchronization method
			synctree:add(sync_domain_no    ,string.format("domainNo                       : %4d",sync_domain_no:le_uint()))									-- time synchronization::Domain number
			synctree:add(sync_period_sync  ,string.format("syncTransmitCycle              : %4d",sync_period_sync:le_int()))								-- time synchronization::Sync transmission cycle
			synctree:add(sync_timeout_sync ,string.format("syncReceiveTimeout             : %4d",sync_timeout_sync:le_uint()))								-- time synchronization::Sync receive timeout
			synctree:add(sync_period_ann   ,string.format("announceTransmitCycle          : %4d",sync_period_ann:le_int()))									-- time synchronization::Announce transmission cycle
			synctree:add(sync_timeout_ann  ,string.format("announceReceiveTimeout         : %4d",sync_timeout_ann:le_uint()))								-- time synchronization::Announce receive timeout
			synctree:add(sync_period_delay ,string.format("propagationDelayTransmitCycle  : %4d",sync_period_delay:le_int()))								-- time synchronization::Propagation delay transmission cycle
			synctree:add(sync_timeout_delay,string.format("delayRespTimer                 : %4d",sync_timeout_delay:le_uint()))								-- time synchronization::DelayResp receive monitoring timer
			local tmptree = synctree:add(sync_delay_mode ,"propagationDelayMeasureMethod  : ".. sync_delay_mode )											-- time synchronization::Propagation delay measurement method
			for n = 0,  2 do
			for m = 0,  7 do
				local pos         = sync_delay_mode( n ,1) 
				local port_config = bit32.extract(pos:le_uint(),m,1)
				local mechanism= {[0] = "DelayRequest Response", [1]="Peer Delay"}
				tmptree:add(pos,string.format("         port[%2d] : %s",( 8*n + m + 1 ) ,mechanism[port_config]) )
			end
			end
			synctree:add(sync_unsync_count ,string.format("thresholdOfConsecutiveOutliers : %5u",sync_unsync_count:le_uint()))								-- time synchronization::Threshold for the number of consecutive synchronization errors
			synctree:add(sync_unsync_window,string.format("windowSetting                  : %10u [ns]",sync_unsync_window:le_uint()))						-- time synchronization::Window setting
			synctree:add(sync_master_time  ,              "masterNodeTime                 : ".. time_to_calender_time(sync_master_time))					-- time synchronization::Management master time
			synctree:add(reserved_2      ,  string.format("reserved                       : " ..reserved_2 ))												-- For future expansion (fixed to 0)

		local rxmc_num = rx_mcast_group_num:le_uint()
		local rxmctree = subtree:add(rx_mcast_group_num,string.format("receiveMulticastGroupSetting     : %d",rxmc_num))									-- Number of receive multicast group settings
		subtree:add(reserved_3      ,string.format("reserved                         : " ..reserved_3 ))													-- For future expansion (fixed to 0)
		
		for n = 1, rxmc_num do
			local conf_n         = buffer( 60 + (n - 1) * 4 )
			local rx_mcast_group = conf_n( 0, 2)
			local reserved       = conf_n( 2, 2)
			rxmctree:add(conf_n        ,string.format(" receiveMulticastGroupSetting [%d]",n))
			rxmctree:add(rx_mcast_group,string.format(" receiveMulticastGroupSetting     : %04x",rx_mcast_group:le_uint()))									-- Receive multicast group setting
			rxmctree:add(reserved,string.format("reserved                          : %x",reserved:le_uint()))												-- For future expansion (fixed to 0)
		end
	else
	-- Res
		local result     = buffer(  0, 1)
		local reserved   = buffer(  1, 3)

		local StrResultTbl  = { [0] = "Matched", [1] = "Not Matched"}
		local StrResult     = StrResultTbl[bit32.extract(result:uint(),0,1)]
		subtree:add(result ,string.format ("networkConfigResult    : %s",  StrResult     ))																	-- Setting verification result
		subtree:add(reserved,string.format("reserved               : " ..reserved ))																		-- For future expansion (fixed to 0)

	end
end

-- NetworkConfigTslt(0E90_0001)
function Slmp0E90_0001(buffer, subcmd, subtree, isReq, isBin)
	local StrSingleSendFlagTbl = {
		[  0 ] = "false (All commands are sent)",					-- 0 = All commands are sent.
		[  1 ] = "true  (Only this command is independently sent)",	-- 1 = Only this command is independently sent.
	}
	
	if( isReq ) then
	-- Req
		local n
		local ofs                 = 0
		local single_send_flag    = buffer(      0, 1)
		local reserved_1          = buffer(      1, 3)
		local commu_cycle         = buffer(      4, 6)
		local tslt_num            = buffer(     10, 1)
		local reserved_2          = buffer(     11, 1)
		local tslt                = buffer(     12   )
--				:
		local StrSingleSendFlag = lookup(bit32.extract(single_send_flag:le_uint(),0,1),StrSingleSendFlagTbl,"Unknown")

		subtree:add(single_send_flag ,string.format("singleTransmit               : %s",  StrSingleSendFlag     ))												-- Single transmission flag
		subtree:add(reserved_1 	     ,string.format("reserved                     : " ..reserved_1 ))															-- For future expansion (fixed to 0)
		subtree:add(commu_cycle      ,string.format("communicationCycle           : %u.%09u",  commu_cycle(4,2):le_uint(),commu_cycle(0,4):le_uint() ))			-- Communication cycle
		subtree:add(tslt_num         ,string.format("timeslotNum                  : %u",  tslt_num:uint() ))													-- Number of timeslots
		subtree:add(reserved_2 	     ,string.format("reserved                     : " ..reserved_2 ))															-- For future expansion (fixed to 0)

		if tslt_num:uint() > 0 then
			for n = 1, tslt_num:uint() do
				function parse_tslt_n(buffer,subtree)
					local tslt_config = tslt( 0 ,16 )
					local start_offset         = tslt_config( 0, 6)
					local relay_disable        = tslt_config( 6, 1)
					local reserved_1           = tslt_config( 7, 1)
					local relay_disable_offset = tslt_config( 8, 6)
					local reserved_2           = tslt_config(14, 2)
					local summaryText = string.format("timeslotInfo [%d]             : ", n - 1)																		-- Timeslot information
					local conf_tree = subtree:add(tslt_config ,summaryText)
					conf_tree:add(start_offset , string.format("startOffset                : %5u.%09u",  start_offset(4,2):le_uint(),start_offset(0,4):le_uint() ))		-- Start offset
					conf_tree:add(relay_disable , string.format("relayBanUse                : "))																		-- Relay prohibition availability
		            local Str_relay_disable ={[0] = "Not Use",[1] = "Use"}
					local isBulk = bit32.extract(relay_disable:uint(),0,1)
					conf_tree:add(relay_disable ,string.format("    .... ...%d Relay Disable(%s)",isBulk,Str_relay_disable[isBulk]))
					conf_tree:add(reserved_1           , string.format("reserved                   : " ..reserved_1 ))																		-- For future expansion (fixed to 0)
					conf_tree:add(relay_disable_offset , string.format("relayBanOffset             : %5u.%09u",  relay_disable_offset(4,2):le_uint(),relay_disable_offset(0,4):le_uint() ))	-- Relay prohibition offset
					conf_tree:add(reserved_2 	   , string.format("reserved                   : " ..reserved_2 ))																			-- For future expansion (fixed to 0)
					return 16
				end
				local tslt_offset
				tslt_offset = parse_tslt_n(tslt,subtree)
				tslt = tslt(tslt_offset)
			end
		end
		
		ofs = 12 + (tslt_num:uint()*16)
		local port_num            = buffer( ofs+ 0, 1)
		local port_common_conf    = buffer( ofs+ 1, 1)
		local reserved            = buffer( ofs+ 2, 2)
		local port                = buffer( ofs+ 4  )

		subtree:add(port_num         ,string.format("portNum                      : %u",       port_num:uint()))												-- Number of ports
		subtree:add(port_common_conf ,string.format("portCommonSetting            : "))																			-- Port common setting
		local Str_port_common_conf={[0] = "Individual",[1] = "Same"}
		local isBulk = bit32.extract(port_common_conf:uint(),0,1)
		subtree:add(port_common_conf ,string.format("    .... ...%d portSetting(%s)",isBulk,Str_port_common_conf[isBulk]))
		subtree:add(reserved         ,string.format("Reserved                     : " ..reserved ))																-- For future expansion (fixed to 0)
		-- Port n
		local port_ofs = 0
		local n
		for n = 1, port_num:uint() do
			function parse_port_n(buffer,subtree)
				local offset = 0
				local m

				local eth_conf_num = buffer( offset, 1)
				local reserved_1   = buffer( offset+1, 3)
				local eth_len      = 4 + eth_conf_num:uint() * 4
				local eth_conf     = buffer( offset , eth_len)
				
				offset = eth_len
				local mac_conf_num = buffer( offset, 2)	
				local reserved_2   = buffer( offset+2, 2)
				local mac_len      = 4 + mac_conf_num:le_uint() * 8
				local mac_conf     = buffer( offset , mac_len)

				offset = eth_len + mac_len 
				local vln_conf_num = buffer( offset, 2)
				local reserved_3   = buffer( offset+2, 2)
				local vln_len      = 4 + vln_conf_num:le_uint() * 8
				local vln_conf     = buffer( offset , vln_len)
				
				local port_n_len     =  eth_len + mac_len + vln_len
				local port_n_tree    =  subtree:add(buffer(0,port_n_len),string.format("portSetting [%2d]             : ",n))									-- Port setting
				
				-- EtherTypeSetting
				local ethtree	   =  port_n_tree:add(eth_conf,string.format("etherTypeDeterminationSetting"))													-- EtherType
				ethtree:add(eth_conf_num ,string.format("determinationSettingNum  : %2u entries.",eth_conf_num:le_uint() ))										-- Number of settings determined by timeslot
				ethtree:add(reserved_1   ,string.format("reserved                 : " ..reserved_1))															-- For future expansion (fixed to 0)
				for m = 1, eth_conf_num:uint() do
					local eth_conf_n = eth_conf( 4 + (m-1)* 4 , 4)
					local entry_tree = ethtree:add(eth_conf_n , string.format("timeslotSetting %u",m))															-- Setting
					
					entry_tree:add(eth_conf_n( 0, 1 ) , string.format("determinationSetting   "))
					local eth_c = eth_conf_n( 0, 1)
					local Str_eth_c ={[0] = "Disable",[1] = "Enable"}
					local isBulk = bit32.extract(eth_c:uint(),0,1)
					entry_tree:add(eth_c , string.format("    .... ...%d (%s)",isBulk,Str_eth_c[isBulk]))														-- Determination setting
					
					entry_tree:add(eth_conf_n( 1, 1) , string.format("reserved               : %02x ", eth_conf_n( 1, 1):le_uint()))							-- For future expansion (fixed to 0)
					entry_tree:add(eth_conf_n( 2, 2) , string.format("etherType              : 0x%04X",  eth_conf_n( 2, 2):le_uint()))							-- EtherType value used for timeslot determination
				end
				
				-- DestMacAddressSetting
				local mactree	   =  port_n_tree:add(mac_conf,string.format("destMacAddrDeterminationSetting"))												-- Destination MAC address
				mactree:add(mac_conf_num     ,string.format("determinationSettingNum : %2u entries.",mac_conf_num:le_uint() ))									-- Number of settings determined by destination MAC address
				mactree:add(reserved_2   ,string.format("reserved                 : " ..reserved_2))															-- For future expansion (fixed to 0)
				for m = 1, mac_conf_num:le_uint() do
					local mac_conf_n = mac_conf( 4 + (m-1)* 8 , 8)
					local entry_tree = mactree:add(mac_conf_n , string.format("destMacAddrSetting %u", m))															-- Setting
					entry_tree:add(mac_conf_n( 0, 6) , string.format("destMacAddr    : %s",  buf2macaddr( mac_conf_n( 0, 6)) ))									-- Destination MAC address
					entry_tree:add(mac_conf_n( 6, 1) , string.format("timeslotNo    : %u",  mac_conf_n( 6, 1):uint()))											-- Timeslot number
					entry_tree:add(mac_conf_n( 7, 1) , string.format("receiveNecessity   : %u",  mac_conf_n( 7, 1):uint()))										-- Receive necessity
				end
				
				-- VLANSetting
				local vlntree	   =  port_n_tree:add(vln_conf,string.format("vlanDeterminationSetting"))														-- VLAN
				vlntree:add(vln_conf_num     ,string.format("determinationSettingNum  : %2u entries.",vln_conf_num:le_uint() ))									-- Number of settings determined by VLAN
				vlntree:add(reserved_3   ,string.format("reserved                 : " ..reserved_3 ))															-- For future expansion (fixed to 0)
				for m = 1, vln_conf_num:le_uint() do
					local vln_conf_n = vln_conf( 4 + (m-1)* 8 , 8)
					local entry_tree = vlntree:add(vln_conf_n , string.format("vlanSetting %u", m))																-- Setting
					if vln_conf_n( 0, 2):le_uint() ~= 0xffff then																								-- VID
						entry_tree:add(vln_conf_n( 0, 2) , string.format("vid                      : 0x%04x",bit32.extract(vln_conf_n(0,2):le_uint(),0,12)) )
					else
						entry_tree:add(vln_conf_n( 0, 2) , string.format("vid                      : -") )
					end
					if vln_conf_n( 2, 2):le_uint() ~= 0xffff then																								-- PCP
						entry_tree:add(vln_conf_n( 2, 2) , string.format("pcp                      : %u",bit32.extract(vln_conf_n(2,2):le_uint(),0, 3)) )
					else
						entry_tree:add(vln_conf_n( 2, 2) , string.format("pcp                      : -") )
					end
					entry_tree:add(vln_conf_n( 4, 1) , string.format("timeslotNo               : %u",  vln_conf_n( 4, 1):uint()))								-- Timeslot number
					entry_tree:add(vln_conf_n( 5, 3) , string.format("reserved                 : %u",  vln_conf_n( 5, 3):uint()))								-- For future expansion (fixed to 0)
				end
				return port_n_len
			end
			local port_len = parse_port_n(port,subtree)
			if n < port_num:uint() then
			  port = port(port_len)
			end
			if isBulk == 1 then
			  break
			end
		end
	else
	-- Res
		local result     = buffer(  0, 1)  -- Setting verification result
		local reserved   = buffer(  1, 3)  -- For future expansion (fixed to 0)

		local StrResultTbl  = { [0] = "Matched", [1] = "Not Matched"}
		local StrResult     = StrResultTbl[bit32.extract(result:uint(),0,1)]
		subtree:add(result ,string.format("networkConfigResult    : %s",  StrResult     ))
		subtree:add(reserved ,string.format("reserved               : " ..reserved ))
	end
end

-- MasterConfig(0E91)
function Slmp0E91(buffer, subcmd, subtree, isReq, isBin)
	
	if( isReq ) then
	-- Req
		local n
		local ofs                 = 0
		local station_num         = buffer(  0,  2)
		local reserved            = buffer(  2,  2)
		local station_data        = buffer(  4    )
		
		subtree:add(station_num ,string.format("detectedNodeNum : %u" , station_num:le_uint()))												-- Number of detected stations
		subtree:add(reserved ,string.format("reserved : ".. reserved ))																		-- For future expansion (fixed to 0)
		if station_num:le_uint() > 0 then
			local n
			local info_tree = subtree:add(station_data(0,station_num:le_uint()*72),string.format("detectedNodeInfo"))						-- Detected station information
			for n = 1, station_num:le_uint() do
				function parse_station_n(buffer,subtree)
					local info_config = buffer( 0 ,72 )
					local info_n_tree  = subtree:add(buffer,string.format("Node[%u]",n))
					
					info_n_tree:add(info_config( 0, 4),string.format("ipv4Addr         : %s" , buf2ipaddr(  info_config( 0, 4)) ))			-- IPv4 IP address
					info_n_tree:add(info_config( 4,16),string.format("ipv6Addr         : %s" , buf2ipv6addr(info_config( 4,16)) ))			-- IPv6 IP address
					info_n_tree:add(info_config(20, 6),string.format("macAddr          : %s" , buf2macaddr( info_config(20, 6)) ))			-- MAC address
					info_n_tree:add(info_config(26, 2),string.format("reserved : ".. info_config(26, 2) ))									-- For future expansion (fixed to 0)
					
					local gm_tree = info_n_tree:add(info_config(28,6),string.format("GrandMaster Priority"))
					local gm_p = info_config(28,6)
					gm_tree:add(gm_p(0, 1),string.format("grandmasterPriority1           : %0x", gm_p(0, 1):le_uint()     ))				-- Grandmaster priority (priority1)
					gm_tree:add(gm_p(1, 4),string.format("grandmasterClockQuality        : %0x", gm_p(1, 4):le_uint()     ))				-- Grandmaster priority (clockQuality)
					gm_tree:add(gm_p(5, 1),string.format("grandmasterPriority2           : %0x", gm_p(5, 1):le_uint()     ))				-- Grandmaster priority (priority2)
					
					info_n_tree:add(info_config(34, 1),string.format("nodeType           : %0x", info_config(34, 1):le_uint()     ))		-- Host station information
					info_n_tree:add(info_config(35, 1),string.format("syncType           : %0x", info_config(35, 1):le_uint()     ))		-- Time synchronization method
					
					local conf_tree = info_n_tree:add(info_config(36,36),string.format("Topology Info"))
					local conf = info_config(36,36)
					conf_tree:add(conf(0, 6), string.format("previousNodeMacAddr : %s" , buf2macaddr( conf(0, 6)) ))						-- MAC address of the last station that relayed Detection
					conf_tree:add(conf(6, 1), string.format("previousNodePort    : %0x", conf(6, 1):le_uint()     ))						-- Transmission port number of the last station that relayed Detection
					conf_tree:add(conf(7, 1), string.format("detectReceivePort   : %0x", conf(7, 1):le_uint() ))							-- Receive port number of the station that received Detection
					conf_tree:add(conf(8, 1), string.format("myPort              : %0x", conf(8, 1):le_uint()    ))							-- Port number occupied by host station
					conf_tree:add(conf(9,3) , string.format("reserved            : ") .. conf(9,3)                       )					-- For future expansion (fixed to 0)
					conf_tree:add(conf(12,12),string.format("myPortLinkStatus    : ") .. conf(12,12)           )							-- Link status of all ports occupied by host station
					conf_tree:add(conf(24,12),string.format("relayConfigStatus   : ") .. conf(24,12)              )							-- Filtering status of all ports occupied by host station
				end
			 parse_station_n(station_data((n-1)*72,72),info_tree)
			end
		end
	else
	-- Res
		local n
		local station_num         = buffer(  0,  2)
		local reserved            = buffer(  2,  2)
		local offset_

		station_num= buffer(  0, 2):le_uint()
		subtree:add(buffer(  0, 2), 	  "controlNodeNum            : "..station_num )										-- Number of stations target for control
		subtree:add(buffer(  2, 2), 	  "reserved                  : "..buffer(  2, 2) )									-- For future expansion (fixed to 0)
		offset_= 4
		for n =1, station_num do
			sta_tree = subtree:add(buffer( offset_ + 0, 20), 	  "controlNode ["..(n).."]" )								-- Station target for control
			
			sta_tree:add(buffer( offset_ +  0 ,  4),  "ipv4Addr          : "..buf2ipaddr(  buffer(offset_ +  0 ,  4) ))		-- IPv4 IP address
			sta_tree:add(buffer( offset_ +  4 , 16),  "ipv6Addr          : "..buf2ipv6addr(buffer(offset_ +  4 , 16) ))		-- IPv6 IP address
			offset_ = offset_ + 20
		end		
	end
end

-- SlaveConfig(0E92)
function Slmp0E92(buffer, subcmd, subtree, isReq, isBin)
	if( isReq ) then
	-- Req
		local station_mode        = buffer(  0,  2)
		local common_config       = buffer(  2,  1)
		local reserved            = buffer(  3,  1)
		local network_config={
			[0] = "disable network synchronization communication.",  [1] = "enable network synchronization communication",
		}
		subtree:add(station_mode ,string.format("stationMode              : %04x" , station_mode:le_uint()))																		-- Station mode
		subtree:add(common_config,string.format("slaveConfigCommonSetting :"))
		subtree:add(common_config,string.format(   "     .... ...%d  %s",bit32.extract(common_config:uint(),0,1),network_config[bit32.extract(common_config:uint(),0,1)]))			-- Common setting
		subtree:add(reserved,string.format("reserved                 : " ..reserved ))																								-- For future expansion (fixed to 0)

	else
	-- Res
		local unit_info           = buffer(  0, 60)
		local verification_result = buffer( 60,  1)
		local cerfitication_class = buffer( 61,  1)
		
		function parse_unit_info(buffer,subtree)
			local device_version               = buffer(  0, 2)
			local vendor_code                  = buffer(  2, 2)
			local model_code                   = buffer(  4, 4)
			local expansion_model_code         = buffer(  8, 2)
			local device_type                  = buffer( 10, 2)
			local memaddr_s2m_bit              = buffer( 12, 4)
			local memaddr_s2m_word             = buffer( 16, 4)
			local memaddr_s2m_safe             = buffer( 20, 4)
			local memaddr_m2s_bit              = buffer( 24, 4)
			local memaddr_m2s_word             = buffer( 28, 4)
			local memaddr_m2s_safe             = buffer( 32, 4)
			local memaddr_status               = buffer( 36, 4)
			local cycsize_s2m_bit              = buffer( 40, 2)
			local cycsize_s2m_word             = buffer( 42, 2)
			local cycsize_s2m_safe             = buffer( 44, 2)
			local cycsize_m2s_bit              = buffer( 46, 2)
			local cycsize_m2s_word             = buffer( 48, 2)
			local cycsize_m2s_safe             = buffer( 50, 2)
			local cycsize_status               = buffer( 52, 2)
			local verification_result_unitInfo = buffer( 54, 1)
			local reserved                     = buffer( 55, 1)
			local func                         = buffer( 56, 1)
			local option_info                  = buffer( 57, 1)
			local station_sub_id_number        = buffer( 58, 2)
			
			subtree:add(device_version       ,string.format("deviceVersion                  : 0x%04x" ,        device_version:le_uint()))							-- Machine version
			subtree:add(vendor_code          ,string.format("vendorCode                     : 0x%04x" ,           vendor_code:le_uint()))							-- Vendor code
			subtree:add(model_code           ,string.format("modelCode                      : 0x%08x" ,            model_code:le_uint()))							-- Model code
			subtree:add(expansion_model_code ,string.format("exModelCode                    : 0x%04x" ,  expansion_model_code:le_uint()))							-- Extension model code
			subtree:add(device_type          ,string.format("deviceType                     : 0x%04x" ,           device_type:le_uint()))							-- Model type
			subtree:add(memaddr_s2m_bit      ,string.format("bitMemoryAddrToMaster          : 0x%08x" ,       memaddr_s2m_bit:le_uint()))							-- Send (bit) memory address from slave station to master station
			subtree:add(memaddr_s2m_word     ,string.format("wordMemoryAddrToMaster         : 0x%08x" ,      memaddr_s2m_word:le_uint()))							-- Send (word) memory address from slave station to master station
			subtree:add(memaddr_s2m_safe     ,string.format("safetyMemoryAddrToMaster       : 0x%08x" ,      memaddr_s2m_safe:le_uint()))							-- Send (safety) memory address from slave station to master station
			subtree:add(memaddr_m2s_bit      ,string.format("bitMemoryAddrToSlave           : 0x%08x" ,       memaddr_m2s_bit:le_uint()))							-- Send (bit) memory address from master station to slave station
			subtree:add(memaddr_m2s_word     ,string.format("wordMemoryAddrToSlave          : 0x%08x" ,      memaddr_m2s_word:le_uint()))							-- Send (word) memory address from master station to slave station
			subtree:add(memaddr_m2s_safe     ,string.format("safetyMemoryAddrToSlave        : 0x%08x" ,      memaddr_m2s_safe:le_uint()))							-- Send (safety) memory address from master station to slave station
			subtree:add(memaddr_status       ,string.format("stateNotificationMemoryAddr    : 0x%08x" ,        memaddr_status:le_uint()))							-- Status notification device memory address
			subtree:add(cycsize_s2m_bit      ,string.format("bitDeviceCyclicSizeToMaster    : 0x%04x" ,       cycsize_s2m_bit:le_uint()))							-- Number of send cyclic points (bit device) from slave station to master station
			subtree:add(cycsize_s2m_word     ,string.format("wordDeviceCyclicSizeToMaster   : 0x%04x" ,      cycsize_s2m_word:le_uint()))							-- Number of send cyclic points (word device) from slave station to master station
			subtree:add(cycsize_s2m_safe     ,string.format("safetyDeviceCyclicSizeToMaster : 0x%04x" ,      cycsize_s2m_safe:le_uint()))							-- Number of send cyclic points (safety device) from slave station to master station
			subtree:add(cycsize_m2s_bit      ,string.format("bitDeviceCyclicSizeToSlave     : 0x%04x" ,       cycsize_m2s_bit:le_uint()))							-- Number of send cyclic points (bit device) from master station to slave station
			subtree:add(cycsize_m2s_word     ,string.format("wordDeviceCyclicSizeToSlave    : 0x%04x" ,      cycsize_m2s_word:le_uint()))							-- Number of send cyclic points (word device) from master station to slave station
			subtree:add(cycsize_m2s_safe     ,string.format("safetyDeviceCyclicSizeToSlave  : 0x%04x" ,      cycsize_m2s_safe:le_uint()))							-- Number of send cyclic points (safety device) from master station to slave station
			subtree:add(cycsize_status       ,string.format("stateNotificationCyclicSize    : 0x%04x" ,        cycsize_status:le_uint()))							-- Number of status notification device points (word device)
			subtree:add(cycsize_status       ,string.format("verificationResult             : %04x" , bit32.extract(verification_result_unitInfo:uint(),0,1)))		-- Setting verification result
			subtree:add(reserved             ,string.format("reserved                       : " ..reserved ))														-- For future expansion (fixed to 0)
			subtree:add(func                 ,string.format("function"                                                                          ))					-- Local function
			subtree:add(func                 ,string.format("          .%d.. ....  Network synchronization communication"            ,bit32.extract(func:le_uint(),6,1)))
			subtree:add(func                 ,string.format("          ..%d. ....  Relay filter setting"            ,bit32.extract(func:le_uint(),5,1)))
			subtree:add(func                 ,string.format("          ...%d ....  safety communication"            ,bit32.extract(func:le_uint(),4,1)))
			subtree:add(func                 ,string.format("          .... %d...  backup/restoration"             ,bit32.extract(func:le_uint(),3,1)))
			subtree:add(func                 ,string.format("          .... .%d..  watchdog counter"                  ,bit32.extract(func:le_uint(),2,1)))
			subtree:add(func                 ,string.format("          .... ..%d.  Setting overwriting"        ,bit32.extract(func:le_uint(),1,1)))
			subtree:add(func                 ,string.format("          .... ...%d  Local"                      ,bit32.extract(func:le_uint(),0,1)))
			subtree:add(option_info          ,string.format("optionInfo"                                                                       ))					-- Option information
			subtree:add(option_info          ,string.format("          .... ..%d.  option info valid"          ,bit32.extract(option_info:le_uint(),1,1)))
			subtree:add(option_info          ,string.format("          .... ...%d  controller info valid"      ,bit32.extract(option_info:le_uint(),0,1)))
			subtree:add(station_sub_id_number,string.format("stationSubIDNum                : 0x%04x" , station_sub_id_number:le_uint()))							-- Number of station sub IDs managed by host station

		end
		unit_tree = subtree:add(unit_info,"unitInfo")
		parse_unit_info(unit_info,unit_tree )
		
		local cerfitication_class_list = {
			[0] = "Class A" ,[1] = "Class B",
		}
		
		subtree:add(verification_result ,string.format("verificationResult               : %04x" , bit32.extract(verification_result:uint(),0,1)))														-- Setting verification result
		subtree:add(cerfitication_class ,string.format("certificationClass               : %s"   , lookup(cerfitication_class:uint(),cerfitication_class_list,"Reserved("..cerfitication_class..")")))	-- Certification class
		
	end
end

-- CyclicConfig(0E93)
function Slmp0E93(buffer, subcmd, subtree, isReq, isBin)
	if 		subcmd == "0000" then
		Slmp0E93_0000(buffer, subcmd, subtree, isReq, isBin)
	elseif	subcmd == "0001" then
		Slmp0E93_0001(buffer, subcmd, subtree, isReq, isBin)
	elseif	subcmd == "0002" then
		Slmp0E93_0002(buffer, subcmd, subtree, isReq, isBin)
	elseif	subcmd == "0003" then
		Slmp0E93_0003(buffer, subcmd, subtree, isReq, isBin)
	end
end

-- CyclicConfigMain(0E93_0000)
function Slmp0E93_0000(buffer, subcmd, subtree, isReq, isBin)
	local StrSingleSendFlagTbl = {
		[  0 ] = "false (All commands are sent)",					-- 0 = All commands are sent.
		[  1 ] = "true  (Only this command is independently sent)",	-- 1 = Only this command is independently sent.
	}
	
	if( isReq ) then
	-- Req
		local single_send_flag    = buffer(  0, 1)
		local send_tslt           = buffer(  1, 1)
		local reserved_1          = buffer(  2, 2)
		local common_config       = buffer(  4, 1)
		local datalink_interval   = buffer(  5, 1)
		local vlan_setting_select = buffer(  6, 1)
		local reserved_2          = buffer(  7, 1)
		local emg_group           = buffer(  8, 2)
		local gof_group           = buffer( 10, 1)
		local reserved_3          = buffer( 11, 1)

		local StrSingleSendFlag = lookup(bit32.extract(single_send_flag:le_uint(),0,1),StrSingleSendFlagTbl,"Unknown")
		
		subtree:add(single_send_flag ,string.format("singleTransmit         : %s",  StrSingleSendFlag     ))														-- Single transmission flag
		subtree:add(send_tslt        ,string.format("transmitTslt           : %u",  send_tslt:le_uint()   ))														-- Transmission timeslot
		subtree:add(reserved_1       ,string.format("reserved               : " ..reserved_1 ))																		-- For future expansion (fixed to 0)
		
		subtree:add(common_config    ,string.format("commonSetting          : ".. common_config))																	-- Common setting
		subtree:add(common_config    ,string.format("       .... %d...  Reserved station setting", bit32.extract(common_config:le_uint(), 3,1) ))
		subtree:add(common_config    ,string.format("       ...%d ....  Watchdog counter specification", bit32.extract(common_config:le_uint(), 4,1) ))
		subtree:add(common_config    ,string.format("       .%d.. ....  Station unit guarantee"         , bit32.extract(common_config:le_uint(), 6,1) ))
		subtree:add(common_config    ,string.format("       %d... ....  Cyclic communication availabilitye"  , bit32.extract(common_config:le_uint(), 7,1) ))
		subtree:add(datalink_interval,string.format("datalinkErrorCycle     : %u",  datalink_interval:le_uint()   ))												-- Data link error cycle setting
		if vlan_setting_select:le_uint() == 0 then
			subtree:add(vlan_setting_select,string.format("vLANSettingSelect      : VLAN invalid"))																	-- vLANSettingSelect
		else
			subtree:add(vlan_setting_select,string.format("vLANSettingSelect      : %u",  vlan_setting_select:le_uint()   ))											-- vLANSettingSelect
		end
		subtree:add(reserved_2       ,string.format("reserved               : " ..reserved_2 ))																		-- For future expansion (fixed to 0)
		subtree:add(emg_group        ,string.format("emgGroupSetting        : ".. emg_group))																		-- EMG group setting
		subtree:add(emg_group        ,string.format("       .... .... .... ...%d EMG group   1 ", bit32.extract(emg_group:le_uint(), 0,1) ))
		subtree:add(emg_group        ,string.format("       .... .... .... ..%d. EMG group   2 ", bit32.extract(emg_group:le_uint(), 1,1) ))
		subtree:add(emg_group        ,string.format("       .... .... .... .%d.. EMG group   3 ", bit32.extract(emg_group:le_uint(), 2,1) ))
		subtree:add(emg_group        ,string.format("       .... .... .... %d... EMG group   4 ", bit32.extract(emg_group:le_uint(), 3,1) ))
		subtree:add(emg_group        ,string.format("       .... .... ...%d .... EMG group   5 ", bit32.extract(emg_group:le_uint(), 4,1) ))
		subtree:add(emg_group        ,string.format("       .... .... ..%d. .... EMG group   6 ", bit32.extract(emg_group:le_uint(), 5,1) ))
		subtree:add(emg_group        ,string.format("       .... .... .%d.. .... EMG group   7 ", bit32.extract(emg_group:le_uint(), 6,1) ))
		subtree:add(emg_group        ,string.format("       .... .... %d... .... EMG group   8 ", bit32.extract(emg_group:le_uint(), 7,1) ))
		subtree:add(emg_group        ,string.format("       .... ...%d .... .... EMG group   9 ", bit32.extract(emg_group:le_uint(), 8,1) ))
		subtree:add(emg_group        ,string.format("       .... ..%d. .... .... EMG group  10 ", bit32.extract(emg_group:le_uint(), 9,1) ))
		subtree:add(emg_group        ,string.format("       .... .%d.. .... .... EMG group  11 ", bit32.extract(emg_group:le_uint(),10,1) ))
		subtree:add(emg_group        ,string.format("       .... %d... .... .... EMG group  12 ", bit32.extract(emg_group:le_uint(),11,1) ))
		subtree:add(emg_group        ,string.format("       ...%d .... .... .... EMG group  13 ", bit32.extract(emg_group:le_uint(),12,1) ))
		subtree:add(emg_group        ,string.format("       ..%d. .... .... .... EMG group  14 ", bit32.extract(emg_group:le_uint(),13,1) ))
		subtree:add(emg_group        ,string.format("       .%d.. .... .... .... EMG group  15 ", bit32.extract(emg_group:le_uint(),14,1) ))
		subtree:add(emg_group        ,string.format("       %d... .... .... .... EMG group  16 ", bit32.extract(emg_group:le_uint(),15,1) ))
		
		subtree:add(gof_group        ,string.format("gofGroupSetting        : ".. gof_group))																			-- GOF group setting
		subtree:add(gof_group        ,string.format("       .... ...%d GOF group   1 ", bit32.extract(gof_group:le_uint(), 0,1) ))
		subtree:add(gof_group        ,string.format("       .... ..%d. GOF group   2 ", bit32.extract(gof_group:le_uint(), 1,1) ))
		subtree:add(gof_group        ,string.format("       .... .%d.. GOF group   3 ", bit32.extract(gof_group:le_uint(), 2,1) ))
		subtree:add(gof_group        ,string.format("       .... %d... GOF group   4 ", bit32.extract(gof_group:le_uint(), 3,1) ))
		subtree:add(reserved_3       ,string.format("reserved               : " ..reserved_3 ))																			-- For future expansion (fixed to 0)
	else
	-- Res
		-- Does not have response data.
	end
end

-- CyclicConfigTrnSubPayload(0E93_0001)
function Slmp0E93_0001(buffer, subcmd, subtree, isReq, isBin)
	local StrSingleSendFlagTbl = {
		[  0 ] = "false (All commands are sent)",					-- 0 = All commands are sent.
		[  1 ] = "true  (Only this command is independently sent)",	-- 1 = Only this command is independently sent.
	}
	
	if( isReq ) then
	-- Req
		local EncapsulationTbl = {
			[  0 ] = "0: No encapsulation",					-- 0 = All commands are sent.
			[  1 ] = "1: Encapsulation",	-- 1 = Only this command is independently sent.
		}
		
		local CyclicIgnoreTbl = {
			[  0 ] = "0: Send by setting the cycle ignore bit to 0",
			[  1 ] = "1: Send by setting the cycle ignore bit to 1"
		}
		
		local DownPortSendTbl = {
			[  0 ] = "0: Sent to only the Up port",
			[  1 ] = "1: Sent from both Down port and Up port"
		}
		
		local single_send_flag    = buffer(  0, 1)
		local reserved            = buffer(  1, 1)
		local tx_subpayload_num   = buffer(  2, 2)

		local StrSingleSendFlag = lookup(bit32.extract(single_send_flag:le_uint(),0,1),StrSingleSendFlagTbl,"Unknown")

		subtree:add(single_send_flag  ,string.format("singleTransmit                : %s",  StrSingleSendFlag     ))																											-- Single transmission flag
		subtree:add(reserved  ,string.format("reserved                      : " ..reserved ))																																			-- For future expansion (fixed to 0)
		subtree:add(tx_subpayload_num ,string.format("transmitSubPayloadNum         : %u",  tx_subpayload_num:le_uint()     ))																								-- Number of send sub payloads
		
		if tx_subpayload_num:le_uint() > 0 then
			local n
			local tx_subpayload       = buffer(  4   )
			for n = 1, tx_subpayload_num:le_uint() do
				function parse_tx_subpayload(buffer,subtree)
					local payload_config      = buffer(  0, 1)
					local reserved_1          = buffer(  1, 1)
					local cyclic_send_timing  = buffer(  2, 2)
					local dst_mac_address     = buffer(  4, 6)
					local subpayload_dst3     = buffer( 10, 1)
					local subpayload_dst4     = buffer( 11, 1)
					local rx_memory_address   = buffer( 12, 4)
					local tx_memory_address   = buffer( 16, 4)
					local tx_data_length      = buffer( 20, 2)
					local reserved_2          = buffer( 22, 2)
					
					local subpayload_n_tree = subtree:add(buffer,string.format("transmitSubPayloadInfo [%d]",n))																										-- Send sub payload information
					
					subpayload_n_tree:add(payload_config    ,string.format("frameSubPayloadSetting      : "..payload_config))																								-- Frame/sub payload setting
					subpayload_n_tree:add(payload_config    ,string.format("       .... .%d.. Encapsulation(%s)" , bit32.extract(payload_config:le_uint(), 2,1),
																													lookup(bit32.extract(payload_config:le_uint(), 2,1),EncapsulationTbl,"Unknown")))
					subpayload_n_tree:add(payload_config    ,string.format("       .... %d... Cyclic Ignore(%s)" , bit32.extract(payload_config:le_uint(), 3,1),
																													lookup(bit32.extract(payload_config:le_uint(), 3,1),CyclicIgnoreTbl,"Unknown")))
					subpayload_n_tree:add(payload_config    ,string.format("       ...%d .... Down Port Send(%s)", bit32.extract(payload_config:le_uint(), 4,1),
																													lookup(bit32.extract(payload_config:le_uint(), 4,1),DownPortSendTbl,"Unknown")))
					subpayload_n_tree:add(reserved_1        ,string.format("reserved                    : " ..reserved_1 ))																											-- For future expansion (fixed to 0)
					subpayload_n_tree:add(cyclic_send_timing,string.format("transmitCycle               : %d/%d", bit32.extract(cyclic_send_timing:le_uint(), 8,8)+1, bit32.extract(cyclic_send_timing:le_uint(), 0,8)+1 ))	-- Transmission cycle
					subpayload_n_tree:add(dst_mac_address   ,string.format("frameDestination            : %s"     ,buf2macaddr(dst_mac_address)))																			-- Frame destination
					subpayload_n_tree:add(subpayload_dst3   ,string.format("subPayloadDestinationIPOct3 : %d", subpayload_dst3(0,1):uint()))																			-- Sub payload destination (3rd octet of destination IP address)
					subpayload_n_tree:add(subpayload_dst4   ,string.format("subPayloadDestinationIPOct4 : %d", subpayload_dst4(0,1):uint()))																			-- Sub payload destination (4th octet of destination IP address)
					subpayload_n_tree:add(rx_memory_address ,string.format("receiveMemoryAddr           : 0x%08x", rx_memory_address:le_uint()))																				-- Receive memory address
					subpayload_n_tree:add(tx_memory_address ,string.format("transmitDataAddr            : 0x%08x", tx_memory_address:le_uint()))																				-- Send data storage address
					subpayload_n_tree:add(tx_data_length    ,string.format("transmitDataSize            : 0x%04x", tx_data_length:le_uint()))																				-- Send data length
					subpayload_n_tree:add(reserved_2        ,string.format("reserved                    : " ..reserved_2 ))																												-- For future expansion (fixed to 0)
				
				end
				
				parse_tx_subpayload(tx_subpayload((n-1)*24,24),subtree)
			end
		end
		
	else
	-- Res
		-- Does not have response data.
	end
end

-- CyclicConfigRcvSubPayload(0E93_0002)
function Slmp0E93_0002(buffer, subcmd, subtree, isReq, isBin)
	local StrSingleSendFlagTbl = {
		[  0 ] = "false (All commands are sent)",					-- 0 = All commands are sent.
		[  1 ] = "true  (Only this command is independently sent)",	-- 1 = Only this command is independently sent.
	}
	if( isReq ) then
	-- Req
		local single_send_flag    = buffer(  0, 1)
		local reserved_1          = buffer(  1, 3)
		local rx_subpayload_num   = buffer(  4, 2)
		local common_config       = buffer(  6, 1)
		local reserved_2          = buffer(  7, 1)
		
		local StrSingleSendFlag = lookup(bit32.extract(single_send_flag:le_uint(),0,1),StrSingleSendFlagTbl,"Unknown")
		subtree:add(single_send_flag  ,string.format("singleTransmit         : %s",  StrSingleSendFlag     ))									-- Single transmission flag
		subtree:add(reserved_1        ,string.format("reserved               : " ..reserved_1 ))												-- For future expansion (fixed to 0)
		subtree:add(rx_subpayload_num ,string.format("receiveSubPayloadNum   : %u",  rx_subpayload_num:le_uint()     ))							-- Number of receive sub payloads
		subtree:add(common_config     ,string.format("commonSetting"))																			-- Common setting
		subtree:add(common_config     ,string.format("     .... ...%d  Rx Data Address Check",  bit32.extract(common_config:le_uint(),0,1)))
		subtree:add(reserved_2        ,string.format("reserved               : " ..reserved_2 ))												-- For future expansion (fixed to 0)
		
		if rx_subpayload_num:le_uint() > 0 then
			local n
			local rx_subpayload       = buffer(  8   )
			for n = 1, rx_subpayload_num:le_uint() do
				
				function parse_rx_subpayload(buffer,subtree)
					local rx_data_length      = buffer(  0, 2)
					local reserved            = buffer(  2, 2)
					local rx_memory_address   = buffer(  4, 4)
					
					local subpayload_n_tree = subtree:add(buffer,string.format("receiveSubPayloadInfo [%d]",n))									-- Receive sub payload information
					
					subpayload_n_tree:add(rx_data_length    ,string.format("receiveDataSize      : 0x%04x", rx_data_length:le_uint()))			-- Receive data length
					subpayload_n_tree:add(reserved          ,string.format("reserved             : " ..reserved))								-- For future expansion (fixed to 0)
					subpayload_n_tree:add(rx_memory_address ,string.format("receiveDataAddr      : 0x%08x", rx_memory_address:le_uint()))		-- Receive data storage address
					
				end
				
				parse_rx_subpayload(rx_subpayload((n-1)*8,8),subtree)
			end
		end
		
	else
	-- Res
		-- Does not have response data.
	end
end

-- CyclicConfigRcvSrcInfo(0E93_0003)
function Slmp0E93_0003(buffer, subcmd, subtree, isReq, isBin)
	local StrSingleSendFlagTbl = {
		[  0 ] = "false (All commands are sent)",					-- 0 = All commands are sent.
		[  1 ] = "true  (Only this command is independently sent)",	-- 1 = Only this command is independently sent.
	}
	if( isReq ) then
	-- Req
		local single_send_flag    = buffer(  0, 1)
		local reserved_1          = buffer(  1, 3)
		local rx_info_num         = buffer(  4, 2)
		local reserved_2          = buffer(  6, 2)

		local StrSingleSendFlag = lookup(bit32.extract(single_send_flag:le_uint(),0,1),StrSingleSendFlagTbl,"Unknown")
		subtree:add(single_send_flag  ,string.format("singleTransmit           : %s",  StrSingleSendFlag     ))				-- Single transmission flag
		subtree:add(reserved_1        ,string.format("reserved                 : " ..reserved_1))							-- For future expansion (fixed to 0)
		subtree:add(rx_info_num       ,string.format("receiveTargetInfoNum     : %u",  rx_info_num:le_uint()     ))			-- Number of receive target information
		subtree:add(reserved_2        ,string.format("reserved                 : " ..reserved_2))							-- For future expansion (fixed to 0)

		if rx_info_num:le_uint() > 0 then
			local n
			local rx_info       = buffer(  8   )
			for n = 1, rx_info_num:le_uint() do
				function parse_rx_info(buffer,subtree)
					local src_add3            = buffer(  0, 1)
					local src_add4            = buffer(  1, 1)
					local rx_timing           = buffer(  2, 2)
					local subpayload_config   = buffer(  4, 1)
					local reserved            = buffer(  5, 3)
					
					local info_n_tree = subtree:add(buffer,string.format("receiveTargetInfo [%d]",n))
					local frameType_list ={
						[0] = "Cyclic Ms/M",
						[1] = "Cyclic Ss/S",
						[2] = "Encapsulation",
					}
					info_n_tree:add(src_add3          ,string.format("receiveAddrIPOct3      : " ..src_add3(0,1):uint()))																-- Receive address (3rd octet of receive IP address)
					info_n_tree:add(src_add4          ,string.format("receiveAddrIPOct4      : " ..src_add4(0,1):uint()))																-- Receive address (4th octet of receive IP address)
					info_n_tree:add(rx_timing         ,string.format("receiveCycle  : %d/%d", bit32.extract(rx_timing:le_uint(), 8,8)+1, bit32.extract(rx_timing:le_uint(), 0,8)+1 ))	-- Frame/sub payload setting
					info_n_tree:add(subpayload_config ,string.format("frameSubPayloadSetting : "..subpayload_config))																	-- Frame/sub payload setting
					info_n_tree:add(subpayload_config ,string.format("        .... .%d%d%d  %s",bit32.extract(subpayload_config:uint(),2,1),bit32.extract(subpayload_config:uint(),1,1),bit32.extract(subpayload_config:uint(),0,1),lookup(subpayload_config:uint(),frameType_list,"unknown")))
					info_n_tree:add(reserved          ,string.format("reserved               : " ..reserved))																			-- For future expansion (fixed to 0)
				end
				
				parse_rx_info(rx_info((n-1)*8,8),subtree)
			end
		end
	else
	-- Res
	end
end

-- Notification(0E94)
function Slmp0E94(buffer, subcmd, subtree, isReq, isBin)
	local code       = buffer(0,2):le_uint()
	local notif_tree = subtree:add_le(Fs["slmp.b.notif.code"], buffer(0,2))
	
	if( code == 0x0100 ) then
		notif_tree:append_text(" [BMCA complete]")
		if( isReq ) then
			subtree:add(buffer(2,6),string.format("grandMasterMacAddr   : %s ", buf2macaddr(buffer(2,6))))
		else
			subtree:add(buffer(2,1)     ,string.format("grandMasterVerificationResult"))
			local gm_match = buffer(2,1)
			local Str_gm_match ={[0] = "Match",[1] = "Mismatch"}
			local isBulk = bit32.extract(gm_match:uint(),0,1)
		    subtree:add(gm_match     ,string.format("     .... ...%d  (%s)", isBulk,Str_gm_match[isBulk]))
			subtree:add(buffer(3,1),"reserved             : " .. buffer(3,1))
		end
	elseif( code == 0x0101 ) then
		notif_tree:append_text(" [Timesynchronization complete]")
		if( isReq ) then
			subtree:add(buffer(2,2),"reserved             : " .. buffer(2,2))
		else
			subtree:add(buffer(2,2),"reserved             : " .. buffer(2,2))
		end
	elseif( code == 0x0001 ) then
		notif_tree:append_text(" [Relay filter reset]")
		subtree:add(buffer(2),"reserved             : " .. buffer(2))
	elseif( code == 0x0200 ) then
		notif_tree:append_text(" [Detection station information]")
		subtree:add(buffer(2),"reserved             : " .. buffer(2))
	elseif( code == 0x0202 ) then
		notif_tree:append_text(" [Topology change]")
		subtree:add(buffer(2),"reserved             : " .. buffer(2))
	else
		subtree:add(buffer(2),"notificationData     : " ..buffer(2))
	end
end

-- CommunicationSpeed(3072)
function Slmp3072(buffer, subcmd, subtree, isReq, isBin)
	if( isReq ) then
	-- Req
		local commu_speed_list = {
			[0] = "Auto Negotiation",
			[1] = "100Mbps",
			[2] = "1Gbps",
		}
		local commu_speed = buffer(0,2)
		
		subtree:add(commu_speed,"communicationSpeed     : " .. lookup(commu_speed:le_uint(), commu_speed_list, "unknown") )					-- Communication speed
		
	else
	-- Res
	-- Does not have response data.
	end
end

-- FuncSettingInfoGet(3080)
function Slmp3080(buffer, subcmd, subtree, isReq, isBin)
	if( isReq ) then
	-- Req
	else
	-- Res
		local supportInfo                            = buffer(  0, 2)
		local supInf                            = buffer(  0, 2):le_uint()
		local suppsubtree = subtree:add(supportInfo ,string.format("supportInfo       : 0x%04x",buffer(0,2):le_uint())   )									-- supportInfo
		suppsubtree:add(supportInfo   ,string.format("       .... .... .... ...%d Communication speed setting ", bit32.extract(supportInfo:le_uint(), 0,1) ))
		suppsubtree:add(supportInfo   ,string.format("       .... .... .... ..%d. Certification class setting ", bit32.extract(supportInfo:le_uint(), 1,1) ))
		
		if (supInf == 3) then
		
		local communicationSpeedSupportInfo          = buffer(  2, 4)  -- communicationSpeedSupportInfo
		local certificationClassSupportInfo          = buffer(  6, 2)  -- certificationClassSupportInfo
		
		local commsubtree = subtree:add(communicationSpeedSupportInfo  ,string.format("communicationSpeedSupportInfo  : 0x%08x",buffer(  2, 4):le_uint() ))									-- communicationSpeedSupportInfo
		commsubtree:add(communicationSpeedSupportInfo   ,string.format("       .... .... .... .%d%d%d reserved ", bit32.extract(communicationSpeedSupportInfo:le_uint(), 2,1),
		bit32.extract(communicationSpeedSupportInfo:le_uint(), 1,1) ,bit32.extract(communicationSpeedSupportInfo:le_uint(), 0,1)  ))
		commsubtree:add(communicationSpeedSupportInfo   ,string.format("       .... .... .... %d... 100Mbps(full-duplex) ", bit32.extract(communicationSpeedSupportInfo:le_uint(), 3,1) ))
		commsubtree:add(communicationSpeedSupportInfo   ,string.format("       .... .... ...%d .... 100Mbps(half-duplex) ", bit32.extract(communicationSpeedSupportInfo:le_uint(), 4,1) ))
		commsubtree:add(communicationSpeedSupportInfo   ,string.format("       .... .... ..%d. ....   1Gbps(half-duplex) ", bit32.extract(communicationSpeedSupportInfo:le_uint(), 5,1) ))
		commsubtree:add(communicationSpeedSupportInfo   ,string.format("       .... .... .%d.. ....   1Gbps(full-duplex) ", bit32.extract(communicationSpeedSupportInfo:le_uint(), 6,1) ))
		commsubtree:add(communicationSpeedSupportInfo   ,string.format("       %d%d%d%d %d%d%d%d %d... .... reserved ", bit32.extract(communicationSpeedSupportInfo:le_uint(), 15,1),
		bit32.extract(communicationSpeedSupportInfo:le_uint(), 14,1) ,bit32.extract(communicationSpeedSupportInfo:le_uint(), 13,1),
		bit32.extract(communicationSpeedSupportInfo:le_uint(), 12,1) ,bit32.extract(communicationSpeedSupportInfo:le_uint(), 11,1),
		bit32.extract(communicationSpeedSupportInfo:le_uint(), 10,1) ,bit32.extract(communicationSpeedSupportInfo:le_uint(), 9,1),  
		bit32.extract(communicationSpeedSupportInfo:le_uint(), 8,1) ,bit32.extract(communicationSpeedSupportInfo:le_uint(), 7,1)))
				
		local certsubtree = subtree:add(certificationClassSupportInfo  ,string.format("certificationClassSupportInfo  : 0x%04x",buffer(  6, 2):le_uint() ))									-- certificationClassSupportInfo
		certsubtree:add(certificationClassSupportInfo   ,string.format("       .... .... .... ...%d Cetification classA(with the time synchronization function) ", bit32.extract(certificationClassSupportInfo:le_uint(), 0,1) ))
		certsubtree:add(certificationClassSupportInfo   ,string.format("       .... .... .... ..%d. Cetification classA(without the time synchronization function) ", bit32.extract(certificationClassSupportInfo:le_uint(), 1,1) ))
		certsubtree:add(certificationClassSupportInfo   ,string.format("       .... .... .... .%d.. Cetification classB ", bit32.extract(certificationClassSupportInfo:le_uint(), 2,1) ))
		certsubtree:add(certificationClassSupportInfo   ,string.format("       %d%d%d%d %d%d%d%d %d%d%d%d %d... reserved ", 
		bit32.extract(certificationClassSupportInfo:le_uint(), 15,1),bit32.extract(certificationClassSupportInfo:le_uint(), 14,1),
		bit32.extract(certificationClassSupportInfo:le_uint(), 13,1),bit32.extract(certificationClassSupportInfo:le_uint(), 12,1),
		bit32.extract(certificationClassSupportInfo:le_uint(), 11,1),bit32.extract(certificationClassSupportInfo:le_uint(), 10,1),
		bit32.extract(certificationClassSupportInfo:le_uint(), 9,1),bit32.extract(certificationClassSupportInfo:le_uint(), 8,1),
		bit32.extract(certificationClassSupportInfo:le_uint(), 7,1),bit32.extract(certificationClassSupportInfo:le_uint(), 6,1),
		bit32.extract(certificationClassSupportInfo:le_uint(), 5,1),bit32.extract(certificationClassSupportInfo:le_uint(), 4,1), 
		bit32.extract(certificationClassSupportInfo:le_uint(), 3,1) ))

		
		elseif (supInf == 2) then
		
		local certificationClassSupportInfo          = buffer(  2, 2)  -- certificationClassSupportInfo
		local certsubtree = subtree:add(certificationClassSupportInfo  ,string.format("certificationClassSupportInfo  : 0x%04x",buffer(  2, 2):le_uint() ))									-- certificationClassSupportInfo
		certsubtree:add(certificationClassSupportInfo   ,string.format("       .... .... .... ...%d Cetification classA(with the time synchronization function) ", bit32.extract(certificationClassSupportInfo:le_uint(), 0,1) ))
		certsubtree:add(certificationClassSupportInfo   ,string.format("       .... .... .... ..%d. Cetification classA(without the time synchronization function) ", bit32.extract(certificationClassSupportInfo:le_uint(), 1,1) ))
		certsubtree:add(certificationClassSupportInfo   ,string.format("       .... .... .... .%d.. Cetification classB ", bit32.extract(certificationClassSupportInfo:le_uint(), 2,1) ))
		certsubtree:add(certificationClassSupportInfo   ,string.format("       %d%d%d%d %d%d%d%d %d%d%d%d %d... reserved ", 
		bit32.extract(certificationClassSupportInfo:le_uint(), 15,1),bit32.extract(certificationClassSupportInfo:le_uint(), 14,1),
		bit32.extract(certificationClassSupportInfo:le_uint(), 13,1),bit32.extract(certificationClassSupportInfo:le_uint(), 12,1),
		bit32.extract(certificationClassSupportInfo:le_uint(), 11,1),bit32.extract(certificationClassSupportInfo:le_uint(), 10,1),
		bit32.extract(certificationClassSupportInfo:le_uint(), 9,1),bit32.extract(certificationClassSupportInfo:le_uint(), 8,1),
		bit32.extract(certificationClassSupportInfo:le_uint(), 7,1),bit32.extract(certificationClassSupportInfo:le_uint(), 6,1),
		bit32.extract(certificationClassSupportInfo:le_uint(), 5,1),bit32.extract(certificationClassSupportInfo:le_uint(), 4,1), 
		bit32.extract(certificationClassSupportInfo:le_uint(), 3,1) ))
						
		elseif (supInf == 1) then
		
		local communicationSpeedSupportInfo          = buffer(  2, 2)  -- communicationSpeedSupportInfo
		local commsubtree = subtree:add(communicationSpeedSupportInfo  ,string.format("communicationSpeedSupportInfo  : 0x%08x",buffer(  4, 2):le_uint() ))									-- communicationSpeedSupportInfo
		commsubtree:add(communicationSpeedSupportInfo   ,string.format("       .... .... .... .%d%d%d reserved ", bit32.extract(communicationSpeedSupportInfo:le_uint(), 2,1),
		bit32.extract(communicationSpeedSupportInfo:le_uint(), 1,1) ,bit32.extract(communicationSpeedSupportInfo:le_uint(), 0,1)  ))
		commsubtree:add(communicationSpeedSupportInfo   ,string.format("       .... .... .... %d... 100Mbps(full-duplex) ", bit32.extract(communicationSpeedSupportInfo:le_uint(), 3,1) ))
		commsubtree:add(communicationSpeedSupportInfo   ,string.format("       .... .... ...%d .... 100Mbps(half-duplex) ", bit32.extract(communicationSpeedSupportInfo:le_uint(), 4,1) ))
		commsubtree:add(communicationSpeedSupportInfo   ,string.format("       .... .... ..%d. ....   1Gbps(half-duplex) ", bit32.extract(communicationSpeedSupportInfo:le_uint(), 5,1) ))
		commsubtree:add(communicationSpeedSupportInfo   ,string.format("       .... .... .%d.. ....   1Gbps(full-duplex) ", bit32.extract(communicationSpeedSupportInfo:le_uint(), 6,1) ))
		commsubtree:add(communicationSpeedSupportInfo   ,string.format("       %d%d%d%d %d%d%d%d %d... .... reserved ", bit32.extract(communicationSpeedSupportInfo:le_uint(), 15,1),
		bit32.extract(communicationSpeedSupportInfo:le_uint(), 14,1) ,bit32.extract(communicationSpeedSupportInfo:le_uint(), 13,1),
		bit32.extract(communicationSpeedSupportInfo:le_uint(), 12,1) ,bit32.extract(communicationSpeedSupportInfo:le_uint(), 11,1),
		bit32.extract(communicationSpeedSupportInfo:le_uint(), 10,1) ,bit32.extract(communicationSpeedSupportInfo:le_uint(), 9,1),  
		bit32.extract(communicationSpeedSupportInfo:le_uint(), 8,1) ,bit32.extract(communicationSpeedSupportInfo:le_uint(), 7,1)))
		
		else
		 -- Does not have response data
		end
	end
end

-- FuncSettingRead(3081)
function Slmp3081(buffer, subcmd, subtree, isReq, isBin)
	if( isReq ) then
	-- Req
	else
	-- Res
		local readResult        = buffer(  0, 2)  -- readResult
		local readDataSize      = buffer(  2, 2)  -- readDataSize
		local readData          = buffer(  4, 2)  -- readData
		
		subtree:add(readResult     ,string.format("readResult             : 0x%04x",buffer(0,2):le_uint())   )									-- readResult
		subtree:add(readDataSize   ,string.format("readDataSize           : 0x%04x",buffer(2,2):le_uint())   )									-- readDataSize
		subtree:add(readData       ,string.format("readData               : 0x%04x",buffer(4,2):le_uint())   )									-- readData
	end
end

-- FuncSettingWrite(3082)
function Slmp3082(buffer, subcmd, subtree, isReq, isBin)
	if( isReq ) then
	-- Req
		local writeDataSize     = buffer(  0, 2)  -- writeDataSize
		local writeData         = buffer(  2, 2)  -- writeData
		
		subtree:add(writeDataSize     ,string.format("writeDataSize       : 0x%04x",buffer(0,2):le_uint())   )									-- writeDataSize
		subtree:add(writeData         ,string.format("writeData           : 0x%04x",buffer(2,2):le_uint())   )									-- writeData
		
	else
	-- Res
		local writeResult       = buffer(  0, 2)  -- writeResult
		
		subtree:add(writeResult     ,string.format("writeResult           : 0x%04x",buffer(0,2):le_uint())   )									-- writeResult
	end
end

-- GetCommunicationSet(0EB0)
function Slmp0EB0(buffer, subcmd, subtree, isReq, isBin)
	-- Req/Res
	local target = buffer(0,2):le_uint()
	
	subtree:add(buffer(0,2),string.format("getTarget                : 0x%04x",target))											-- Acquisition target
	subtree:add(buffer(0,2),string.format("      .... .... .... ...%d   portNo", bit32.extract(target,0,1)))
	subtree:add(buffer(0,2),string.format("      .... .... .... ..%d.   timeoutValue"            , bit32.extract(target,1,1)))
	
	if( isReq ) then
	-- Req
	else
	-- Res
		subtree:add(buffer(2,2),string.format("portNo                   : 0x%04x", buffer(2,2):le_uint()))		-- Communication port number
		subtree:add(buffer(4,4),string.format("timeoutValue             : 0x%04x", buffer(4,4):le_uint()))		-- Timeout value
	end
end

-- GetDeviceInfo(0EB2)
function Slmp0EB2(buffer, subcmd, subtree, isReq, isBin)
	
	local StationSubID_Num     = buffer(2,2):le_uint()  -- Number of stored station sub IDs
	
	-- Req/Res
	subtree:add(buffer(0,2)   ,string.format("getInfoTarget       : 0x%04x",buffer(0,2):le_uint())   )									-- Acquisition target information
	subtree:add(buffer(2,2)   ,string.format("stationSubIDNum     : 0x%04x",  buffer(2,2):le_uint()     ))									-- Number of acquisitions
	
	if( isReq ) then
	-- Req
		local n
		for n = 1, StationSubID_Num do
			local StationSubID = buffer( 4 + (n-1) * 2, 2 )
			subtree:add(StationSubID,string.format  ("stationSubID[%3d]   : 0x%04x", n , StationSubID:le_uint() ))							-- Station sub ID
		end
	else
	-- Res
		local n
		for n = 1, StationSubID_Num do
			local info         = buffer( 4 + (n-1)*14,14 )
			local StationSubID = info(  0 , 2 )		-- Station sub ID
			local MakerCode    = info(  2 , 2 )		-- Vendor code
			local TypeCode     = info(  4 , 2 )		-- Model code
			local DeviceVersion= info(  6 , 4 )		-- Device version
			local SupportFunc  = info( 10 , 2 )		-- Support function
			local DataSize     = info( 12 , 2 )		-- Parameter data size
			local info_tree    = subtree:add(info,string.format("stationSubIDInfo[%3d] 0x%04X", n , StationSubID:le_uint() ))
			info_tree:add(StationSubID ,string.format("stationSubID          : 0x%04x",  StationSubID:le_uint() ))	-- Station sub ID
			info_tree:add(MakerCode    ,string.format("vendorCode            : 0x%04x",     MakerCode:le_uint() ))	-- Vendor code
			info_tree:add(TypeCode     ,string.format("modelCode             : 0x%04x",      TypeCode:le_uint() ))	-- Model code
			info_tree:add(DeviceVersion,string.format("deviceVersion         : 0x%04x", DeviceVersion:le_uint() ))	-- Device version
			info_tree:add(SupportFunc  ,string.format("deviceSupportFunction : 0x%04x",   SupportFunc:le_uint() ))	-- Support function
			info_tree:add(SupportFunc  ,string.format("      .... .... .... ...%d   Backup/restoration", bit32.extract(SupportFunc:le_uint(),0,1) ))
			info_tree:add(DataSize     ,string.format("parameterDataSize     : 0x%04x",      DataSize:le_uint() ))	-- Parameter data size
		end
	end
end

-- EndBackup(0EB4)
function Slmp0EB4(buffer, subcmd, subtree, isReq, isBin)
	if( isReq ) then
	-- Req
		if( subcmd == "0001" ) then
			local backupResult = buffer(0,2)
			
			if( backupResult == nil ) then
				-- Does not have response data.
			else
				subtree:add_le(buffer(0,2),"backupResult : " .. buffer(0,2))		-- Backup result
			end
		else
			-- Does not have response data.
		end
		
	else
	-- Res
		-- Does not have response data.
	end
end

-- RequestBackup(0EB5)
function Slmp0EB5(buffer, subcmd, subtree, isReq, isBin)
	if( isReq ) then
	-- Req
		local buf_offset = buffer(0,2)
		local buf_num    = buffer(2,2)
		subtree:add(buf_offset,string.format("stationSubIDOffset             : 0x%04x",  buf_offset:le_uint()     ))					-- Station sub ID offset
		subtree:add(buf_num   ,string.format("stationSubIDNum                : 0x%04x",  buf_num:le_uint()     ))						-- Number of stored station sub IDs
	
		if buf_num:le_uint() > 0 then
			local n
			local subIDs = subtree:add(buffer( 4 , buf_num:le_uint()*2),"Station Sub ID ")
			
			for n = 1, buf_num:le_uint() do
				local buf_station_sub_id_n = buffer( 4 + (n-1)*2 , 2)
				subIDs:add(buf_station_sub_id_n,string.format("stationSubID [%u]: 0x%04x",  n, buf_station_sub_id_n:le_uint()     ))	-- Station sub ID
			end
		end
	else
	-- Res
		-- Does not have response data.
	end
end

-- GetBackupPrm(0EB6)
function Slmp0EB6(buffer, subcmd, subtree, isReq, isBin)

	-- Req/Res

	local buf_sub_id = buffer(0,2)
	local buf_offset = buffer(2,2)
	local buf_size   = buffer(4,2)
	
	subtree:add(buf_sub_id ,string.format("stationSubID             : 0x%04X",  buf_sub_id:le_uint()     ))			-- Station sub ID
	subtree:add(buf_offset ,string.format("parameterOffset          : 0x%04X",  buf_offset:le_uint()     ))			-- Offset
	subtree:add(buf_size   ,string.format("parameterDataSize        : 0x%04X",  buf_size:le_uint()       ))			-- Data size

	if( isReq ) then
	-- Req
		-- Does not have specific information.
	else
	-- Res
		local buf_param   = buffer(6,buf_size:le_uint())
		subtree:add(buf_param  ,string.format("parameter         : ")..buf_param)								-- Parameter
	end
end

-- StartRestore(0EB8)
function Slmp0EB8(buffer, subcmd, subtree, isReq, isBin)
	if( isReq ) then
	-- Req
		-- Does not have request data.
	else
	-- Res
		-- Does not have response data.
	end
end

-- EndRestore(0EB9)
function Slmp0EB9(buffer, subcmd, subtree, isReq, isBin)
	if( isReq ) then
	-- Req
		-- Does not have request data.
	else
	-- Res
		-- Does not have response data.
	end
end

-- SetBackupPrm(0EBA)
function Slmp0EBA(buffer, subcmd, subtree, isReq, isBin)
	if( isReq ) then
	-- Req

		local buf_sub_id = buffer(0,2)
		local buf_offset = buffer(2,2)
		local buf_size   = buffer(4,2)
		local buf_param  = buffer(6,buf_size:le_uint())
		
		subtree:add(buf_sub_id ,string.format("stationSubID               : 0x%04x",  buf_sub_id:le_uint()     ))			-- Station sub ID
		subtree:add(buf_offset ,string.format("parameterOffset            : 0x%04x",  buf_offset:le_uint()     ))			-- Offset
		subtree:add(buf_size   ,string.format("parameterDataSize          : 0x%04x",  buf_size:le_uint()       ))			-- Data size
		subtree:add(buf_param  ,string.format("parameter                  : ")..buf_param)								-- Parameter
	else
	-- Res
		-- Does not have response data.
	end
end

-- CheckPrmDelivery(0EBE)
function Slmp0EBE(buffer, subcmd, subtree, isReq, isBin)
	if( isReq ) then
	-- Req
		local buf_num    = buffer(0,2)
		subtree:add(buf_num, "stationSubIDInfoNum: "..buf_num:le_uint())													-- Number of station sub ID information
		
		if buf_num:le_uint() > 0 then
			local n
			
			for n = 1 , buf_num:le_uint() do
				local buf_subid       = buffer( 2+ (n-1)*64 , 64 )
				local buf_head_ver    = buf_subid(  0,  1)
				local reserved1       = buf_subid(  1,  1)
				local buf_vendor_code = buf_subid(  2,  2)
				local buf_model_code  = buf_subid(  4,  4)
				local reserved2       = buf_subid(  8,  2)
				local buf_device_ver  = buf_subid( 10,  2)
				local buf_mode_info   = buf_subid( 12,  2)
				local reserved3       = buf_subid( 14,  2)
				local buf_ipv4        = buf_subid( 16,  4)
				local reserved4       = buf_subid( 20, 12)
				local buf_sta_no      = buf_subid( 32,  2)
				local buf_sta_subid   = buf_subid( 34,  2)
				local reserved5       = buf_subid( 36,  8)
				local buf_param_crc   = buf_subid( 44,  4)
				local buf_param_id    = buf_subid( 48, 16)
				
				local tree_subid = subtree:add(buf_subid,string.format("stationSubIDInfo[%d]",n))
				tree_subid:add(buf_head_ver    , string.format("headerVersion  : %02x",    buf_head_ver:le_uint()) )		-- Header version
				tree_subid:add(reserved1       , string.format("reserved       : %02x",    reserved1:le_uint()) )			-- For future expansion
				tree_subid:add(buf_vendor_code , string.format("vendorCode     : %04x", buf_vendor_code:le_uint()) )		-- Vendor code
				tree_subid:add(buf_model_code  , string.format("modelCode      : %08x",  buf_model_code:le_uint()) )		-- Model code
				tree_subid:add(reserved2       , string.format("reserved       : %04x",    reserved2:le_uint()) )			-- For future expansion
				tree_subid:add(buf_device_ver  , string.format("deviceVersion  : %04x",  buf_device_ver:le_uint()) )		-- Model code
				tree_subid:add(buf_mode_info   , string.format("modeInfo       : %04x",   buf_mode_info:le_uint()) )		-- Device version
				tree_subid:add(reserved3       , string.format("reserved       : %04x",    reserved3:le_uint()) )			-- For future expansion
				tree_subid:add(buf_ipv4        , string.format("ipv4Addr       : %s",   buf2ipaddr(buf_ipv4)     ) )		-- IPv4 IP address
				tree_subid:add(reserved4       , string.format("reserved       : "    ..reserved4) )						-- For future expansion
				tree_subid:add(buf_sta_no      , string.format("nodeNo         : %04x",      buf_sta_no:le_uint()) )		-- Station number
				tree_subid:add(buf_sta_subid   , string.format("stationSubID   : %04x",   buf_sta_subid:le_uint()) )		-- Station sub ID
				tree_subid:add(reserved5       , string.format("reserved       : "    ..reserved5) )						-- For future expansion
				tree_subid:add(buf_param_crc   , string.format("parameterCrc   : %08x",   buf_param_crc:le_uint()) )		-- Parameter CRC
				tree_subid:add(buf_param_id    , string.format("parameterID    : ") ..    buf_param_id             )		-- Parameter identification value
			end
		end
	else
	-- Res
		local buf_num    = buffer(0,2)
		subtree:add(buf_num, "judgeResultInfoNum : "..buf_num:le_uint())					-- Number of judgment results
		
		if buf_num:le_uint() > 0 then
			local n
			local tree_res  = subtree:add(buffer( 2 , buf_num:le_uint() * 4 ),"Station Sub ID(s)")
			
			for n = 1 , buf_num:le_uint() do
				local buf_subid       = buffer( 2+ (n-1)*4 , 4 )
				local buf_sta_subid   = buf_subid(  0,  2)
				local buf_result      = buf_subid(  2,  2)
				local judgement_result_list = {
					[0x0000] = "Normal (hereafter, restore processing is required)",
					[0x0001] = "Normal (hereafter, restore processing is not required))",
				}
				local judgement_result = lookup(buf_result:le_uint(), judgement_result_list,string.format("Error (ErrorCode = 0x%04x)",buf_result:le_uint()))
				local tree_subid = tree_res:add(buf_subid,string.format("judgeResultInfo [%d] SubID= %04x, %s",n,buf_sta_subid:le_uint(),judgement_result))
				tree_subid:add(buf_sta_subid , string.format("stationSubID: %04x",     buf_sta_subid:le_uint()                 ) )								-- Station sub ID
				tree_subid:add(buf_result    , string.format("judgeResult: %04x [%s]",buf_result:le_uint(),   judgement_result) )								-- Judgment result
			end
		end
	end
end

-- ClearEventHistory(161A)
function Slmp161A(buffer, subcmd, subtree, isReq, isBin)
	if( isReq ) then
	-- Req
		-- Does not have request data.
	else
	-- Res
		-- Does not have response data.
	end
end

-- GetEventNum(3060)
function Slmp3060(buffer, subcmd, subtree, isReq, isBin)
	if( isReq ) then
	-- Req
		local buf_event_history_kind = buffer( 0, 2)
		subtree:add(buf_event_history_kind, string.format("eventType              : %04x",buf_event_history_kind:le_uint()))		-- Event history type
	else
	-- Res
		local buf_event_history_num = buffer( 0, 2)
		local buf_latest_history_no = buffer( 2, 4)
		subtree:add(buf_event_history_num, string.format("eventNum               : %04x",buf_event_history_num:le_uint()))			-- Number of event histories
		subtree:add(buf_latest_history_no, string.format("latestEventNo          : %08x",buf_latest_history_no:le_uint()))			-- Latest event number
	end
end

-- GetEventHistory(3061)
function Slmp3061(buffer, subcmd, subtree, isReq, isBin)
	if( isReq ) then
	-- Req
		local buf_event_history_kind = buffer( 0, 2)
		local buf_start_history_no   = buffer( 2, 4)
		local buf_event_history_num  = buffer( 6, 1)

		subtree:add(buf_event_history_kind, string.format("eventType              : %04x",buf_event_history_kind:le_uint()))								-- Event history type
		subtree:add(buf_start_history_no  , string.format("getStartEventNo        : %08x",buf_start_history_no:le_uint()))								-- Event history number at acquisition start
		subtree:add(buf_event_history_num , string.format("getEventNum            : %u",buf_event_history_num:le_uint()))									-- Number of acquired event histories
	else
	-- Res
		local buf_event_history_num  = buffer( 0, 1)
		subtree:add(buf_event_history_num , string.format("getEventNum            : %u",buf_event_history_num:le_uint()))											-- Number of acquired event histories
		
		if buf_event_history_num:le_uint() > 0 then
			local n
			local tree_history  = subtree:add(buffer( 2 ),"eventInfo")
			
			local offset = 2
			for n = 1 , buf_event_history_num:le_uint() do
				local buf_event_history   = buffer( offset     ,  buffer( offset + 0 , 4 ):le_uint() )
				
				local buf_history_size    = buf_event_history(  0,  4 )
				local buf_history_no      = buf_event_history(  4,  4 )
				local buf_event_code      = buf_event_history(  8,  2 )
				local buf_time            = buf_event_history( 12, 16 )
				local buf_time_seconds    = buf_event_history( 12,  8 )
				local buf_time_nanoseconds= buf_event_history( 20,  4 )
				local buf_utc_offset      = buf_event_history( 24,  2 )
				local buf_summer_offset   = buf_event_history( 26,  2 )
				local buf_detail_num      = buf_event_history( 28,  2 )
				local buf_detail_info     = buf_event_history( 30,  buf_detail_num:le_uint() * 2 )
				
				local cumulative_seconds
				
				cumulative_seconds = buf_time_seconds(0,4):le_uint() 
				if ( buf_utc_offset:le_int() ~= 0x8000 ) then
					cumulative_seconds = cumulative_seconds + buf_utc_offset:le_int()    * 60
				end
				if ( buf_summer_offset:le_int() ~= 0x8000 ) then
					cumulative_seconds = cumulative_seconds + buf_summer_offset:le_int() * 60
				end
				local calc_time  = time_to_calender_time2(cumulative_seconds,buf_time_nanoseconds:le_uint())
				local tree_event = tree_history:add(buf_event_history,string.format("[%d] Time= %-20s, Event No.= %u",n,calc_time,buf_history_no:le_uint()) )
				
				tree_event:add(buf_history_size , string.format("eventSize            : %04x", buf_history_size:le_uint()   ) )							-- Event history information size (byte)
				tree_event:add(buf_history_no , string.format("eventNo              : %08x", buf_history_no:le_uint()     ) )							-- Event history number
				tree_event:add(buf_event_code , string.format("eventCode            : %04x", buf_event_code:le_uint()     ) )							-- Event code
				local tree_time = tree_event:add(buf_time, string.format("occurEpocTime        : %s",calc_time))										-- Occurrence time
					tree_time:add(buf_time_nanoseconds, string.format("occurEpocTimeNsec    : %10u", buf_time_nanoseconds:le_uint()) )					-- Occurrence time (Epoch time: nanoseconds)
					tree_time:add(buf_utc_offset , string.format("utcOffsetMin         : %+6d [minute]",buf_utc_offset:le_int()    ) )					-- UTC offset (minutes)
					tree_time:add(buf_summer_offset , string.format("summerTimeOffsetMin  : %+6d [minute]",buf_summer_offset:le_int() ) )				-- Daylight-saving time offset (minutes)
				
				tree_event:add(buf_detail_num      , string.format("detailInfoNum : %2u", buf_detail_num:le_uint()     ) )
				local m
				for m = 1 , buf_detail_num:le_uint() do
					tree_event:add(buf_detail_info( (m-1)*2, 2 )    , 	string.format("detailInfo[%2u]     : %04x", m, buf_detail_info:le_uint()   ) )	-- Detailed information n
				end
				offset = offset + buffer( offset + 0 , 4 ):le_uint()
			end
		end
		
	end
end

-- ClockOffsetDataSend(3062)
function Slmp3062(buffer, subcmd, subtree, isReq, isBin)
	if( isReq ) then
	-- Req
		local buf_offset_seconds      = buffer(  0,  6 )
		local buf_offset_nanoseconds  = buffer(  6,  4 )
		local buf_utc_offset          = buffer( 10,  2 )
		local buf_summer_offset       = buffer( 12,  2 )
		
		if (buf_offset_seconds(4,2):le_uint() == 0x0000 ) then
			subtree:add(buf_offset_seconds,    string.format("offsetSec            : +%u",buf_offset_seconds(0,4):le_uint()))			-- Offset (seconds)
		elseif (buf_offset_seconds(4,2):le_uint() == 0xffff ) then
			subtree:add(buf_offset_seconds,    string.format("offsetSec            : %+d",buf_offset_seconds(0,4):le_int()))			-- Offset (seconds)
		else
			subtree:add(buf_offset_seconds,    string.format("offsetSec            : %s",buf_offset_seconds))							-- Offset (seconds)
		end
		subtree:add(buf_offset_nanoseconds,string.format("offsetNsec           : %+d",buf_offset_nanoseconds:le_int()))				-- Offset (nanoseconds)
		if(buf_utc_offset:le_uint() == 0x8000) then
			subtree:add(buf_utc_offset        ,string.format("utcOffsetMin         : No UTC offset setting (0x8000) "   ) )		-- UTC offset (minutes)
		else
			subtree:add(buf_utc_offset        ,string.format("utcOffsetMin         : %+6d [minute]",buf_utc_offset:le_int()    ) )		-- UTC offset (minutes)
		end
		if(buf_summer_offset:le_uint() == 0x8000) then
			subtree:add(buf_summer_offset     ,string.format("summerTimeOffsetMin  : No daylight-saving time offset setting (0x8000)"    ) )		-- Daylight-saving time offset (minutes)
		else
			subtree:add(buf_summer_offset     ,string.format("summerTimeOffsetMin  : %+6d [minute]",buf_summer_offset:le_int()) )		-- Daylight-saving time offset (minutes)
		end
		
	else
	-- Res
		-- Does not have response data.
	end
end

-- NetworkClockDataSend(3063)
function Slmp3063(buffer, subcmd, subtree, isReq, isBin)
	if( isReq ) then
	-- Req
		local nwtworkTime      = buffer(  0,  10 )
		
		subtree:add(nwtworkTime  ,              "nwtworkTime         : ".. time_to_calender_time(nwtworkTime))					-- time synchronization::Management master time

	else
	-- Res
		-- Does not have response data.
	end
end

-- StopOwnStationCyclic(3206)
function Slmp3206(buffer, subcmd, subtree, isReq, isBin)
	-- Req
	if( isReq ) then
		-- Does not have request data
	else
	-- Res
		-- Does not have response data
	end
end

-- StartOwnStationCyclic(3207)
function Slmp3207(buffer, subcmd, subtree, isReq, isBin)
	-- Req
	if( isReq ) then
		-- Does not have request data
	else
	-- Res
		-- Does not have response data
	end
end

-- StopOtherStationsCyclic(3208)
function Slmp3208(buffer, subcmd, subtree, isReq, isBin)
	if( isReq ) then
	-- Req
		local buf_option     = buffer(  0,  2)
		local buf_num        = buffer(  2,  2)
		
		
		local option_bit2_list = {
			[0] = "IPv4",							-- IPv4
			[1] = "IPv6",							-- IPv6
		}
		local option_bit0_list = {
			[0] = "Not specify all the stations which perform data link.",			-- Not specify all the stations which perform data link.
			[1] = "Specify all the stations which perform data link.",				-- Specify all the stations which perform data link.
		}
		
		local tree_option = subtree:add(buf_option            ,"stopStartOptionInfo          : "..option_bit2_list[bit32.extract(buf_option:le_uint(),2,1)].." , "..option_bit0_list[bit32.extract(buf_option:le_uint(),0,1)] )	-- Stop/start option information
		tree_option:add(buf_option            ,string.format("       .... .... .... .%d..  %s",bit32.extract(buf_option:le_uint(),2,1),option_bit2_list[bit32.extract(buf_option:le_uint(),2,1)]) )
		tree_option:add(buf_option            ,string.format("       .... .... .... ...%d  %s",bit32.extract(buf_option:le_uint(),0,1),option_bit0_list[bit32.extract(buf_option:le_uint(),0,1)]) )

		subtree:add(buf_num           ,string.format("cyclicStopStationNum         : %u",  buf_num:le_uint() ))																													-- Number of specified stations

		if buf_num:le_uint() > 0 then
			local n
			local buf_ipaddress_list = buffer(4,buf_num:le_uint()*16)																																								-- Cyclic transmission stop specified station IP address
			for n = 1 , buf_num:le_uint() do
				local buf_ipaddress = buffer( 4 + (n-1) * 16 ,16 )
				if bit32.extract(buf_option:le_uint(),2,1) == 0 then
					--IPv4
					subtree:add(buf_ipaddress(0,4),string.format("cyclicStopStationIpAddr [%2d] : %s",n,buf2ipaddr(buf_ipaddress(0,4))) )
				else
					--IPv6
					subtree:add(buf_ipaddress,string.format("cyclicStopStationIpAddr [%2d] : %s",n,buf2ipv6addr(buf_ipaddress)) )
				end
			end
		end
		
	else
	-- Res
		-- Does not have response data
	end
end

-- StartOtherStationsCyclic(3209)
function Slmp3209(buffer, subcmd, subtree, isReq, isBin)
	if( isReq ) then
	-- Req
		local buf_option     = buffer(  0,  2)
		local buf_num        = buffer(  2,  2)
		
		
		local option_bit2_list = {
			[0] = "IPv4",							-- IPv4
			[1] = "IPv6",							-- IPv6
		}
		local option_bit0_list = {
			[0] = "Not specify all the stations which perform data link.",			-- Not specify all the stations which perform data link.
			[1] = "Specify all the stations which perform data link.",				-- Specify all the stations which perform data link.
		}
		
		local tree_option = subtree:add(buf_option            ,"stopStartOptionInfo          : "..option_bit2_list[bit32.extract(buf_option:le_uint(),2,1)].." , "..option_bit0_list[bit32.extract(buf_option:le_uint(),0,1)] )	-- Stop/start option information
		tree_option:add(buf_option            ,string.format("       .... .... .... .%d..  %s",bit32.extract(buf_option:le_uint(),2,1),option_bit2_list[bit32.extract(buf_option:le_uint(),2,1)]) )
		tree_option:add(buf_option            ,string.format("       .... .... .... ...%d  %s",bit32.extract(buf_option:le_uint(),0,1),option_bit0_list[bit32.extract(buf_option:le_uint(),0,1)]) )

		subtree:add(buf_num           ,string.format("cyclicStopStationNum         : %u",  buf_num:le_uint() ))																													-- Number of specified stations

		if buf_num:le_uint() > 0 then
			local n
			local buf_ipaddress_list = buffer(4,buf_num:le_uint()*16)																																					-- Cyclic transmission start specified station IP address
			for n = 1 , buf_num:le_uint() do
				local buf_ipaddress = buffer( 4 + (n-1) * 16 ,16 )
				if bit32.extract(buf_option:le_uint(),2,1) == 0 then
					--IPv4
					subtree:add(buf_ipaddress(0,4),string.format("cyclicStopStationIpAddr [%2d] : %s",n,buf2ipaddr(buf_ipaddress(0,4))) )
				else
					--IPv6
					subtree:add(buf_ipaddress,string.format("cyclicStopStationIpAddr [%2d] : %s",n,buf2ipv6addr(buf_ipaddress)) )
				end
			end
		end
		
	else
	-- Res
		-- Does not have response data.
	end
end

-- LinkDevicePrmWrite(320A)
function Slmp320A(buffer, subcmd, subtree, isReq, isBin)
	if( isReq ) then
	-- Req
		local common_param_id = buffer(0,12)
		local common_param    = buffer(12)
		
		subtree:add(common_param_id ,"linkDeviceParameterID  : " ..common_param_id )					-- Writing link device parameter ID
		subtree:add(common_param    ,"linkDeviceParameter    : " ..common_param    )					-- Writing link device parameters
	else
	-- Res
		-- Does not have response data.
	end
end

-- LinkDevicePrmWriteCheckReq(320B)
function Slmp320B(buffer, subcmd, subtree, isReq, isBin)
	if( isReq ) then
	-- Req
		local common_param_id = buffer(0,12)
		subtree:add(common_param_id ,"linkDeviceParameterID  : " ..common_param_id )					-- Writing link device parameters
	else
	-- Res
		-- Does not have response data.
	end
end

-- LinkDevicePrmWriteCheckResp(320C)
function Slmp320C(buffer, subcmd, subtree, isReq, isBin)
	if( isReq ) then
	-- Req
		local buf_check_result = buffer(0,4)
		local buf_error_code   = buffer(4,4)

		local check_result_list ={
			[0] = "Link device parameter not received" ,
			[1] = "Checking link device parameter" ,
			[2] = "Check OK" ,
			[3] = "Check failure" ,
		}
		local result = lookup(buf_check_result:le_uint(),check_result_list,"unknown")
		
		subtree:add(buf_check_result ,string.format("checkResult            : %s"  , result                   ) )			-- Check result
		subtree:add(buf_error_code   ,string.format("checkErrorCode         : %08x", buf_error_code:le_uint() ) )			-- Error code
	else
	-- Res
		-- Does not have response data.
	end
end

-- RsvStationConfigTemporaryRelease(320D)
function Slmp320D(buffer, subcmd, subtree, isReq, isBin)
	if( isReq ) then
	-- Req
		local buf_config       = buffer(0,1)
		local Reserve          = buffer(1,1)

		local config_list ={
			[0] = "Reserved station setting temporary release cancellation" 	,	--	Reserved station setting temporary release cancellation
			[1] = "Reserved station setting temporary release"		 	,			--	Reserved station setting temporary release
		}
		local config = lookup(buf_config:le_uint(),config_list,"unknown")
		
		subtree:add(buf_config ,string.format("rsvStationConfigChange : %s"  , config                   ) )					-- Reserved station setting change specification
		subtree:add(Reserve ,string.format("reserved               : %s"  , Reserve                  ) )					-- reserved
	else
	-- Res
		-- Does not have response data.
	end
end

-- SetWatchdogCounterInfo(3210)
function Slmp3210(buffer, subcmd, subtree, isReq, isBin)
	if( isReq ) then
	-- Req
	
		local Setting_list ={
			[0] = "Not set." ,
			[1] = "Set."
		}
		
		local buf_Setting = buffer(0,2):le_uint()
		local buf_Setting_row = buffer(0,1):uint()
		local buf_Setting_hi = buffer(1,1):uint()
		local Setting = lookup(bit32.extract(buffer:le_uint(),15,1),Setting_list,"unknown")
		local Setting_Num = bit.band(buf_Setting,0x7fff)
		
		local subsubtree = subtree:add(buffer(offset,1), string.format("stopStartOptionInfo : 0x%04x",
			buffer(0,2):le_uint()))
		
		subsubtree:add(buffer(offset,2),
			string.format("%d... .... .... .... = Setting of threshold for watchdog counter check error consecutive counter : %s (%d)",
				bit32.extract(buffer:le_uint(),15,1), Setting, bit32.extract(buffer:le_uint(),15,1)))
		
		subsubtree:add(buffer(offset,2),
			string.format(".%d%d%d %d%d%d%d %d%d%d%d %d%d%d%d = Threshold for watchdog counter check error consecutive counter : 0x%x",
				bitval(buf_Setting_hi,6), bitval(buf_Setting_hi,5),bitval(buf_Setting_hi,4),
				bitval(buf_Setting_hi,3), bitval(buf_Setting_hi,2), bitval(buf_Setting_hi,1),
				bitval(buf_Setting_hi,0), bitval(buf_Setting_row,7), bitval(buf_Setting_row,6),
				bitval(buf_Setting_row,5), bitval(buf_Setting_row,4), bitval(buf_Setting_row,3),
				bitval(buf_Setting_row,2), bitval(buf_Setting_row,1), bitval(buf_Setting_row,0),
				Setting_Num))
		
	else
	-- Res
		local buf_num1  = buffer(  0,  2)
	
		subtree:add(buffer(0,2), "transmitSubPayloadNum          : "..buffer(0,2):le_uint())											-- Number of stations
		
		local offset_   = 2
		
		for n = 1 , buf_num1:le_uint() do
			local buf_tssubpayload_info = buffer( (offset_ + ((n - 1) * 12)) ,  12)
			local buf_wcex            = buf_tssubpayload_info(  0,  1)
			local buf_reserived1      = buf_tssubpayload_info(  1,  1)
			local buf_receivemem_add  = buf_tssubpayload_info(  2,  4)
			local buf_wcdl_index      = buf_tssubpayload_info(  6,  2)
			local buf_wcdl_subindex   = buf_tssubpayload_info(  8,  1)
			local buf_reserived2      = buf_tssubpayload_info(  9,  1)
			local buf_wcdl_offset     = buf_tssubpayload_info( 10,  2)
			
			local tree_subid = subtree:add(buf_tssubpayload_info,string.format("transmitSubPayloadInfo [%d]",n))						-- Send sub payload information
			tree_subid:add(buf_wcex , string.format("watchdogCounterExistence     : 0x%02x" ,buf_wcex:le_uint() ) )								-- Whether or not watchdog counter added
			tree_subid:add(buf_reserived1 , string.format("reserved                     : 0x%02x", buf_reserived1:le_uint() ) )					-- For future expansion (fixed to 0)
			tree_subid:add(buf_receivemem_add , string.format("receiveMemoryAddr            : 0x%08x", buf_receivemem_add:le_uint() ) )		-- Receive memory address
			tree_subid:add(buf_wcdl_index , string.format("watchdogCounterUlIndex       : 0x%04x", buf_wcdl_index:le_uint() ) )				-- Watchdog counter UL INDEX
			tree_subid:add(buf_wcdl_subindex , string.format("watchdogCounterUlSubIndex    : 0x%02x", buf_wcdl_subindex:le_uint() ) )			-- Watchdog counter UL SUB INDEX
			tree_subid:add(buf_reserived2 , string.format("reserved                     : 0x%02x", buf_reserived2:le_uint() ) )					-- For future expansion (fixed to 0)
			tree_subid:add(buf_wcdl_offset , string.format("watchdogCounterUlOffset      : 0x%04x", buf_wcdl_offset:le_uint() ) )			-- Watchdog counter UL offset
		end
		
		offset_         = (offset_ + (buf_num1:le_uint() * 12))
		
		local buf_num2  = buffer(  offset_ ,  2)
		
		subtree:add(buffer(offset_ ,2), "receiveSubPayloadNum           : "..buffer(offset_ , 2):le_uint())							-- Number of receive sub payloads
		
		offset_         =  offset_ + 2
		
		for n = 1 , buf_num2:le_uint() do
			local buf_recsubpayload_info = buffer( (offset_ + ((n - 1) * 8)) ,  8)
			buf_wcex              = buf_recsubpayload_info( 0,  1)
			buf_reserived1        = buf_recsubpayload_info( 1,  1)
			buf_wcdl_index        = buf_recsubpayload_info( 2,  2)
			buf_wcdl_subindex     = buf_recsubpayload_info( 4,  1)
			buf_reserived2        = buf_recsubpayload_info( 5,  1)
			buf_wcdl_offset       = buf_recsubpayload_info( 6,  2)
			
			local tree_subid = subtree:add(buf_recsubpayload_info,string.format("receiveSubPayloadInfo [%d]",n))					-- Receive sub payload information
			tree_subid:add(buf_wcex , string.format("watchdogCounterExistence     : 0x%02x", buf_wcex:le_uint() ) )								-- Whether or not watchdog counter added
			tree_subid:add(buf_reserived1 , string.format("reserved                     : 0x%02x", buf_reserived1:le_uint()) )					-- For future expansion (fixed to 0)
			tree_subid:add(buf_wcdl_index , string.format("watchdogCounterDlIndex       : 0x%04x", buf_wcdl_index:le_uint() ) )				-- Watchdog counter DL INDEX
			tree_subid:add(buf_wcdl_subindex , string.format("watchdogCounterDlSubIndex    : 0x%02x", buf_wcdl_subindex:le_uint() ) )			-- Watchdog counter DL SUB INDEX
			tree_subid:add(buf_reserived2 , string.format("reserved                     : 0x%02x", buf_reserived2:le_uint() ) )					-- For future expansion (fixed to 0)
			tree_subid:add(buf_wcdl_offset , string.format("watchdogCounterDlOffset      : 0x%04x", buf_wcdl_offset:le_uint() ) )			-- Watchdog counter DL offset
		end
		
	end
end

-- WatchdogCounterOffsetConfig(3211)
function Slmp3211(buffer, subcmd, subtree, isReq, isBin)
	if( isReq ) then
	-- Req
		local buf_num        = buffer(  0,  2)
	
		subtree:add(buffer(0,2), "nodeNum                    : "..buffer(0,2):le_uint())													-- Number of stations
		
		for n = 1 , buf_num:le_uint() do
			local buf_node_info       = buffer(  2 + ((n - 1) * 12) ,  12)
			local buf_subpayload_dest = buf_node_info(  0,  2)
			local buf_wcdl_index      = buf_node_info(  2,  4)
			local buf_receivemem_add  = buf_node_info(  6,  2)
			local buf_wcdl_subindex   = buf_node_info(  8,  1)
			local buf_reserived       = buf_node_info(  9,  1)
			local buf_wcdl_offset     = buf_node_info( 10,  2)
			
			local tree_subid = subtree:add(buf_node_info,string.format("nodeInfo [%d]",n))
			tree_subid:add(buf_subpayload_dest    , string.format("subPayloadDestination      : 0x%04x", buf_subpayload_dest:le_uint() ) )		-- Sub payload destination
			tree_subid:add(buf_wcdl_index         , string.format("receiveMemoryAddr          : 0x%08x", buf_wcdl_index:le_uint() ) )			-- Watchdog counter DL INDEX
			tree_subid:add(buf_receivemem_add     , string.format("watchdogCounterDlIndex     : 0x%04x", buf_receivemem_add:le_uint() ) )		-- Receive memory address
			tree_subid:add(buf_wcdl_subindex      , string.format("watchdogCounterDlSubIndex  : 0x%02x", buf_wcdl_subindex:le_uint() ) )			-- Watchdog counter DL SUBINDEX
			tree_subid:add(buf_reserived          , string.format("reserved                   : 0x%02x", buf_reserived:le_uint() ) )				-- For future expansion (fixed to 0)
			tree_subid:add(buf_wcdl_offset        , string.format("watchdogCounterDlOffset    : 0x%04x", buf_wcdl_offset:le_uint() ) )			-- Watchdog counter DL offset
		end
		
	else
	-- Res
		-- Does not have response data.
	end
end

-- NodeInfoAccept(3230)
function Slmp3230(buffer, subcmd, subtree, isReq, isBin)
	if( isReq ) then
	-- Req
		local buf_num        = buffer(  0,  2)
	
		subtree:add(buffer(0,2), "productDataQuantity    : "..buffer(0,2):le_uint())												-- Data Num
		local offset_ = 2
		
		for n = 1 , buf_num:le_uint() do
			local buf_data_size    = buffer( (offset_ + 1) ,  1 )
			local buf_product_data = buffer( offset_ , buf_data_size:le_uint() + 2 )
			local buf_data_type    = buf_product_data( 0 ,  1 )
			local buf_data         = buf_product_data( 2 ,  buf_data_size:le_uint())
			
			local tree_subid = subtree:add(buf_product_data,string.format("productData [%d]",n))
			tree_subid:add(buf_data_type , string.format("dataType            : "  ..buf_data_type(  0,  1) ) )						-- Data Type
			tree_subid:add(buf_data_size , string.format("dataSize            : "  ..buf_data_size(  0,  1) ) )						-- Data Size
			tree_subid:add(buf_data      , string.format("data                : "  ..buf_data( 0 ,  buf_data_size:le_uint()) ) )	-- Data
			
			offset_ = offset_ + buf_data_size:le_uint() + 2
		end
	else
	-- Res
		-- Does not have response data.
	end
end

-- parseDevName
-- The format is determined from the subcommand and communication code, 
-- and the target device (memory type + memory number) is registered.
-- [Input]
-- buffer     : received data
-- subcmd     : subcommand
-- subtree    : parent
-- code       : Communication code (binary / ASCII)
-- treename   : tree name(optional)
-- [Output]
-- offset   : Size used
function parseDevName(buffer, subcmd, subtree, code, treename)
	local offset
	local len
	local devicetree
	
	offset = 0
	if( treename == nil ) then
		treename = "Device Name"
	end
	
	if( code == "BIN" ) then
		-- Binary
		if( subcmd == "0000" or subcmd == "0001" ) then
			-- when the address length is specified with 16bits
			devnum_dec = string.format("%d",buffer(0,3):le_uint())
			devnum_hex = string.format("%06X", buffer(0,3):le_uint())
			devcode_str = string.format("%02X", buffer(3,1):uint())
			
			-- Device Name Tree
			devicetree = subtree:add(buffer(0,4), treename) 
			devicetree:add(buffer(0,3), "First memory number: 0x"..devnum_hex.." ("..devnum_dec..")")				-- First memory number
			devicetree:add(buffer(3,1), "Memory type        : 0x"..devcode_str.." ("..DevCodeBIN[devcode_str]..")")	-- Memory type
			
			offset = 4
		elseif( subcmd == "0080" or subcmd == "0081" ) then
			-- when the address length is specified with 16bits [Device extension specification]
			devnum_dec = string.format("%d",buffer(2,3):le_uint())
			devnum_hex = string.format("%06X", buffer(2,3):le_uint())
			devcode_str = string.format("%02X", buffer(5,1):uint())
			
			-- Device Name Tree
			devicetree = subtree:add(buffer(0,11), treename) 
			devicetree:add(buffer(0,1), "Direct memory specification          : 0x"..string.format("%02X", buffer(0,1):uint()))			-- Direct memory specification 
			devicetree:add(buffer(1,3), "First memory number                  : 0x"..devnum_hex.."("..devnum_dec..")")					-- First memory number 
			devicetree:add(buffer(4,1), "Memory type                          : 0x"..devcode_str.." ("..DevCodeBIN[devcode_str]..")")	-- Memory type 
			devicetree:add(buffer(5,2), "Extension specification modification : 0x"..string.format("%04X", buffer(5,2):le_uint()))		-- Extension specification modification 
			devicetree:add(buffer(7,2), "Extension specification              : 0x"..string.format("%04X", buffer(7,2):le_uint()))		-- Extension specification 
			devicetree:add(buffer(9,2), "Indirect specification               : 0x"..string.format("%04X", buffer(9,2):uint()))		    -- Indirect specification 
			
			offset = 11
		elseif( subcmd == "0002" or subcmd == "0003" ) then
			-- when the address length is specified with 32bits
			devnum_dec = string.format("%d",buffer(0,4):le_uint())
			devnum_hex = string.format("%08X", buffer(0,4):le_uint())
			devcode_str = string.format("%02X", buffer(4,1):uint())
			
			-- Device Name Tree
			devicetree = subtree:add(buffer(0,6), treename) 
			devicetree:add(buffer(0,4), "First memory number: 0x"..devnum_hex.." ("..devnum_dec..")")				-- First memory number
			devicetree:add(buffer(4,2), "Memory type        : 0x"..devcode_str.." ("..DevCodeBIN[devcode_str]..")")	-- Memory type
			
			offset = 6
		elseif( subcmd == "0082" or subcmd == "0083" ) then
			-- when the address length is specified with 32bits [Device extension specification]
			devnum_dec = string.format("%d",buffer(2,4):le_uint())
			devnum_hex = string.format("%08X", buffer(2,4):le_uint())
			devcode_str = string.format("%02X", buffer(6,2):le_uint())
			
			-- Device Name Tree
			devicetree = subtree:add(buffer(0,13), treename)
			devicetree:add(buffer(0,1), "Direct memory specification          : 0x"..string.format("%02X",buffer(0,1):uint()))		-- Direct memory specification
			devicetree:add(buffer(1,4), "First memory number                  : 0x"..devnum_hex.." ("..devnum_dec..")")				-- First memory number
			devicetree:add(buffer(5,2), "Memory type                          : 0x"..string.format("%04X",buffer(5,2):le_uint()).." ("..DevCodeBIN[devcode_str]..")")	-- Memory type 
			devicetree:add(buffer(7,2), "Extension specification modification : 0x"..string.format("%04X",buffer(7,2):uint()))		-- Extension specification modification
			devicetree:add(buffer(9,2), "Extension specification              : 0x"..string.format("%04X",buffer(9,2):le_uint()))	-- Extension specification
			devicetree:add(buffer(11,2),"Indirect specification               : 0x"..string.format("%04X",buffer(11,2):uint()))		-- Indirect specification

			offset = 13
		end
	elseif( code == "ASC" ) then
		-- ASCII
		if( subcmd == "0000" or subcmd == "0001" ) then
			-- when the address length is specified with 16bits
			
			-- Device Name Tree
			devicetree = subtree:add(buffer(0,8), treename) 
			devicetree:add(buffer(0,2), "Memory type        : "..buffer(0,2):string())		-- Memory type
			devicetree:add(buffer(2,6), "First memory number: "..buffer(2,6):string())		-- First memory number
			
			offset = 8
		elseif( subcmd == "0080" or subcmd == "0081" ) then
			-- when the address length is specified with 16bits [Device extension specification]
			
			-- Device Name Tree
			devicetree = subtree:add(buffer(0,20), treename) 
			devicetree:add(buffer(0,2), "Indirect specification               : "..buffer(0,2):string())			-- Indirect specification
			devicetree:add(buffer(2,4), "Extension specification              : "..buffer(2,4):string())			-- Extension specification
			devicetree:add(buffer(6,3), "Extension specification modification : "..buffer(6,3):string())			-- Extension specification modification
			devicetree:add(buffer(9,2), "Memory type                          : "..buffer(9,2):string())			-- Memory type
			devicetree:add(buffer(11,6),"First memory number                  : "..buffer(11,6):string())			-- First memory number
			devicetree:add(buffer(17,3),"Device modification                  : "..buffer(17,3):string())			-- Device modification
			
			offset = 20
		elseif( subcmd == "0002" or subcmd == "0003" ) then
			-- when the address length is specified with 32bits
			
			-- Device Name Tree
			devicetree = subtree:add(buffer(0,12), treename) 
			devicetree:add(buffer(0,4), "Memory type        : "..buffer(0,4):string())				-- Memory type
			devicetree:add(buffer(4,8), "First memory number: "..buffer(4,8):string())				-- First memory number
			
			offset = 12
		elseif( subcmd == "0082" or subcmd == "0083" ) then
			-- when the address length is specified with 32bits [Device extension specification]
			
			-- Device Name Tree
			devicetree = subtree:add(buffer(0,28), treename) 
			devicetree:add(buffer(0,2),		"Indirect specification               : "..buffer(0,2):string())				-- Indirect specification
			devicetree:add(buffer(2,4),		"Extension specification              : "..buffer(2,4):string())				-- Extension specification
			devicetree:add(buffer(6,4), 	"Extension specification modification : "..buffer(6,4):string())				-- Extension specification modification
			devicetree:add(buffer(10,4),	"Memory type                          : "..buffer(10,4):string())				-- Memory type
			devicetree:add(buffer(14,10),	"First memory number                  : "..buffer(14,10):string())				-- First memory number
			devicetree:add(buffer(24,4), 	"Device modification                  : "..buffer(24,4):string())				-- Device modification
			
			offset = 28
		end
	end
	
	return offset
end

-- noMonitorDevice(Binary)
-- caller:Slmp0403,Slmp0801
function noMonitorDevice_BIN(buffer, subcmd, subtree)
	local wpt = buffer(0, 1):uint() 
	local dwpt = buffer(1, 1):uint()
	local offset = 0
	local accesstree
	
	accesstree = subtree:add(buffer(0,2),"accessNum")
	accesstree:add(buffer(0,1), "wdAccessNum : "..buffer(0,1):uint())													-- Word access Points
	accesstree:add(buffer(1,1), "dwdAccessNum: "..buffer(1,1):uint())													-- Double Word access Points
	
	for i =1, wpt do
		offset = offset + parseDevName(buffer(2+offset), subcmd, subtree, "BIN", "wdDevice "..string.format("%d",i))	-- Registrate device name
	end
	
	for i =1, dwpt do
		offset = offset + parseDevName(buffer(2+offset), subcmd, subtree, "BIN", "dwdDevice "..string.format("%d",i))	-- Registrate device name
	end
end

-- noMonitorDevice(ASCII)
-- caller:Slmp0403,Slmp0801
function noMonitorDevice_ASC(buffer, subcmd, subtree)
	local wpt = tonumber(buffer(0,2):string(),16)
	local dwpt = tonumber(buffer(2,2):string(),16)
	local offset = 0
	local accesstree
	
	accesstree = subtree:add(buffer(0,4),"accessNum")
	accesstree:add(buffer(0,2), "wdAccessNum : "..tonumber(buffer(0,2):string(),16))										-- Word access Points
	accesstree:add(buffer(2,2), "dwdAccessNum: "..tonumber(buffer(2,2):string(),16))										-- Double Word access Points
	
	for i =1, wpt do
		offset = offset + parseDevName(buffer(4+offset), subcmd, subtree, "ASC", "wdDevice "..string.format("%d",i))		-- Registrate device name
	end
	
	for i =1, dwpt do
		offset = offset + parseDevName(buffer(4+offset), subcmd, subtree, "ASC", "dwdDevice "..string.format("%d",i))		-- Registrate device name
	end
end

-- tarMonitorDevice(Binary)
-- caller:Slmp0403,Slmp0801
function tarMonitorDevice_BIN(buffer, subcmd, subtree)
	local wpt					-- Word access Points
	local dwpt					-- Double Word access Points
	local mntfiletree			-- mntFile Tree
	local mntwdtree				-- mntWdDevice Tree
	local mntbttree				-- mntBtDevice Tree
	local wddevicetree			-- wdDevice Tree
	local dwddevicetree			-- dwdDevice Tree
	local devicetree
	local steptree
	local accesstree
	local offset = 0
	local devnum_dec = ""
	local devnum_hex = ""
	local devcode_str = ""
	local sfcnum
	local fileno
	
	subtree:add(buffer(0,1), "monitorType: "..string.format("0x%02X",buffer(0,1):uint()))		-- Monitor type
	subtree:add(buffer(0,1), string.format("        .... .%d..  Indicates presence of bit memory specification", bit32.extract(buffer(0,1):uint(),2,1)))
	subtree:add(buffer(0,1), string.format("        .... ..%d.  Indicates presence of word memory specification", bit32.extract(buffer(0,1):uint(),1,1)))
	subtree:add(buffer(0,1), string.format("        .... ...%d  Indicates presence of file and step number specification", bit32.extract(buffer(0,1):uint(),0,1)))
	subtree:add(buffer(1,1), "reserved1  : "..string.format("0x%02X",buffer(1,1):uint()))		-- For future expansion
	
	offset = offset + 2
	
	-- mntFile
	mntfiletree = subtree:add(buffer(offset,24), "mntFile")
	fileno = buffer(offset + 0, 2):le_uint()
	if 0x0000 == fileno then
		mntfiletree:add(buffer(offset + 0, 2), 	"fileNo          : "..string.format("File name is not specified (0x%04X)",fileno))	-- File Number
	elseif 0xffff == fileno then
		mntfiletree:add(buffer(offset + 0, 2), 	"fileNo          : "..string.format("File number is unknown (0x%04X)",fileno))		-- File Number
	elseif 0x0000 < fileno and fileno < 0x0101 then
		mntfiletree:add(buffer(offset + 0, 2), 	"fileNo          : "..string.format("0x%04X",fileno))								-- File Number
	else
		mntfiletree:add(buffer(offset + 0, 2), 	"fileNo          : "..string.format("For future expansion (0x%04X)",fileno))		-- File Number
	end
	mntfiletree:add(buffer(offset + 2, 8), 		"fileName        : "..string.format("%s",buffer(offset + 2, 8):string()))			-- File name
	mntfiletree:add(buffer(offset + 10, 3), 	"fileExtension   : "..string.format("%s",buffer(offset + 10, 3):string()))			-- File extention
	mntfiletree:add(buffer(offset + 13, 1), 	"fileAttribute   : "..string.format("0x%02X",buffer(offset + 13, 1):le_uint()))		-- File attribute
	offset = offset + 14
	
	-- mntFile -> step
	steptree = mntfiletree:add(buffer(offset + 0, 10), "step")
	steptree:add(buffer(offset + 0, 4), "seqStepNo : "..string.format("0x%08X",buffer(offset + 0, 4):le_uint()))			-- Sequence step Number
	steptree:add(buffer(offset + 0, 4), string.format("       %d... .... .... .... .... .... .... ....  Indicates presence of interrupt pointer number specification", bit32.extract(buffer(offset + 0, 4):le_uint(),31,1)))
	steptree:add(buffer(offset + 0, 4), string.format("       .%d.. .... .... .... .... .... .... ....  Indicates presence of pointer number specification", bit32.extract(buffer(offset + 0, 4):le_uint(),30,1)))
	sfcnum = buffer(offset + 0, 4):le_uint()
	steptree:add(buffer(offset + 0, 4), string.format("       ..%d%d %d%d%d%d %d%d%d%d %d%d%d%d %d%d%d%d %d%d%d%d %d%d%d%d %d%d%d%d  Indicates the sequence program step number, pointer number, or interrupt pointer number (%d)",
			bit32.extract(sfcnum,29,1), bit32.extract(sfcnum,28,1), 
			bit32.extract(sfcnum,27,1), bit32.extract(sfcnum,26,1), bit32.extract(sfcnum,25,1), bit32.extract(sfcnum,24,1),
			bit32.extract(sfcnum,23,1), bit32.extract(sfcnum,22,1), bit32.extract(sfcnum,21,1), bit32.extract(sfcnum,20,1),
			bit32.extract(sfcnum,19,1), bit32.extract(sfcnum,18,1), bit32.extract(sfcnum,17,1), bit32.extract(sfcnum,16,1),
			bit32.extract(sfcnum,15,1), bit32.extract(sfcnum,14,1), bit32.extract(sfcnum,13,1), bit32.extract(sfcnum,12,1),
			bit32.extract(sfcnum,11,1), bit32.extract(sfcnum,10,1), bit32.extract(sfcnum, 9,1), bit32.extract(sfcnum, 8,1),
			bit32.extract(sfcnum, 7,1), bit32.extract(sfcnum, 6,1), bit32.extract(sfcnum, 5,1), bit32.extract(sfcnum, 4,1),
			bit32.extract(sfcnum, 3,1), bit32.extract(sfcnum, 2,1), bit32.extract(sfcnum, 1,1), bit32.extract(sfcnum, 0,1),
			bit32.extract(sfcnum, 0,30)))
	steptree:add(buffer(offset + 4, 2), "sfcStepNo : "..string.format("0x%04X",buffer(offset + 4, 2):le_uint()))			-- SFC step number
	steptree:add(buffer(offset + 6, 2), "sfcBlockNo: "..string.format("0x%04X",buffer(offset + 6, 2):le_uint()))			-- SFC block number
	steptree:add(buffer(offset + 8, 2), "sfcPattern: "..string.format("0x%04X",buffer(offset + 8, 2):le_uint()))			-- SFC pattern
	offset = offset + 10
	
	-- mntWdDevice
	devnum_dec = string.format("%d", buffer(offset, 3):le_uint())
	devnum_hex = string.format("%06X", buffer(offset, 3):le_uint())
	devcode_str = string.format("%02X", buffer(offset + 3, 1):uint())
	
	mntwdtree = subtree:add(buffer(offset,8), "mntWdDevice")
	devicetree = mntwdtree:add(buffer(offset,4),"device")
	devicetree:add(buffer(offset + 0, 3), "First memory number: 0x"..devnum_hex.." ("..devnum_dec..") ")					-- Device number
	devicetree:add(buffer(offset + 3, 1), "Memory type        : 0x"..devcode_str.." ("..DevCodeBIN[devcode_str]..") ")		-- Device code
	mntwdtree:add(buffer(offset + 4, 2),  "mask               : 0x"..string.format("%04X",buffer(offset + 4, 2):le_uint()))	-- Masck
	mntwdtree:add(buffer(offset + 6, 2),  "wdMtCondition      : 0x"..string.format("%04X",buffer(offset + 6, 2):le_uint()))	-- Monitor condition
	offset = offset + 8
	
	-- mntBtDevice
	devnum_dec = string.format("%d", buffer(offset, 3):le_uint())
	devnum_hex = string.format("%06X", buffer(offset, 3):le_uint())
	devcode_str = string.format("%02X", buffer(offset + 3, 1):uint())
	
	mntbttree = subtree:add(buffer(offset, 5), "mntBtDevice")
	devicetree = mntbttree:add(buffer(offset,4),"device")
	devicetree:add(buffer(offset + 0, 3), "First memory number: 0x"..devnum_hex.." ("..devnum_dec..") ")				-- Device number
	devicetree:add(buffer(offset + 3, 1), "Memory type        : 0x"..devcode_str.." ("..DevCodeBIN[devcode_str]..") ")	-- Device code
	mntbttree:add(buffer(offset + 4, 1),  "btMtCondition      : 0x"..string.format("%02X",buffer(offset + 4, 1):uint()))-- Monitor condition
	offset = offset + 5
	
	-- accessNum
	wpt = buffer(offset, 1):uint()
	dwpt = buffer(offset+1, 1):uint()
	accesstree = subtree:add(buffer(offset,2), "accessNum")
	accesstree:add(buffer(offset + 0, 1), "wdAccessNum : "..buffer(offset + 0, 1):uint())			-- Word access points
	accesstree:add(buffer(offset + 1, 1), "dwdAccessNum: "..buffer(offset + 1, 1):uint())			-- Double word access points
	offset = offset + 2
	
	-- wdDevice
	for i = 1, wpt do
		devnum_dec = string.format("%d", buffer(offset, 3):le_uint())
		devnum_hex = string.format("%06X", buffer(offset, 3):le_uint())
		devcode_str = string.format("%02X", buffer(offset + 3, 1):uint())
		
		wddevicetree = subtree:add(buffer(offset, 4), "wdDevice"..string.format("%d", i))
		wddevicetree:add(buffer(offset + 0, 3), "First memory number: 0x"..devnum_hex.." ("..devnum_dec..") ")					-- Start Device Number
		wddevicetree:add(buffer(offset + 3, 1), "Memory type        : 0x"..devcode_str.." ("..DevCodeBIN[devcode_str]..") ")	-- Device Code
		
		offset = offset + 4
	end
	
	-- dwdDevice
	devnum_dec = ""
	devnum_hex = ""
	devcode_str = ""
	
	for i = 1, dwpt do
		devnum_dec = string.format("%d", buffer(offset, 3):le_uint())
		devnum_hex = string.format("%06X", buffer(offset, 3):le_uint())
		devcode_str = string.format("%02X", buffer(offset + 3, 1):uint())
		
		dwddevicetree = subtree:add(buffer(offset, 4), "dwdDevice"..string.format("%d", i))
		dwddevicetree:add(buffer(offset + 0, 3), "First memory number: 0x"..devnum_hex.." ("..devnum_dec..") ")					-- Start Device Number
		dwddevicetree:add(buffer(offset + 3, 1), "Memory type        : 0x"..devcode_str.." ("..DevCodeBIN[devcode_str]..") ")	-- Device Code
		
		offset = offset + 4
	end
end 

-- tarMonitorDevice(ASCII)
-- caller:Slmp0403,Slmp0801
function tarMonitorDevice_ASC(buffer, subcmd, subtree)
	local wpt					-- Word access Points
	local dwpt					-- Double Word access Points
	local mntfiletree			-- mntFile Tree
	local mntwdtree				-- mntWdDevice Tree
	local mntbttree				-- mntBtDevice Tree
	local wddevicetree			-- wdDevice Tree
	local dwddevicetree			-- dwdDevice Tree
	local steptree
	local accesstree
	local offset = 0
	local sfcnum
	local fileno
	
	subtree:add(buffer(0,2), "monitorType: 0x"..buffer(0,2):string())		-- Monitor type
	subtree:add(buffer(0,2), string.format("        .... .%d..  Indicates presence of bit memory specification", bit32.extract(tonumber(buffer(0,2):string(),16),2,1)))
	subtree:add(buffer(0,2), string.format("        .... ..%d.  Indicates presence of word memory specification", bit32.extract(tonumber(buffer(0,2):string(),16),1,1)))
	subtree:add(buffer(0,2), string.format("        .... ...%d  Indicates presence of file and step number specification", bit32.extract(tonumber(buffer(0,2):string(),16),0,1)))
	subtree:add(buffer(2,2), "reserved1  : 0x"..buffer(2,2):string())		-- For future expansion
	
	offset = offset + 4
	
	-- mntFile
	mntfiletree = subtree:add(buffer(offset, 36), "mntFile")
	fileno = tonumber(buffer(offset + 0, 4):string(),16)
	if 0x0000 == fileno then
		mntfiletree:add(buffer(offset + 0, 4), 	"fileNo           : "..string.format("File name is not specified (0x%04X)",fileno))	-- File Number
	elseif 0xffff == fileno then
		mntfiletree:add(buffer(offset + 0, 4), 	"fileNo           : "..string.format("File number is unknown (0x%04X)",fileno))		-- File Number
	elseif 0x0000 < fileno and fileno < 0x0101 then
		mntfiletree:add(buffer(offset + 0, 4), 	"fileNo           : "..string.format("0x%04X",fileno))								-- File Number
	else
		mntfiletree:add(buffer(offset + 0, 4), 	"fileNo           : "..string.format("For future expansion (0x%04X)",fileno))		-- File Number
	end
	mntfiletree:add(buffer(offset + 4, 8), 		"fileName         : "..buffer(offset + 4, 8):string())								-- File name
	mntfiletree:add(buffer(offset + 12, 3), 	"fileExtension    : "..buffer(offset + 12, 3):string())								-- File extention
	mntfiletree:add(buffer(offset + 15, 1), 	"fileAttribute    : 0x"..buffer(offset + 15, 1):string())							-- File attribute
	offset = offset + 16
	
	-- mntFile -> step
	steptree = mntfiletree:add(buffer(offset, 20),"step")
	steptree:add(buffer(offset + 0, 4), "sfcPattern: 0x"..buffer(offset + 0, 4):string())					-- Sequence step Number
	steptree:add(buffer(offset + 4, 4), "sfcBlockNo: 0x"..buffer(offset + 4, 4):string())					-- SFC step number
	steptree:add(buffer(offset + 8, 4), "sfcStepNo : 0x"..buffer(offset + 8, 4):string())					-- SFC block number
	steptree:add(buffer(offset + 12, 8),"seqStepNo : 0x"..buffer(offset + 12, 8):string())					-- SFC pattern
	steptree:add(buffer(offset + 12, 8), string.format("       %d... .... .... .... .... .... .... ....  Indicates presence of interrupt pointer number specification", bit32.extract(tonumber(buffer(offset + 12, 8):string(),16),31,1)))
	steptree:add(buffer(offset + 12, 8), string.format("       .%d.. .... .... .... .... .... .... ....  Indicates presence of pointer number specification", bit32.extract(tonumber(buffer(offset + 12, 8):string(),16),30,1)))
	sfcnum = tonumber(buffer(offset + 12, 8):string(),16)
	steptree:add(buffer(offset + 12, 8), string.format("       ..%d%d %d%d%d%d %d%d%d%d %d%d%d%d %d%d%d%d %d%d%d%d %d%d%d%d %d%d%d%d  Indicates the sequence program step number, pointer number, or interrupt pointer number (%d)",
			bit32.extract(sfcnum,29,1), bit32.extract(sfcnum,28,1),
			bit32.extract(sfcnum,27,1), bit32.extract(sfcnum,26,1), bit32.extract(sfcnum,25,1), bit32.extract(sfcnum,24,1),
			bit32.extract(sfcnum,23,1), bit32.extract(sfcnum,22,1), bit32.extract(sfcnum,21,1), bit32.extract(sfcnum,20,1),
			bit32.extract(sfcnum,19,1), bit32.extract(sfcnum,18,1), bit32.extract(sfcnum,17,1), bit32.extract(sfcnum,16,1),
			bit32.extract(sfcnum,15,1), bit32.extract(sfcnum,14,1), bit32.extract(sfcnum,13,1), bit32.extract(sfcnum,12,1),
			bit32.extract(sfcnum,11,1), bit32.extract(sfcnum,10,1), bit32.extract(sfcnum, 9,1), bit32.extract(sfcnum, 8,1),
			bit32.extract(sfcnum, 7,1), bit32.extract(sfcnum, 6,1), bit32.extract(sfcnum, 5,1), bit32.extract(sfcnum, 4,1),
			bit32.extract(sfcnum, 3,1), bit32.extract(sfcnum, 2,1), bit32.extract(sfcnum, 1,1), bit32.extract(sfcnum, 0,1),
			bit32.extract(sfcnum, 0,29)))
	offset = offset + 20
	
	-- mntWdDevice
	mntwdtree = subtree:add(buffer(offset,16), "mntWdDevice")
	mntwdtree:add(buffer(offset + 0, 2), "Memory type        : "..buffer(offset + 0, 2):string())				-- Device code
	mntwdtree:add(buffer(offset + 2, 6), "First memory number: "..buffer(offset + 2, 6):string())				-- Device number
	mntwdtree:add(buffer(offset + 8, 4), "mask               : 0x"..buffer(offset + 8, 4):string())				-- Mask
	mntwdtree:add(buffer(offset + 12, 4),"wdMtCondition      : 0x"..buffer(offset + 12, 4):string())			-- Monitor condition
	offset = offset + 16
	
	-- mntBtDevice
	mntbttree = subtree:add(buffer(offset, 10), "mntBtDevice")
	mntbttree:add(buffer(offset + 0, 2), "Memory type        : "..buffer(offset + 0, 2):string())				-- Device code
	mntbttree:add(buffer(offset + 2, 6), "First memory number: "..buffer(offset + 2, 6):string())				-- Device number
	mntbttree:add(buffer(offset + 8, 2), "btMtCondition      : 0x"..buffer(offset + 8, 2):string())				-- Monitor condition
	offset = offset + 10
	
	-- accessNum
	wpt = tonumber(buffer(offset, 2):string(),16)
	dwpt = tonumber(buffer(offset+2, 2):string(),16)
	
	accesstree = subtree:add(buffer(offset,4), "accessNum")
	accesstree:add(buffer(offset + 0, 2), "wdAccessNum : "..tonumber(buffer(offset + 0, 2):string(),16))		-- Word access points
	accesstree:add(buffer(offset + 2, 2), "dwdAccessNum: "..tonumber(buffer(offset + 2, 2):string(),16))		-- Double word access points
	offset = offset + 4
	
	-- wdDevice
	for i = 1, wpt do
		wddevicetree = subtree:add(buffer(offset, 8), "wdDevice "..string.format("%d", i))
		wddevicetree:add(buffer(offset + 0, 2), "Memory type        : "..buffer(offset + 0, 2):string())		-- Device code
		wddevicetree:add(buffer(offset + 2, 6), "First memory number: "..buffer(offset + 2, 6):string())		-- Device number
		offset = offset + 8
	end
	
	-- dwdDevice
	for i = 1, dwpt do		
		dwddevicetree = subtree:add(buffer(offset, 8), "dwdDevice "..string.format("%d", i))
		dwddevicetree:add(buffer(offset + 0, 2), "Memory type        : "..buffer(offset + 0, 2):string())		-- Device code
		dwddevicetree:add(buffer(offset + 2, 6), "First memory number: "..buffer(offset + 2, 6):string())		-- Device number
		offset = offset + 8
	end
end

----------------------------------
-- subCommand of Device
----------------------------------
-- isBitwise(Bit 0)
-- Check "Bit unit" or "Word unit"
-- Returns   : true  = Bit unit
--           : false = Word unit
function isBitwise(subcmd)
	local hexcmd = tonumber(subcmd,16)
	
	if bit32.band(hexcmd, 0x0001) == 1 then
		return true
	else
		return false
	end
end

-- is16bitAddr(Bit 1)
-- Check "when the address length is specified with 16bits" / "when the address length is specified with 32bits".
-- Returns  : true  = 16bits
--          : false = 32bits
function is16bitAddr(subcmd)
	local hexcmd = tonumber(subcmd, 16)
	
	if bit32.band(hexcmd, 0x0002) == 0 then
		return true
	else
		return false
	end
end

function buf2ipaddr_v4v6(buffer, addrsize, isBin)
	if 4 == addrsize and isBin then
		return buf2ipaddr(buffer)
	elseif 4 == addrsize and not isBin then
		return buf2ipaddr_asc(buffer)
	elseif 16 == addrsize and isBin then
		return buf2ipv6addr(buffer)
	elseif 16 == addrsize and not isBin then
		return buf2ipv6addr_asc(buffer)
	else
		return "For future expansion  "..buffer()
	end
end
--------------------------
-- Convert IPv4 Address --
--------------------------
-- BIN
function buf2ipaddr(buffer)
	local strIPaddr
	
	return string.format("%d.%d.%d.%d", buffer(3,1):le_uint(), buffer(2,1):le_uint(), buffer(1,1):le_uint(), buffer(0,1):le_uint())
end

-- ASCII
function buf2ipaddr_asc(buffer)
	local arrIPaddr = {
		tonumber(buffer(0,2):string(),16),
		tonumber(buffer(2,2):string(),16),
		tonumber(buffer(4,2):string(),16),
		tonumber(buffer(6,2):string(),16),
	}
	
	return string.format("%d.%d.%d.%d", arrIPaddr[1], arrIPaddr[2], arrIPaddr[3], arrIPaddr[4])
end
--------------------------
-- Convert IPv6 Address --
--------------------------
-- BIN
function buf2ipv6addr(buffer)
	local strIPaddr
	
	return string.format("%04X:%04X:%04X:%04X:%04X:%04X:%04X:%04X",
			 buffer(14,2):uint(), buffer(12,2):uint(), buffer(10,2):uint(), buffer(8,2):uint(),
			 buffer(6,2):uint(), buffer(4,2):uint(), buffer(2,2):uint(), buffer(0,2):uint())
end

-- ASCII
function buf2ipv6addr_asc(buffer)
	local arrIPaddr = {
		tonumber(buffer(0,2):string(),16),
		tonumber(buffer(2,2):string(),16),
		tonumber(buffer(4,2):string(),16),
		tonumber(buffer(6,2):string(),16),
		tonumber(buffer(8,2):string(),16),
		tonumber(buffer(10,2):string(),16),
		tonumber(buffer(12,2):string(),16),
		tonumber(buffer(14,2):string(),16),
	}
	
	return string.format("%04X:%04X:%04X:%04X:%04X:%04X:%04X:%04X",
			arrIPaddr[1], arrIPaddr[2], arrIPaddr[3], arrIPaddr[4],
			arrIPaddr[5], arrIPaddr[6], arrIPaddr[7], arrIPaddr[8])
end

-------------------------
-- Convert MAC Address --
-------------------------
-- BIN
function buf2macaddr(buffer)
	local strIPaddr
	
	return string.format("%02X:%02X:%02X:%02X:%02X:%02X", buffer(5,1):le_uint(), buffer(4,1):le_uint(), buffer(3,1):le_uint(), buffer(2,1):le_uint(), buffer(1,1):le_uint(), buffer(0,1):le_uint())
end
-- ASCII
function buf2macaddr_asc(buffer)
	local arrMACaddr = {
		tonumber(buffer(0,2):string(), 16),
		tonumber(buffer(2,2):string(), 16),
		tonumber(buffer(4,2):string(), 16),
		tonumber(buffer(6,2):string(), 16),
		tonumber(buffer(8,2):string(), 16),
		tonumber(buffer(10,2):string(), 16),
	}
	
	return string.format("%02X:%02X:%02X:%02X:%02X:%02X", arrMACaddr[1], arrMACaddr[2], arrMACaddr[3], arrMACaddr[4], arrMACaddr[5], arrMACaddr[6])
end

function reservedItem(buffer)
	return "[For future expansion] "..buffer()
end

function isLeapYear(year)
	if( year % 400 == 0 ) then
		return 1
	elseif ( year % 100 == 0 ) then
		return 1
	elseif ( year % 4 == 0 ) then
		return 1
	else
		return 0
	end
end

function cumulative_years(cumulative_days)
	local year, days_of_year;
	days_of_year = cumulative_days;
	for year = 1970 , 10000  do
		if(days_of_year < 365) then
			return year , days_of_year;
		end
		if(isLeapYear(year) == 1) then
			days_of_year = days_of_year - 1;
		end
		days_of_year = days_of_year - 365;
	end
	return year , days_of_year;
end

function cumulative_days_to_date(days)
	local days_per_month={
		--   1  2  3  4  5  6  7  8  9 10 11 12 
	[0]={	31,28,31,30,31,30,31,31,30,31,30,31	},
	[1]={	31,29,31,30,31,30,31,31,30,31,30,31	},
	};
	local	p_days_table;
	local	year , days_of_year = cumulative_years(days);
	local	month        = 0;
	local	day          = 0;
	
	local p_days_table = days_per_month[ isLeapYear(year) ];
	for i, days_of_month in ipairs(p_days_table) do
		if( days_of_year < days_of_month )then
			break;
		end
		month         = month + 1
		days_of_year  = days_of_year -  days_of_month;
	end
	day = days_of_year;
	return string.format("%04u/%02u/%02u",year,month+1,day+1)
end

function time_to_calender_time(buffer)
	local tmp                = buffer(0,10);
	local cumulative_seconds = tmp(8,2):le_uint()*4294967296 + tmp(4,4):le_uint();
	local nanosecond         = tmp(0,4):le_uint();
	return time_to_calender_time2(cumulative_seconds, nanosecond)
end

function time_to_calender_time2(cumulative_seconds, nanosecond)
	local second             = cumulative_seconds % (      60)           ;
	local minute             = cumulative_seconds % (   60*60) / (   60) ;
	local hour               = cumulative_seconds % (24*60*60) / ( 60*60) ;
	local cumulative_days    = cumulative_seconds / (24*60*60);
	
	return 	string.format("%s %02u:%02u:%02u.%04u",
							cumulative_days_to_date(cumulative_days),
							hour,minute,second,nanosecond);
end

function getString_DeviceVersionDetails(bit15info, bit14info)
	local retstr
	
	if 0 == bit14info then
		if 0 == bit15info then
			retstr = "00:Not used"
		else
			retstr = "01:Own device version is lower than the specified version."
		end
	else
		if 0 == bit14info then
			retstr = "10:Own device version is higher than the specified version."
		else
			retstr = "11:Own device version is identical to the specified version."
		end
	end
	
	return retstr
end
