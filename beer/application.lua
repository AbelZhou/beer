--
-- Created by IntelliJ IDEA.
-- User: abel
-- Date: 17/5/23
-- Time: 11:27
-- To change this template use File | Settings | File Templates.
--

local error = require 'beer.error'
local request = require 'beer.http.request'
local routes = require 'beer.http.routes'
local obj = require 'beer.lib.object'

local _M = {}
local metatable = { __index = _M }

_M._VERSION = '1.0'


function _M:new()
    return setmetatable({}, metatable)
end


--加载插件
local function loadPlugins()
end

--初始化路由
local function initRoute(request)
    local route = routes:new(request)
    return route
end

--调派请求
local function initController(route,request)
    local controller_model,action = route:getRoute()
    ngx.say(controller_model)
    local controllerlib = require ("controller.auth.user")

    local controller = controllerlib:new()
--    ngx.exit(200)
    controller:run(action);

    return controller
end

local function view()
end

--执行应用
function _M:run()
    --初始化请求对象
    local req = request:new()

    --加载插件
    loadPlugins()

    --初始化路由
    local route = initRoute(req)
    --执行调派器
    local controller = initController(route,req)
    --启动controller
    controller:run()

    --执行显示层
--    view()

    ngx.say(req.app_config.controller_path)

    ngx.say('Hello application class & run method')
    ngx.exit(200)
end





return _M