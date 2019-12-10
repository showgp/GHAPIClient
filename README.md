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

更多内容详见 `docs` 目录中的文档.
