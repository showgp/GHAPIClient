//
//  APIEndPoint.swift
//  GHAPIClient
//
//  Created by Rui Peng on 12/10/19.
//  Copyright © 2019 rayy.top. All rights reserved.
//

import Foundation
import Alamofire

protocol APIRouter: URLRequestConvertible {
    var method: HTTPMethod { get }
    var headers: HTTPHeaders? { get }
    var parameters: Parameters? { get }
    var encoding: ParameterEncoding { get }
    /// root endpoint
    var baseURL: URL { get }
    /// api path
    var path: String { get }
    
    func request(with session: Session, interceptor: RequestInterceptor?) -> DataRequest
}

extension APIRouter {
    var baseURL: URL { try! gitHubAPIURL.asURL() }

    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        var request = try URLRequest(url: url, method: method, headers: headers)
        request = try encoding.encode(request, with: parameters)
        return request
    }
    
    func request(with session: Session, interceptor: RequestInterceptor? = nil) -> DataRequest {
        session.request(self, interceptor: interceptor)
    }
}
