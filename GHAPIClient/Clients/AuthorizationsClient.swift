//
//  AuthorizationsClient.swift
//  GHAPIClient
//
//  Created by Rui Peng on 12/8/19.
//  Copyright © 2019 rayy.top. All rights reserved.
//

import Foundation
import Alamofire
import PromiseKit

class AuthorizationsClient: IAuthorizationsClient {
    private let _session: Session
    
    init(session: Session) {
        _session = session
    }
    
    func getAll() -> Promise<[Authorization]> {
        _session.request(ApiURLs.authorizations()!).decodablePromise()
    }
}
