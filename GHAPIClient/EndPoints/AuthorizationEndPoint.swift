//
//  AuthorizationEndPoint.swift
//  GHAPIClient
//
//  Created by Rui Peng on 12/10/19.
//  Copyright © 2019 rayy.top. All rights reserved.
//

import Foundation
import Alamofire

enum AuthorizationEndPoint: APIEndPoint {
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
    
    var encoder: ParameterEncoder {
        return JSONParameterEncoder()
    }
    
    var path: String {
        switch self {
        case .getAll:
            return ""
        }
    }
}
