//
//  NewMockDataService_Test.swift
//  StartSwiftUI_Tests
//
//  Created by M H on 08/10/2022.
//

import XCTest
import Combine
@testable import StartSwiftUI

final class NewMockDataService_Test: XCTestCase {

	var cancellable = Set<AnyCancellable>()
	
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
		cancellable.removeAll()
    }

	func test_NewMockDataService_init_setValuescorrectly() {
		// given
		let items: [String]? = nil
		let items2: [String]? = []
		let items3: [String]? = [UUID().uuidString, UUID().uuidString]
		// when
		let dc = NewMockDataService(items: items)
		let dc2 = NewMockDataService(items: items2)
		let dc3 = NewMockDataService(items: items3)
		// then
		XCTAssertFalse(dc.items.isEmpty)
		XCTAssertTrue(dc2.items.isEmpty)
		XCTAssertEqual(dc3.items.count, items3?.count)
	}
	
	func test_NewMockDataService_downloadItemsWithEscaping_returnValues() {
		// given
		let dc = NewMockDataService(items: nil)
		// when
		let expectation = XCTestExpectation()
		var items: [String] = []
		
		dc.downloadItemsWithEscaping { returnedItems in
			expectation.fulfill()
			items = returnedItems
		}
		// then
		wait(for: [expectation], timeout: 5)
		XCTAssertEqual(items.count, dc.items.count)
	}
	
	func test_NewMockDataService_downloadItemsWithCombine_returnValues() {
		// given
		let dc = NewMockDataService(items: nil)
		// when
		let expectation = XCTestExpectation()
		var items: [String] = []
		
		dc.downloadItemsWithCombine()
			.sink { completion in
				switch completion {
					case .finished:
						expectation.fulfill()
					case .failure:
						XCTFail()
				}
			} receiveValue: { returnedItems in
				items = returnedItems
			}
			.store(in: &cancellable)

		dc.downloadItemsWithEscaping { returnedItems in
			items = returnedItems
		}
		// then
		wait(for: [expectation], timeout: 5)
		XCTAssertEqual(items.count, dc.items.count)
	}
	
	func test_NewMockDataService_downloadItemsWithCombine_doesFail() {
		// given
		let dc = NewMockDataService(items: [])
		// when
		let expectation = XCTestExpectation(description: "it does throw en error")
		let expectation2 = XCTestExpectation(description: "it does throw URLError.badServerResponse")
		var items: [String] = []
		
		dc.downloadItemsWithCombine()
			.sink { completion in
				switch completion {
					case .finished:
						XCTFail()
					case .failure(let error):
						expectation.fulfill()

						if error as? URLError == URLError(.badServerResponse) {
							expectation2.fulfill()
						}
				}
			} receiveValue: { returnedItems in
				items = returnedItems
			}
			.store(in: &cancellable)
		
		dc.downloadItemsWithEscaping { returnedItems in
			items = returnedItems
		}
		// then
		wait(for: [expectation, expectation2], timeout: 5)
		XCTAssertEqual(items.count, dc.items.count)
	}

}
