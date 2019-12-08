//
//  GHAPIClientTests.swift
//  GHAPIClientTests
//
//  Created by Rui Peng on 12/6/19.
//  Copyright © 2019 rayy.top. All rights reserved.
//

import XCTest
@testable import GHAPIClient
import Alamofire

class GHAPIClientTests: XCTestCase {
    func testInitWithEmptyConfiguration() {
        let subject = GHAPIClient()
        XCTAssertNotNil(subject.session)
    }

    func testInitWithSessionConfig() {
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = 111
        sessionConfig.timeoutIntervalForResource = 222
        let subject = GHAPIClient(sessionConfig)
        XCTAssertEqual(subject.session.sessionConfiguration.timeoutIntervalForRequest, 111)
        XCTAssertEqual(subject.session.sessionConfiguration.timeoutIntervalForResource, 222)
    }
    
    func testGetFollowerClient() {
//        let subject = GHAPIClient()
//        let followerClient = subject.follow
//        XCTAssertNotNil(followerClient)
    }
}
