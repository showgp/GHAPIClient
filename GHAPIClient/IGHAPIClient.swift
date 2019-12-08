//
//  IGHAPIClient.swift
//  GHAPIClient
//
//  Created by Rui Peng on 12/8/19.
//  Copyright © 2019 rayy.top. All rights reserved.
//

import Foundation
import Alamofire

public func makeClient(sessionConfig: URLSessionConfiguration? = nil) -> IGHAPIClient {
    return GHAPIClient(sessionConfig)
}

/// 向外提供接口请求入口, 根据功能进行分离, 同时持有请求时候的配置对象 `Configuration`.
public protocol IGHAPIClient {
    /// 可以使用这个 Session 来执行额外需要的网络请求.
    var session: Session { get }
    
    var authorization: IAuthorizationsClient { get }
}
