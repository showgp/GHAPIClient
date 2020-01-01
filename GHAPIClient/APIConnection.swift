//
//  IAPIConnection.swift
//  GHAPIClient
//
//  Created by Rui Peng on 1/1/20.
//  Copyright © 2020 rayy.top. All rights reserved.
//

import Foundation
import Alamofire

protocol IAPIConnection {
    func request(_ router: APIRouter, interceptor: RequestInterceptor?) -> DataRequest
    func request(_ router: APIRouter) -> DataRequest
}

class APIConnection: IAPIConnection {
    private let _session: Session
    
    init(session: Session) {
        _session = session
    }
    
    func request(_ router: APIRouter, interceptor: RequestInterceptor?) -> DataRequest {
        router.request(with: _session, interceptor: interceptor)
    }
    
    func request(_ router: APIRouter) -> DataRequest {
        router.request(with: _session, interceptor: nil)
    }
}
