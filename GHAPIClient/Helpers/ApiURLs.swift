//
//  ApiURLs.swift
//  GHAPIClient
//
//  Created by Rui Peng on 12/8/19.
//  Copyright © 2019 rayy.top. All rights reserved.
//

import Foundation
import Alamofire

struct ApiURLs {
    private static let _authorizationsEndpoint = "/authorizations"
    
    static func url(path: String) -> URL? {
        URL(string: gitHubAPIURL)?.appendingPathComponent(path)
    }
}

// MARK: - authorizations
extension ApiURLs {
    static func authorizations() -> URL? {
        url(path: _authorizationsEndpoint)
    }
}
