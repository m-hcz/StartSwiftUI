//
//  StartSwiftUIApp.swift
//  StartSwiftUI
//
//  Created by M H on 02/09/2022.
//

import SwiftUI

@main
struct StartSwiftUIApp: App {
	
	let currentuserIsSignIn: Bool
	
	init() {
		
//		let userIsSignIn:Bool = CommandLine.arguments.contains("-UITest_startSignIn") ? true : false
		let userIsSignIn:Bool = ProcessInfo.processInfo.arguments.contains("-UITest_startSignIn") ? true : false
		self.currentuserIsSignIn = userIsSignIn
//		print("user is sign in: \(userIsSignIn)")
	}
	
    var body: some Scene {
        WindowGroup {
			UITestingBootcampView(currentuserIsSignIn: currentuserIsSignIn)
        }
    }
}
