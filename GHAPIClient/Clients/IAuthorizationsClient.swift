//
//  IAuthorizationsClient.swift
//  GHAPIClient
//
//  Created by Rui Peng on 12/8/19.
//  Copyright © 2019 rayy.top. All rights reserved.
//

import Foundation
import RxSwift

public protocol IAuthorizationsClient {
    func getAll() -> Single<[Authorization]>
}
