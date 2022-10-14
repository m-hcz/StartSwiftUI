//
//  UITestingBootcampView_UITest.swift
//  StartSwiftUI_UITests
//
//  Created by M H on 11/10/2022.
//

import XCTest

// naming structure: test_UnitOfWork_StateUnderTest_ExpectedBehavior
// naming structure: test_[struct]_[iu component]_[expected result]

// testing structure: given, when, then

final class UITestingBootcampView_UITest: XCTestCase {

	let app = XCUIApplication()
	
    override func setUpWithError() throws {
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

		// UI tests must launch the application that they test.
		
		//app.launchArguments = ["-UITest_startSignIn"]
		
		app.launch()
    }

    override func tearDownWithError() throws {
       
    }

    func test_UITestingBootcampView_singUpButton_shouldNotSignIn() throws {
		// given
		signUpAndSignIn(shouldTypeOnKeyboard: false)
		
		// when
		let navBar = app.navigationBars["Welcome"]
		
		// then
		XCTAssertFalse(navBar.exists)
    }
	
	func test_UITestingBootcampView_singUpButton_shouldSignIn() throws {
		// given
		signUpAndSignIn(shouldTypeOnKeyboard: true)
		
		
		
		// when
		let navBar = app.navigationBars["Welcome"]
		
		// then
		XCTAssertTrue(navBar.exists)
	}
	
	
	func test_UITestingBootcampView_singInHomeView_showAlertButton_shouldDisplayAlert() throws {
		// given
		signUpAndSignIn(shouldTypeOnKeyboard: true)
		
		// when
		tapAlertbutton(shouldDismissAlert: false)

		// then
		let alert = app.alerts.firstMatch // first alert
		XCTAssertTrue(alert.exists)
	}

	func test_UITestingBootcampView_singInHomeView_showAlertButton_shouldDisplayAndDismissAlert() throws {
		// given
		signUpAndSignIn(shouldTypeOnKeyboard: true)
		
		// when
		tapAlertbutton(shouldDismissAlert: true)
		
		let alertExists = app.alerts.firstMatch.waitForExistence(timeout: 5)
				
		// then
		XCTAssertFalse(alertExists)
	}

	func test_UITestingBootcampView_NavigationLinkToDestination_shouldNavigateToDestination() throws {
		// given
		signUpAndSignIn(shouldTypeOnKeyboard: true)
		
		// when
		tapNavigationLink(shouldDismissDestination: false)
		
		// then
		let destinationText = app.staticTexts["Destination"]
		XCTAssertTrue(destinationText.exists)
	}

	func test_UITestingBootcampView_NavigationLinkToDestination_shouldNavigateToDestinationAndGoBack() throws {
		
		// given
		signUpAndSignIn(shouldTypeOnKeyboard: true)
		
		// when
		tapNavigationLink(shouldDismissDestination: true)
				
		// then
		let navBar = app.navigationBars["Welcome"]
		XCTAssertTrue(navBar.exists)
	}
}

// MARK: functions
extension UITestingBootcampView_UITest {
	func signUpAndSignIn(shouldTypeOnKeyboard:Bool) {
		let textField = app.textFields["SignUpTextField"] // accessibilityIdentifier
		
		textField.tap()
		
		if shouldTypeOnKeyboard {
			let keyA = app.keys["A"]
			keyA.tap()
			let keya = app.keys["a"]
			keya.tap()
			keya.tap()
		}
		
		let returnButton = app.buttons["Return"]
		returnButton.tap()
		
		let signUpbutton = app.buttons["SignUpButton"] // accessibilityIdentifier
		signUpbutton.tap()
	}
	func tapAlertbutton(shouldDismissAlert:Bool) {
		app.buttons["ShowAlertButton"].tap()
		
		if shouldDismissAlert {
			let alert = app.alerts.firstMatch // first alert
			
			let alertOKButton = alert.buttons["OK"]
			//		sleep(1)
			let alertOKButtonExists = alertOKButton.waitForExistence(timeout: 5)
			XCTAssertTrue(alertOKButtonExists)
			
			alertOKButton.tap()
		}
	}
	func tapNavigationLink(shouldDismissDestination:Bool) {
		let navigationLinkbutton = app.buttons["NavigationLinkToDestination"]
		navigationLinkbutton.tap()
		
		if shouldDismissDestination {
			let backButton = app.navigationBars.buttons["Welcome"]
			backButton.tap()
		}
	}
}
