//
//  GHAPIClientFactoryTests.swift
//  GHAPIClientTests
//
//  Created by Rui Peng on 12/8/19.
//  Copyright © 2019 rayy.top. All rights reserved.
//

import XCTest
@testable import GHAPIClient

class GHAPIClientFactoryTests: XCTestCase {
    func testMakeClientWithArguments() {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForResource = 5
        config.timeoutIntervalForRequest = 4
        let client = makeClient(sessionConfig: config)
        XCTAssertEqual(5, client.session.sessionConfiguration.timeoutIntervalForResource)
        XCTAssertEqual(4, client.session.sessionConfiguration.timeoutIntervalForRequest)
    }
}
