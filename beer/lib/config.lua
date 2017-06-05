--
-- Created by IntelliJ IDEA.
-- User: abel
-- Date: 17/5/24
-- Time: 11:11
-- To change this template use File | Settings | File Templates.
--

local _M = {}

--read config file return table
function _M:read_config_file(name,path)

    local io = require 'io'
    local config_file = io.open(path..'conf/'..APP_ENV..'/'..name..'.conf','r')
    local config_table = {}

    if nil == config_file then
        return ''
    end

    for line in config_file:lines() do
        local conf_str = string.gsub(line, " ", "")
        local idx = string.find(line, "#")
        if idx ~= 1 then
            local key = string.match(conf_str, '(.*)=')
            local value = string.match(conf_str, '=(.*)')
            if ((nil ~= key) and (nil ~= value)) then
                config_table[key]=value
            end
        end
    end

    io.close(config_file)

    return config_table
end


return _M