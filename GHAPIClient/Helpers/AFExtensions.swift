//
//  AFExtensions.swift
//  GHAPIClient
//
//  Created by Rui Peng on 12/10/19.
//  Copyright © 2019 rayy.top. All rights reserved.
//

import Foundation
import Alamofire
import PromiseKit

extension AFDataResponse {
    func resolveWith(resolver: PromiseKit.Resolver<Success>) {
        switch self.result {
        case .success(let suc):
            resolver.fulfill(suc)
        case .failure(let error):
            resolver.reject(error)
        }
    }
}

extension DataRequest {
    func decodablePromise<T: Decodable>() -> Promise<T> {
        return Promise { seal in
            responseDecodable { (resp: AFDataResponse<T>) in resp.resolveWith(resolver: seal) }
        }
    }
    
    func stringPromise() -> Promise<String> {
        return Promise { seal in
            responseString { (resp: AFDataResponse<String>) in resp.resolveWith(resolver: seal) }
        }
    }
    
    func dataPromise() -> Promise<Data> {
        return Promise { seal in
            responseData { (resp: AFDataResponse<Data>) in resp.resolveWith(resolver: seal) }
        }
    }
    
    func jsonPromise() -> Promise<Any> {
        return Promise { seal in
            responseJSON { (resp: AFDataResponse<Any>) in resp.resolveWith(resolver: seal) }
        }
    }
}
