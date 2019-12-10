//
//  APIEndPoint.swift
//  GHAPIClient
//
//  Created by Rui Peng on 12/10/19.
//  Copyright © 2019 rayy.top. All rights reserved.
//

import Foundation
import Alamofire

protocol APIEndPoint: URLRequestConvertible {
    func request(with session: Session, interceptor: RequestInterceptor?) -> DataRequest
    
    var method: HTTPMethod { get }
    var headers: HTTPHeaders? { get }
    var parameters: Parameters? { get }
    var encoder: ParameterEncoder { get }
    
    var baseURL: URL { get }
    
    var path: String { get }
}

extension APIEndPoint {
    var baseURL: URL { try! gitHubAPIURL.asURL() }

    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        let request = try URLRequest(url: url, method: method, headers: headers)
        return request
//        return try parameters.map { try encoder.encode($0, into: request) } ?? request
    }
    
    func request(with session: Session, interceptor: RequestInterceptor? = nil) -> DataRequest {
        session.request(self, interceptor: interceptor)
    }
}
