------------------------------------------------------------------------
--
-- Initialization file for CC-Link and MELSEC protocol plugins
-- 
-- date: 2024/5/15
--
-- This file ensures that helper libraries are loaded before protocol plugins
------------------------------------------------------------------------

-- Load the bit operations helper first
local bitops_helper_loaded = pcall(function() 
    dofile(DATA_DIR.."/plugins/bitops_helper.lua")
end)

-- If we couldn't load it, output a warning
if not bitops_helper_loaded then
    print("Warning: Could not load bitops_helper.lua")
end

-- Now make sure bit32 is defined before continuing
if not bit32 then
    bit32 = {}
    
    -- Check if we have the bit module (LuaJIT or Lua 5.1 with bitop)
    if bit then
        bit32.band = bit.band
        bit32.bor = bit.bor
        bit32.bxor = bit.bxor
        bit32.lshift = bit.lshift
        bit32.rshift = bit.rshift
        bit32.extract = function(n, field, width)
            width = width or 1
            return bit.band(bit.rshift(n, field), bit.lshift(1, width) - 1)
        end
    else
        -- Simple fallback implementation for bit32 functions
        bit32.band = function(a, b) return a & b end
        bit32.bor = function(a, b) return a | b end
        bit32.bxor = function(a, b) return a ~ b end
        bit32.lshift = function(a, b) return a << b end
        bit32.rshift = function(a, b) return a >> b end
        bit32.extract = function(n, field, width)
            width = width or 1
            local mask = (1 << width) - 1
            return (n >> field) & mask
        end
    end
end

-- Load the MELSEC helper file
local melsec_helper_loaded = pcall(function() 
    dofile(DATA_DIR.."/plugins/melsec_helper.lua") 
end)

if melsec_helper_loaded then
    print("MELSEC protocol helper loaded successfully!")
else
    print("Warning: Could not load MELSEC protocol helper - basic MELSEC support will be available")
end

-- Load the unified MELSEC/SLMP dissector
local unified_dissector_loaded = pcall(function() 
    dofile(DATA_DIR.."/plugins/melsec_slmp_unified.lua") 
end)

if unified_dissector_loaded then
    print("Unified MELSEC/SLMP dissector loaded successfully!")
else
    print("Warning: Could not load unified MELSEC/SLMP dissector - falling back to separate dissectors")
end

print("CC-Link and MELSEC protocol plugins initialized successfully!")
