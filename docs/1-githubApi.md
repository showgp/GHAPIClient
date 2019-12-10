# GitHub API 概述

根据官方的 V3 版 API 文档编写, 详见[这个链接](https://developer.github.com/v3/).

## 当前版本

当前的 API 版本为 V3, REST API 的 Root endPoint 为 `https://api.github.com`. 推荐在请求头中附加 `Accept: application/vnd.github.v3+json` 来指定使用 V3 版本的 API.

全部 API 访问都通过 `https` 协议进行, 且所有的请求体/响应体数据都使用 `JSON` 格式. JSON 中的空值使用 `null` 表示, 且空值字段仍然会返回.

所有的时间都使用 ISO 8601 格式表示: `YYYY-MM-DDTHH:MM:SSZ`

API 中的数据有两种表达方式: `Summary` 和 `Detailed`.

## 身份认证(Authentication)

如果请求需要认证的接口但请求中没有包含认证信息, 则会收到 `404 Not Found`(为避免信息泄露, 故不使用 `403 Forbidden`).

V3 API 提供两种认证方式:

- Basic authentication: `curl -u "username" https://api.github.com`.
- OAuth2 token (包含在 header 中): `curl -H "Authorization: token OAUTH-TOKEN" https://api.github.com`

> Note: GitHub 推荐使用 OAuth2 token 方式的身份认证. 且使用 `HTTP basic authentication`.

未授权的访问会返回 `401 Unauthorized`:

```sh
curl -i https://api.github.com -u foo:bar
HTTP/1.1 401 Unauthorized
{
  "message": "Bad credentials",
  "documentation_url": "https://developer.github.com/v3"
}
```

如果短时间内进行多次未授权访问, 则会返回 `403 Forbidden`:

```sh
curl -i https://api.github.com -u valid_username:valid_password
HTTP/1.1 403 Forbidden
{
  "message": "Maximum number of login attempts exceeded. Please try again later.",
  "documentation_url": "https://developer.github.com/v3"
}
```

## 请求参数

针对 GET 请求, 任何非 path 参数都可以在 query string 中传递.

针对 POST, PUT, PATCH, DELETE 请求, 不在 URL 中的参数都需要被编码为 JSON, 且设置 `Content-Type` 为 `application/json`.

## Root endpoint

可以在 `https://api.github.com` 上使用 GET 请求获取 V3 API 的所有 endpoint 分类.

## 客户端错误

1. 发送非法的 JSON 数据: `400 Bad Request`
1. 在 JSON 中发送错误类型的数据: `400 Bad Request`
1. 在 JSON 中发送无效的字段: `422 Unprocessable Entity`

响应中携带的错误对象模型如下:

```json
{
  "message": "Validation Failed",
  "errors": [
    {
      "resource": "Issue",
      "field": "title",
      "code": "missing_field"
    }
  ]
}
```

其中 error code 的解释:

- missing: 资源不存在
- missing_field: json 中缺少必填字段
- invalid: json 整体格式不合法
- already_exists: 无法请求到唯一的资源(一般来说都是由于在请求时没有指定唯一的资源 key)