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
        return Promise { seal in
            self._session.request(ApiURLs.authorizations()!).responseData { resp in
                switch resp.result {
                case .success(let data):
                    let list = try? JSONDecoder().decode([Authorization].self, from: data)
                    seal.fulfill(list ?? [])
                case .failure(let error):
                    seal.reject(error)
                }
            }
        }
    }
}
