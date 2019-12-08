//
//  IFollower.swift
//  GHAPIClient
//
//  Created by Rui Peng on 12/6/19.
//  Copyright © 2019 rayy.top. All rights reserved.
//

import Foundation
import PromiseKit

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
