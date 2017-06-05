--
-- Created by IntelliJ IDEA.
-- User: abel
-- Date: 17/5/23
-- Time: 11:27
-- To change this template use File | Settings | File Templates.
--


local _M = {}

_M._VERSION = '1.0'
local response = require "beer.lib.response"


function _M:throw(title,msg,log_level)
    if nil == log_level then
        log_level = ngx.ERR
    end
    ngx.log(log_level,"ERROR:"..title..":",msg);

    local show_msg = [[<p><h1>Error.</h1>
    <br/><b>title:</b>%s<br/>
    <b>message:</b>%s</p>]]
    show_msg = string.format(show_msg, title, msg)
    response:say_msg(show_msg,500);

end



return _M

