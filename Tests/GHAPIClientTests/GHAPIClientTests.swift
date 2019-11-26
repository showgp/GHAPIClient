import XCTest
@testable import GHAPIClient
import PromiseKit

final class GHAPIClientTests: XCTestCase {
    
    private var _sut: IAPIClient!
    
    override func setUp() {
        super.setUp()
        _sut = GHAPIClient.apiClient
    }
    
    override func tearDown() {
        super.tearDown()
        _sut = nil
    }
    
    func testExample() {
        
    }
    
    func testOrgClient() {
        let exp = expectation(description: "获取结果")
        _sut.orgsClient.getOctoKitRepos(completion: { result in
            exp.fulfill()
            switch result {
            case .fulfilled(let info):
                XCTAssertTrue(info.id > 0)
                XCTAssertTrue(!(info.name.isEmpty))
                XCTAssertNotNil(info.createdDate)
                XCTAssertNotNil(info.updatedDate)
                XCTAssertNotNil(info.pushedDate)
            case .rejected(let error):
                XCTFail(error.localizedDescription)
            }
        })
        waitForExpectations(timeout: 10, handler: nil)
    }

    static var allTests = [
        ("testExample", testExample),
        ("testOrgClient", testOrgClient),
    ]
}
