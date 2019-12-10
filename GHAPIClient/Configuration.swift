//
//  Configuration.swift
//  GHAPIClient
//
//  Created by Rui Peng on 12/6/19.
//  Copyright © 2019 rayy.top. All rights reserved.
//

import Foundation

public protocol Configuration {
    /// 访问 token
    var accessToken: String? { get }
}

struct TokenConfiguration: Configuration {
    
    let accessToken: String?
        
    init(_ accessToken: String? = nil) {
        self.accessToken = accessToken
    }
}

struct OAuthConfiguration: Configuration {
    
    let accessToken: String?
        
    let secret: String
    
    let scopes: [String]
    
    init(_ accessToken: String, secret: String, scopes: [String]) {
        self.accessToken = accessToken
        self.secret = secret
        self.scopes = scopes
    }
}
