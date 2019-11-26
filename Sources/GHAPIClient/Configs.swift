//
//  Configs.swift
//  DAModule
//
//  Created by Rui Peng on 11/26/19.
//  Copyright © 2019 rayy.top. All rights reserved.
//

import Foundation

/// 服务端请求配置
struct ServerConfig {
    /// 请求基地址
    static let baseURL = "https://api.github.com"
    
    /// 请求超时
    static let timeoutIntervalForRequest = 5.0
    
    /// 响应超时
    static let timeoutIntervalForResource = 5.0
}

/// 组装请求地址
func apiURLOf(path: String) -> String {
    return ServerConfig.baseURL + path
}

struct APIPath {
    static let octoRepos = "/orgs/octokit/repos"
}
