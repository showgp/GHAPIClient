//
//  ApiURLsTests.swift
//  GHAPIClientTests
//
//  Created by Rui Peng on 12/8/19.
//  Copyright © 2019 rayy.top. All rights reserved.
//

import XCTest
@testable import GHAPIClient

class ApiURLsTests: XCTestCase {
    func testAuthrizationURL() {
        let url = ApiURLs.authorizations()
        XCTAssertEqual("\(gitHubAPIURL)/authorizations", url?.absoluteString)
    }
}
