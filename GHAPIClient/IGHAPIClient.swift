//
//  IGHAPIClient.swift
//  GHAPIClient
//
//  Created by Rui Peng on 12/8/19.
//  Copyright © 2019 rayy.top. All rights reserved.
//

import Foundation
import Alamofire

public func makeClient(sessionConfig: URLSessionConfiguration? = nil) -> IGHAPIClient { GHAPIClient(sessionConfig) }
