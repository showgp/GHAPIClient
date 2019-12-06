//
//  GHAPIClient.swift
//  GHAPIClient
//
//  Created by Rui Peng on 12/6/19.
//  Copyright © 2019 rayy.top. All rights reserved.
//

import Foundation
import Alamofire

public class GHAPIClient {
    public internal(set) var configuration: Configuration
    var session: Session!
    
    public init(configuration: Configuration = TokenConfiguration(),
                _ sessionConfig: URLSessionConfiguration? = nil) {
        self.configuration = configuration
        if let sessionConfig = sessionConfig {
            session = Session(configuration: sessionConfig)
        } else {
            session = Session.default
        }
    }
    
    public func updateConfiguration(_ config: Configuration) {
        configuration = config
    }
}
