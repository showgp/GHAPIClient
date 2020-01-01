//
//  APIClientError.swift
//  GHAPIClient
//
//  Created by Rui Peng on 1/1/20.
//  Copyright © 2020 rayy.top. All rights reserved.
//

import Foundation

public enum APIClientError: Error {
    case requestFailed(msg: String = "")
    case unknown
}
