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
        let follow = Follow()
        XCTAssertNotNil(follow.session)
    }
    
    func testInitWithSession() {
        let session = Session(configuration: URLSessionConfiguration.default)
        let sut = Follow(session: session)
        XCTAssertTrue(session === sut.session)
    }
}
