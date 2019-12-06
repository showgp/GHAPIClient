//
//  GHAPIClientTests.swift
//  GHAPIClientTests
//
//  Created by Rui Peng on 12/6/19.
//  Copyright © 2019 rayy.top. All rights reserved.
//

import XCTest
@testable import GHAPIClient

class GHAPIClientTests: XCTestCase {
    func testInitWithEmptyConfiguration() {
        let subject = GHAPIClient()
        XCTAssertEqual(subject.configuration.apiEndpoint, githubBaseURL)
    }
    
    func testInitWithConfiguration() {
        let subject = GHAPIClient(configuration: TokenConfiguration("12345", enterpriseURL))
        XCTAssertEqual(subject.configuration.accessToken, "12345")
        XCTAssertEqual(subject.configuration.apiEndpoint, enterpriseURL)
    }
}
