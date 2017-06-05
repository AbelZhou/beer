--
-- Created by IntelliJ IDEA.
-- User: abel
-- Date: 17/5/23
-- Time: 11:27
-- To change this template use File | Settings | File Templates.
-- 解析路由规则 ;;优先采用自定义路由  再次使用默认路由
--

local strlib = require "beer.lib.string"
local error = require "beer.error"

local _M = {}

_M._VERSION = '1.0'
local _controller_model = ''
local _action = ''

--定义defaultController
local function initControllerPath(request)
    if nil ~= _controller_model and '' ~= _controller_model then
        return
    end

    local uri = request:get_uri();
    local route_table = strlib:split('/', uri)
    local route_len = table.getn(route_table)
    if route_len < 1 then
        table.insert(route_table, 'index')
        table.insert(route_table, 'index')
    elseif route_len < 2 then
        table.insert(route_table, 1, 'index')
    else
    end
    route_len = table.getn(route_table)

    --build controller string
    local method = ''
    local controller_path = request.app_config['controller_path']
    if nil == controller_path or '' == controller_path then
        controller_path = 'controller'
    end

    for k, v in ipairs(route_table) do

        if k == route_len then
            method = v
        else
            controller_path = controller_path .. '.' .. v
        end
    end
    _controller_model = controller_path;
    _action = method
end


function _M:setController(model, method)
    if nil == model or '' == model or nil == method or '' == method then
        error:throw("Arg is null", "model or method is null")
    end

    _controller_model = model
    _action = method

    return true
end

--获得路由
function _M:getRoute()
    return _controller_model, _action
end

--创建路由对象
function _M:new(request)

    initControllerPath(request)
    return _M
end


return _M