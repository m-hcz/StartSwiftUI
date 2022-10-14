//
//  UnitTestingBootcampViewModel_Test.swift
//  StartSwiftUI_Tests
//
//  Created by M H on 08/10/2022.
//

import XCTest
import Combine
@testable import StartSwiftUI

// naming structure: test_UnitOfWork_StateUnderTest_ExpectedBehavior
// naming structure: test_[struct or class]_[variable or function]_[expected result]

// testing structure: given, when, then

final class UnitTestingBootcampViewModel_Test: XCTestCase {

	var viewModel: UnitTestingBootcampViewModel?
	var cancellables = Set<AnyCancellable>()
	
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
		viewModel = UnitTestingBootcampViewModel(isPremium: Bool.random())

    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
		viewModel = nil
    }

	func test_UnitTestingBootcampViewModel_isPremium_shouldBeTrue() {
		// given
		let userIsPremium:Bool = true
		// when
		let vm = UnitTestingBootcampViewModel(isPremium: userIsPremium)
		// then
		XCTAssertTrue(vm.isPremium)
	}
	
	func test_UnitTestingBootcampViewModel_isPremium_shouldBeFalse() {
		// given
		let userIsPremium:Bool = false
		// when
		let vm = UnitTestingBootcampViewModel(isPremium: userIsPremium)
		// then
		XCTAssertFalse(vm.isPremium)
	}
	
	func test_UnitTestingBootcampViewModel_isPremium_shouldBeInjectedValue() {
		// given
		let userIsPremium:Bool = Bool.random()
		// when
		let vm = UnitTestingBootcampViewModel(isPremium: userIsPremium)
		// then
		XCTAssertEqual(vm.isPremium, userIsPremium)
	}
	
	func test_UnitTestingBootcampViewModel_isPremium_shouldBeInjectedValue_stress() {
		for _ in 0..<10 {
			// given
			let userIsPremium:Bool = Bool.random()
			// when
			let vm = UnitTestingBootcampViewModel(isPremium: userIsPremium)
			// then
			XCTAssertEqual(vm.isPremium, userIsPremium)
		}
	}
	
	func test_UnitTestingBootcampViewModel_dataArray_shouldBeEmpty() {
		// when
		let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())
		// then
		XCTAssertTrue(vm.dataArray.isEmpty)
		XCTAssertEqual(vm.dataArray.count, 0)
	}
	
	func test_UnitTestingBootcampViewModel_dataArray_shouldAddItems() {
		// given
		let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())
		// when
		let loopCount: Int = Int.random(in: 1..<100)
		for _ in 0..<loopCount {
			vm.addItem(item: UUID().uuidString)
		}
		// then
		XCTAssertTrue(!vm.dataArray.isEmpty)
		XCTAssertEqual(vm.dataArray.count, loopCount)
		XCTAssertNotEqual(vm.dataArray.count, 0)
		XCTAssertGreaterThan(vm.dataArray.count, 0)
	}
	
	func test_UnitTestingBootcampViewModel_dataArray_shouldNotAddBlankString() {
		// given
		let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())
		// when
		vm.addItem(item: "")
		// then
		XCTAssertTrue(vm.dataArray.isEmpty)
	}
	func test_UnitTestingBootcampViewModel_dataArray_shouldNotAddBlankString2() {
		// given
		guard let vm = viewModel else {
			XCTFail()
			return
		}
		// when
		vm.addItem(item: "")
		// then
		XCTAssertTrue(vm.dataArray.isEmpty)
	}
	
	func test_UnitTestingBootcampViewModel_selectedItem_shouldStartAsNil() {
		// given
		
		// when
		let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())
		// then
		XCTAssertNil(vm.selectedItem)
	}
	
	func test_UnitTestingBootcampViewModel_selectedItem_shouldBeNilWhenSelectingInvalidItem() {
		// given
		let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())
		// when
		// select valid item
		let newItem = UUID().uuidString
		vm.addItem(item: newItem)
		vm.selectItem(item: newItem)
		
		// select invalid item
		vm.selectItem(item: UUID().uuidString)
		// then
		XCTAssertNil(vm.selectedItem)
	}
	
	func test_UnitTestingBootcampViewModel_selectedItem_shouldBeSelected() {
		// given
		let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())
		// when
		let newItem = UUID().uuidString
		vm.addItem(item: newItem)
		vm.selectItem(item: newItem)
		// then
		XCTAssertNotNil(vm.selectedItem)
		XCTAssertEqual(vm.selectedItem, newItem)
	}
	
	func test_UnitTestingBootcampViewModel_selectedItem_shouldBeSelected_stress() {
		// given
		let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())
		// when
		let loopCount: Int = Int.random(in: 1..<100)
		var itemsArray: [String] = []
		for _ in 0..<loopCount {
			let newItem = UUID().uuidString
			vm.addItem(item: newItem)
			itemsArray.append(newItem)
		}
		
		let randomItem = itemsArray.randomElement() ?? ""
		vm.selectItem(item: randomItem)
		// then
		XCTAssertNotNil(vm.selectedItem)
		XCTAssertEqual(vm.selectedItem, randomItem)
	}
	
	func test_UnitTestingBootcampViewModel_saveItem_shouldThrowError_itemNotFound() {
		// given
		let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())
		// when
		let loopCount: Int = Int.random(in: 1..<100)
		for _ in 0..<loopCount {
			vm.addItem(item: UUID().uuidString)
		}
		// then
		XCTAssertThrowsError(try vm.saveItem(item: UUID().uuidString))
		XCTAssertThrowsError(try vm.saveItem(item: UUID().uuidString), "Should throw Item Not found error!") {error in
			let returnedError = error as? UnitTestingBootcampViewModel.DataError
			XCTAssertEqual(returnedError, UnitTestingBootcampViewModel.DataError.itemNotFound)
		}
	}
	
	func test_UnitTestingBootcampViewModel_saveItem_shouldThrowError_noData() {
		// given
		let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())
		// when
		let loopCount: Int = Int.random(in: 1..<100)
		for _ in 0..<loopCount {
			vm.addItem(item: UUID().uuidString)
		}
		// then
		XCTAssertThrowsError(try vm.saveItem(item: ""))
		XCTAssertThrowsError(try vm.saveItem(item: ""), "Should throw Item Not found error!") {error in
			let returnedError = error as? UnitTestingBootcampViewModel.DataError
			XCTAssertEqual(returnedError, UnitTestingBootcampViewModel.DataError.noData)
		}
	}
	
	func test_UnitTestingBootcampViewModel_saveItem_shouldSaveItem() {
		// given
		let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())
		// when
		let loopCount: Int = Int.random(in: 1..<100)
		var itemsArray: [String] = []
		for _ in 0..<loopCount {
			let newItem = UUID().uuidString
			vm.addItem(item: newItem)
			itemsArray.append(newItem)
		}
		
		let randomItem = itemsArray.randomElement() ?? ""

		// then
		XCTAssertFalse(randomItem.isEmpty)
		XCTAssertNoThrow(try vm.saveItem(item: randomItem))
	}
	
	func test_UnitTestingBootcampViewModel_downloadWithEscaping_shouldReturnItems() {
		// given
		let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())
		// when
		let expectation = XCTestExpectation(description: "should return items after 3 seconds")
		
		vm.$dataArray
			.dropFirst()
			.sink { returnedItems in
				expectation.fulfill()
			}
			.store(in: &cancellables)
		
		vm.downloadWithEscaping()
		
		// then
		wait(for: [expectation], timeout: 5)
		XCTAssertGreaterThan(vm.dataArray.count, 0)
	}
	
	func test_UnitTestingBootcampViewModel_downloadWithCombine_shouldReturnItems() {
		// given
		let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())
		// when
		let expectation = XCTestExpectation(description: "should return items after 3 seconds")
		
		vm.$dataArray
			.dropFirst()
			.sink { returnedItems in
				expectation.fulfill()
			}
			.store(in: &cancellables)
		
		vm.downloadWithCombine()
		
		// then
		wait(for: [expectation], timeout: 5)
		XCTAssertGreaterThan(vm.dataArray.count, 0)
	}

}
