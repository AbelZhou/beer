--
-- Created by IntelliJ IDEA.
-- User: abel
-- Date: 17/5/25
-- Time: 20:14
-- To change this template use File | Settings | File Templates.
--


local _M = {}
_M._VERSION = '1.0'
_M._request = {}
_M._route = {}


function _M:run(action)
    ngx.say('Excute run')
    self[]()
end


function _M:new(request,route)
    _M._request = request
    _M._route = route
    return _M
end




return _M