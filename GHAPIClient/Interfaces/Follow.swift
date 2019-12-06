//
//  Followers.swift
//  GHAPIClient
//
//  Created by Rui Peng on 12/6/19.
//  Copyright © 2019 rayy.top. All rights reserved.
//

import Foundation
import PromiseKit
import Alamofire

public protocol IFollower {
    /// 获取关注了已授权用户的所有用户列表
    @discardableResult
    func myFollowers() -> Promise<[User]>
    
    /// 获取关注了该用户的所有用户列表
    @discardableResult
    func followers(name: String) -> Promise<[User]>
    
    /// 获取已授权用户关注的所有用户列表
    @discardableResult
    func myFollowing() -> Promise<[User]>
    
    /// 获取某用户关注的所有用户列表
    @discardableResult
    func following() -> Promise<[User]>
}

class Follow: IFollower {
    var session: Session!
    
    init(session: Session = Session.default) {
        self.session = session
    }
    
    @discardableResult
    func myFollowers() -> Promise<[User]> {
        return Promise(resolver: { seal in
            session.request("https://api.github.com/user/followers", method: .get, parameters: ["access_token": "12345"]) .responseJSON(completionHandler: { resp in
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
