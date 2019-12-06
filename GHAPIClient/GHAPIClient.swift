//
//  GHAPIClient.swift
//  GHAPIClient
//
//  Created by Rui Peng on 12/6/19.
//  Copyright © 2019 rayy.top. All rights reserved.
//

import Foundation
import Alamofire

public protocol IGHAPIClient {
    var follower: IFollower! { get }
}

class GHAPIClient: IGHAPIClient {
    var configuration: Configuration
    var session: Session!
    
    var follower: IFollower!
    
    init(configuration: Configuration = TokenConfiguration(),
                _ sessionConfig: URLSessionConfiguration? = nil) {
        self.configuration = configuration
        if let sessionConfig = sessionConfig {
            session = Session(configuration: sessionConfig)
        } else {
            session = Session.default
        }
        follower = Follow(session: session)
    }
    
    func updateConfiguration(_ config: Configuration) {
        configuration = config
    }
}
