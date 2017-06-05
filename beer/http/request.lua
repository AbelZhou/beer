--
-- Created by IntelliJ IDEA.
-- User: abel
-- Date: 17/5/24
-- Time: 15:38
-- To change this template use File | Settings | File Templates.
--

local base_request = require "beer.lib.request"
local strlib = require "beer.lib.string"

local _M = {}
_M = setmetatable(_M, { __index = base_request })

_M._VERSION = '1.0'
_M.app_config = {}
_M.db_config = {}
_M.cache_config = {}
_M.cookie_table = {}


local function initConfig()
    local config_file = require "beer.lib.config"
    _M.app_config = config_file:read_config_file('app', APP_ROOT)
    _M.db_config = config_file:read_config_file('db', APP_ROOT)
    _M.cache_config = config_file:read_config_file('cache', APP_ROOT)
end


--split cookie
local function initCookie()
    local cookie_str = base_request:http_cookie()
    local t = strlib:split('; ', cookie_str)

    local cookie_table = {}
    for i, str in ipairs(t) do
        local idx = string.find(str, '=')
        local key = string.sub(str, 1, idx - 1)
        local value = string.sub(str, idx + 1)
        cookie_table[key] = value
    end

    _M.cookie_table = cookie_table
end


function _M:new()
    initConfig()
    initCookie()
    return _M
end

function _M:cookie(key)
    return _M.cookie_table[key];
end

return _M