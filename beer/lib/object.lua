--
-- Created by IntelliJ IDEA.
-- User: abel
-- Date: 17/5/25
-- Time: 16:47
-- To change this template use File | Settings | File Templates.
--

local _M = {}

_M._VERSION = '1.0'


function _M:iskindof(obj,classname)
    local t = type(obj)
    local mt
    if t == "table" then
        mt = getmetatable(obj)
    end
    while mt do
        if mt.__cname == classname then
            return true
        end
        mt = mt.super
    end
    return false
end


return _M
