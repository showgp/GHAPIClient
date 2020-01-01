//
//  AuthorizationsClient.swift
//  GHAPIClient
//
//  Created by Rui Peng on 12/8/19.
//  Copyright © 2019 rayy.top. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

class AuthorizationsClient: IAuthorizationsClient {
    private let _connection: IAPIConnection
    
    init(connection: IAPIConnection) {
        _connection = connection
    }
    
    func getAll() -> Single<[Authorization]> {
        _connection.request(AuthorizationRouter.getAll).gRx.decodable()
    }
}
