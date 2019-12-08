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
