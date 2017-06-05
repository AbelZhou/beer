--
-- Created by IntelliJ IDEA.
-- User: abel
-- Date: 17/5/22
-- Time: 17:07
-- To change this template use File | Settings | File Templates.
--

local _M = {}

_M._VERSION = '1.0'

--get user agent
function _M:get_useragent()
    local user_agent = ngx.var.http_user_agent
    if nil == user_agent then
        user_agent = 'unknown'
    end
    return user_agent
end

--get http method
function _M:get_http_method()
    local method = ngx.var.request_method
    return method
end

--GET FULL URL
function _M:get_full_url()
    local uri = ngx.var.request_uri
    local scheme = ngx.var.scheme
    local host = ngx.var.host

    local full_url = scheme .. '://' .. host .. uri
    return full_url
end

--GET URL
function _M:get_url()
    local uri = ngx.var.uri
    local scheme = ngx.var.scheme
    local host = ngx.var.host
    local url = scheme .. '://' .. host .. uri
    return url
end

--get real ip
function _M:get_client_ip()
    local client_ip = ngx.req.get_headers()["X_real_ip"]
    if client_ip == nil then
        client_ip = ngx.req.get_headers()["X_Forwarded_For"]
    end
    if client_ip == nil then
        client_ip = ngx.var.remote_addr
    end
    if client_ip == nil then
        client_ip = "unknown"
    end
    return client_ip
end

-- get URI
function _M:get_uri()
    local uri = ngx.var.uri
    return uri
end

-- get arg by name
function _M:get_arg(arg_name)
    local args = ngx.req.get_uri_args()
    return args[arg_name]
end

-- post arg by name
function _M:post_arg(arg_name)
    ngx.req.read_body()
    local args = ngx.req.get_post_args()
    if nil == args then
        return nil
    end
    return args[arg_name]
end


function _M:http_cookie()
    return ngx.var.http_cookie;
end


return _M