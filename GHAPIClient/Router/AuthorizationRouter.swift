//
//  AuthorizationEndPoint.swift
//  GHAPIClient
//
//  Created by Rui Peng on 12/10/19.
//  Copyright © 2019 rayy.top. All rights reserved.
//

import Foundation
import Alamofire

enum AuthorizationRouter: APIRouter {        
    case getAll

    var method: HTTPMethod {
        switch self {
        case .getAll:
            return .get
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
    
    var parameters: Parameters? {
        return nil
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .getAll: return URLEncoding.default
        }
    }
    
    var path: String {
        switch self {
        case .getAll:
            return "/authorizations"
        }
    }
}
