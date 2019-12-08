//
//  Configuration.swift
//  GHAPIClient
//
//  Created by Rui Peng on 12/6/19.
//  Copyright © 2019 rayy.top. All rights reserved.
//

import Foundation

public protocol Configuration {
    /// API 节点地址
    var apiEndpoint: String { get }
    /// 访问 token
    var accessToken: String? { get }
}

struct TokenConfiguration: Configuration {
    
    let accessToken: String?
    
    let apiEndpoint: String
    
    init(_ accessToken: String? = nil, _ apiEndpoint: String = gitHubAPIURL) {
        self.accessToken = accessToken
        self.apiEndpoint = apiEndpoint
    }
}

struct OAuthConfiguration: Configuration {
    
    let accessToken: String?
    
    let apiEndpoint: String
    
    let secret: String
    
    let scopes: [String]
    
    init(_ accessToken: String, _ apiEndpoint: String = gitHubAPIURL, secret: String, scopes: [String]) {
        self.accessToken = accessToken
        self.apiEndpoint = apiEndpoint
        self.secret = secret
        self.scopes = scopes
    }
}
