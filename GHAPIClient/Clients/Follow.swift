//
//  Follow.swift
//  GHAPIClient
//
//  Created by Rui Peng on 12/8/19.
//  Copyright © 2019 rayy.top. All rights reserved.
//

import Foundation
import Alamofire
import PromiseKit

class Follow: IFollower {
    var session: Session!
    var configuration: Configuration
    
    init(session: Session = Session.default, configuration: Configuration) {
        self.session = session
        self.configuration = configuration
    }
    
    @discardableResult
    func myFollowers() -> Promise<[User]> {
        return Promise(resolver: { seal in
            session.request("\(configuration.apiEndpoint)/user/followers",
                            method: .get,
                            parameters: ["access_token": configuration.accessToken])
                .responseJSON(completionHandler: { resp in
                    seal.fulfill([])
                })
        })
    }
    
    @discardableResult
    func followers(name: String) -> Promise<[User]> {
        fatalError()
    }
    
    @discardableResult
    func myFollowing() -> Promise<[User]> {
        fatalError()
    }
    
    @discardableResult
    func following() -> Promise<[User]> {
        fatalError()
    }
    
}
