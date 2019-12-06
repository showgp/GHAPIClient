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
        XCTAssertEqual(subject.configuration.apiEndpoint, githubBaseURL)
        XCTAssertNil(subject.configuration.accessToken)
        XCTAssertNotNil(subject.session)
    }
    
    func testInitWithConfiguration() {
        let subject = GHAPIClient(configuration: TokenConfiguration("12345", enterpriseURL))
        XCTAssertEqual(subject.configuration.accessToken, "12345")
        XCTAssertEqual(subject.configuration.apiEndpoint, enterpriseURL)
    }
    
    func testUpdateConfiguration() {
        let subject = GHAPIClient()
        let config = TokenConfiguration("23456")
        subject.updateConfiguration(config)
        XCTAssertEqual(subject.configuration.accessToken, "23456")
    }
    
    func testInitWithSessionConfig() {
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = 111
        sessionConfig.timeoutIntervalForResource = 222
        let subject = GHAPIClient(sessionConfig)
        XCTAssertEqual(subject.session.sessionConfiguration.timeoutIntervalForRequest, 111)
        XCTAssertEqual(subject.session.sessionConfiguration.timeoutIntervalForResource, 222)
    }
}
