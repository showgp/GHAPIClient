//
//  GHAPIClient.swift
//  GHAPIClient
//
//  Created by Rui Peng on 12/6/19.
//  Copyright © 2019 rayy.top. All rights reserved.
//

import Foundation

public struct GHAPIClient {
    public let configuration: TokenConfiguration
    
    public init(configuration: TokenConfiguration = TokenConfiguration()) {
        self.configuration = configuration
    }
}
