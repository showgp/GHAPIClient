//
//  GHAPIClient.swift
//  GHAPIClient
//
//  Created by Rui Peng on 12/6/19.
//  Copyright © 2019 rayy.top. All rights reserved.
//

import Foundation
import Alamofire

/// GitHub root endpoint.
let gitHubAPIURL = "https://api.github.com"

/// GitHub web page URL.
let gitHubURL = "https://github.com"

/// 向外提供接口请求入口, 根据功能进行分离, 同时持有请求时候的配置对象 `Configuration`.
public protocol IGHAPIClient {
    /// 可以使用这个 Session 来执行额外需要的网络请求.
    var session: Session { get }
    
    var authorization: IAuthorizationsClient { get }
}

class GHAPIClient: IGHAPIClient {
    var session: Session
    
    var authorization: IAuthorizationsClient

    init(_ sessionConfig: URLSessionConfiguration? = nil) {
        if let sessionConfig = sessionConfig {
            session = Session(configuration: sessionConfig)
        } else {
            session = Session.default
        }
        authorization = AuthorizationsClient(session: session)
    }
}
