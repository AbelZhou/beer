--
-- Created by IntelliJ IDEA.
-- User: abel
-- Date: 17/5/22
-- Time: 17:44
-- To change this template use File | Settings | File Templates.
--

ENV = 'local'

local application = require "beer.application"
local error = require "beer.error"

local _M = {}

_M._VERSION = '1.0'


function _M:run()

    if nil ~= APP_ENV then
        ENV = APP_ENV
    end

    if nil == APP_ROOT then
        error:throw("Config Error.","Can not found APP_ROOT.")
    end


    local app = application:new()
    app:run()
end


function _M:setEnv(env)
    ENV = env
end

return _M
