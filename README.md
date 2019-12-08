# GHAPIClient

一个 Github V3 API 客户端, 使用 `Alamofire` 作为底层网络请求框架.

用作练习目的:

1. 封装并隔离变化.

1. 针对接口而非实现编程

1. 多用组合少用继承.

1. 交互对象之间尽力松耦合.

## 预期客户使用代码

```swift
let client = makeClient()
let users = client.follow.followers(name: "showgp") // Promise<[User]>
```

## 关注的问题

1. 网络请求的配置和参数变化不要影响到网络请求代码, 想要的是传入请求的配置, 请求代码直接请求并拿回响应. 故如何把请求配置和请求代码分离?

1. 解决 ApiURL 的生成问题.

## 附: Github V3 API 相关信息

Github V3 API 使用的授权方式
