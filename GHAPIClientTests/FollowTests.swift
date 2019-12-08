//
//  FollowTests.swift
//  GHAPIClientTests
//
//  Created by Rui Peng on 12/6/19.
//  Copyright © 2019 rayy.top. All rights reserved.
//

import XCTest
@testable import GHAPIClient
import Alamofire

/**
 主要测试内容:
 
 1. 请求方法
 2. url
 3. 请求参数(query参数,请求头参数, 请求体参数)
 4. 是否正确地反序列化模型
 */

class FollowTests: XCTestCase {
    
    private var sut: Follow!
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testInit() {
        let follow = Follow(configuration: TokenConfiguration())
        XCTAssertNotNil(follow.session)
    }
    
    func testInitWithSession() {
        let session = MockSession(configuration: URLSessionConfiguration.default)
        let sut = Follow(session: session, configuration: TokenConfiguration())
        XCTAssertTrue(session === sut.session)
    }
    
    func testGetMyFollowers() {
        let session = MockSession(configuration: URLSessionConfiguration.default)
        let sut = Follow(session: session, configuration: TokenConfiguration("12345"))
        sut.myFollowers()
        XCTAssertEqual(session.method, .get)
        XCTAssertEqual("\(gitHubAPIURL)/user/followers?access_token=12345", session.url?.absoluteString)
        XCTAssertEqual(session.parameters as! [String: String], ["access_token": "12345"])
    }
}

class MockSession: Session {
    var url: URL?
    var method: HTTPMethod?
    var parameters: Any?
    
    override func request(_ convertible: URLRequestConvertible,
                          interceptor: RequestInterceptor? = nil) -> DataRequest {
        url = try! convertible.asURLRequest().url
        return super.request(convertible, interceptor: interceptor)
    }
    
    override func request(_ convertible: URLConvertible,
                          method: HTTPMethod = .get,
                          parameters: Parameters? = nil,
                          encoding: ParameterEncoding = URLEncoding.default,
                          headers: HTTPHeaders? = nil,
                          interceptor: RequestInterceptor? = nil) -> DataRequest {
        
        
        url = try! convertible.asURL()
        self.method = method
        self.parameters = parameters
        return super.request(convertible,
                             method: method,
                             parameters: parameters,
                             encoding: encoding,
                             headers: headers,
                             interceptor: interceptor)
    }
    
    override func request<Parameters>(_ convertible: URLConvertible,
                                      method: HTTPMethod = .get,
                                      parameters: Parameters? = nil,
                                      encoder: ParameterEncoder = URLEncodedFormParameterEncoder.default,
                                      headers: HTTPHeaders? = nil,
                                      interceptor: RequestInterceptor? = nil) -> DataRequest where Parameters : Encodable {
        url = try! convertible.asURL()
        self.method = method
        self.parameters = parameters
        return super.request(convertible,
                             method: method,
                             parameters: parameters,
                             encoder: encoder,
                             headers: headers,
                             interceptor: interceptor)
    }
}
