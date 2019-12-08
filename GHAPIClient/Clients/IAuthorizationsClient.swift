//
//  IAuthorizationsClient.swift
//  GHAPIClient
//
//  Created by Rui Peng on 12/8/19.
//  Copyright © 2019 rayy.top. All rights reserved.
//

import Foundation
import PromiseKit

public protocol IAuthorizationsClient {
    func getAll() -> Promise<[Authorization]>
}
