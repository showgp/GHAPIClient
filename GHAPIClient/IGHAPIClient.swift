//
//  IGHAPIClient.swift
//  GHAPIClient
//
//  Created by Rui Peng on 12/8/19.
//  Copyright © 2019 rayy.top. All rights reserved.
//

import Foundation
import Alamofire

var currentClient: IGHAPIClient?

public func makeClient(sessionConfig: URLSessionConfiguration? = nil) -> IGHAPIClient {
    let client = GHAPIClient(sessionConfig)
    currentClient = client
    return client
}
