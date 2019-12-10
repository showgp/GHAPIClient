//
//  ConfigurationTests.swift
//  GHAPIClientTests
//
//  Created by Rui Peng on 12/6/19.
//  Copyright © 2019 rayy.top. All rights reserved.
//

import XCTest
@testable import GHAPIClient

let enterpriseURL = "https://enterprise.myserver.com"

class ConfigurationTests: XCTestCase {
    func testTokenConfiguration() {
        let subject = TokenConfiguration("12345")
        XCTAssertEqual(subject.accessToken, "12345")
    }
    
    func testEmptyConfiguration() {
        let subject = TokenConfiguration()
        XCTAssertNil(subject.accessToken)
    }
    
    func testEnterpriseTokenConfiguration() {
        let subject = TokenConfiguration("12345")
        XCTAssertEqual(subject.accessToken, "12345")
    }
    
    func testOAuthConfiguration() {
        let subject = OAuthConfiguration("12345", secret: "6789", scopes: ["repo", "read:org"])
        XCTAssertEqual(subject.accessToken, "12345")
        XCTAssertEqual(subject.secret, "6789")
    }
    
    func testOAuthTokenConfiguration() {
        let subject = OAuthConfiguration("12345",secret: "6789", scopes: ["repo", "read:org"])
        XCTAssertEqual(subject.accessToken, "12345")
        XCTAssertEqual(subject.secret, "6789")
    }
}
