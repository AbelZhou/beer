--
-- Created by IntelliJ IDEA.
-- User: abel
-- Date: 17/5/22
-- Time: 17:07
-- To change this template use File | Settings | File Templates.
--

local _M = {}

_M._VERSION = '1.0'


function _M:say_json(json_str)
    local json = json_str
    ngx.header.content_type = "application/json"
    ngx.status = ngx.OK
    ngx.say(json)
    ngx.exit(200)
end

function _M:say_msg(msg, ngx_code)
    local dom = [[<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Language" content="zh-cn" />
<title>Message</title>
</head>
<body>
%s
</body>
</html>]]
    dom = string.format(dom, msg)
    local ngx_status = ngx.OK
    if nil ~= ngx_code then
        ngx_status = ngx_code
    end
    ngx.header.content_type = "text/html"
    ngx.status = ngx_status
    ngx.say(dom)
    ngx.exit(ngx_status)
end

return _M