//
//  Configuration.swift
//  GHAPIClient
//
//  Created by Rui Peng on 12/6/19.
//  Copyright © 2019 rayy.top. All rights reserved.
//

import Foundation

public let githubBaseURL = "https://api.github.com"
public let githubWebURL = "https://github.com"

public protocol Configuration {
    /// API 节点地址
    var apiEndpoint: String { get }
    /// 访问 token
    var accessToken: String? { get }
}

public struct TokenConfiguration: Configuration {

    public let accessToken: String?
    
    public let apiEndpoint: String
    
    public init(_ accessToken: String? = nil, _ apiEndpoint: String = githubBaseURL) {
        self.accessToken = accessToken
        self.apiEndpoint = apiEndpoint
    }
}

public struct OAuthConfiguration: Configuration {
    
    public let accessToken: String?
    
    public let apiEndpoint: String
    
    public let secret: String
    
    public let scopes: [String]
    
    public init(_ accessToken: String, _ apiEndpoint: String = githubBaseURL, secret: String, scopes: [String]) {
        self.accessToken = accessToken
        self.apiEndpoint = apiEndpoint
        self.secret = secret
        self.scopes = scopes
    }
}
