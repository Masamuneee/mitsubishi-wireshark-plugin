------------------------------------------------------------------------
--
-- Bit operations helper for Wireshark plugins
-- Provides consistent bit operations across different Lua versions
--
-- revision : 01
-- date     : 2024/5/5
--
-- This file fixes compatibility issues between Lua 5.1, 5.2, 5.3 and LuaJIT
------------------------------------------------------------------------

-- Store global environment
local _G = _G
local _ENV = _ENV or _G

-- Define the module
local bitops = {}

-- Detect available bit libraries
local has_bit32 = _G.bit32 ~= nil
local has_bit = _G.bit ~= nil

-- Check for native bit operations in Lua 5.3+
local has_native_bitops = load("return ~0") and load("return ~0")() == -1

-- Initialize bit operations table
local bitlib = {}

-- Set up appropriate bit operations based on what's available
if has_bit32 then
    -- Use bit32 library (Lua 5.2+)
    bitlib.band = bit32.band
    bitlib.bor = bit32.bor
    bitlib.bxor = bit32.bxor
    bitlib.lshift = bit32.lshift
    bitlib.rshift = bit32.rshift
    bitlib.extract = bit32.extract
elseif has_bit then
    -- Use LuaJIT's bit library
    bitlib.band = bit.band
    bitlib.bor = bit.bor
    bitlib.bxor = bit.bxor
    bitlib.lshift = bit.lshift
    bitlib.rshift = bit.rshift
    
    -- Create extract function for bit library
    bitlib.extract = function(n, field, width)
        width = width or 1
        return bit.band(bit.rshift(n, field), bit.lshift(1, width) - 1)
    end
elseif has_native_bitops then
    -- Use native bit operations in Lua 5.3+
    bitlib.band = function(a, b) return a & b end
    bitlib.bor = function(a, b) return a | b end
    bitlib.bxor = function(a, b) return a ~ b end
    bitlib.lshift = function(a, n) return a << n end
    bitlib.rshift = function(a, n) return a >> n end
    
    -- Create extract function using native ops
    bitlib.extract = function(n, field, width)
        width = width or 1
        local mask = (1 << width) - 1
        return (n >> field) & mask
    end
else
    -- Fallback pure Lua implementation (slow but works everywhere)
    local function check_int(n)
        -- Verify that n is an integer
        if n <= 0 then
            if n == 0 then
                return 0
            end
            return math.ceil(n)
        else
            return math.floor(n)
        end
    end
    
    bitlib.band = function(a, b)
        local r = 0
        for i = 0, 31 do
            local p = 2^i
            if a % (p + p) >= p and b % (p + p) >= p then
                r = r + p
            end
        end
        return r
    end
    
    bitlib.bor = function(a, b)
        local r = 0
        for i = 0, 31 do
            local p = 2^i
            if a % (p + p) >= p or b % (p + p) >= p then
                r = r + p
            end
        end
        return r
    end
    
    bitlib.bxor = function(a, b)
        local r = 0
        for i = 0, 31 do
            local p = 2^i
            if (a % (p + p) >= p) ~= (b % (p + p) >= p) then
                r = r + p
            end
        end
        return r
    end
    
    bitlib.lshift = function(a, n)
        return a * (2 ^ n)
    end
    
    bitlib.rshift = function(a, n)
        return math.floor(a / (2 ^ n))
    end
    
    bitlib.extract = function(n, field, width)
        width = width or 1
        local mask = (1 << width) - 1
        return bitlib.band(bitlib.rshift(n, field), mask)
    end
end

-- Export the bitlib functions
for k, v in pairs(bitlib) do
    bitops[k] = v
end

-- Install the bit32 library globally if it's missing
if not _G.bit32 then
    _G.bit32 = {}
    for k, v in pairs(bitlib) do
        _G.bit32[k] = v
    end
end

-- Return the module
return bitops
