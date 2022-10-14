//
//  UITestingBootcampView.swift
//  StartSwiftUI
//
//  Created by M H on 11/10/2022.
//

import SwiftUI

class UITestingBootcampViewModel: ObservableObject {
	let placeholderText:String = "Add our name..."
	@Published var text:String = ""
	@Published var currentuserIsSignIn:Bool
	
	init(currentuserIsSignIn: Bool) {
		self.currentuserIsSignIn = currentuserIsSignIn
	}
	
	func signUpButtonPressed() {
		guard !text.isEmpty else {return}
		
		currentuserIsSignIn = true
	}
}

struct UITestingBootcampView: View {
	
	@StateObject private var vm: UITestingBootcampViewModel
	
	init(currentuserIsSignIn: Bool) {
		self._vm = StateObject(wrappedValue: UITestingBootcampViewModel(currentuserIsSignIn: currentuserIsSignIn))
	}
	
    var body: some View {
		ZStack {
			LinearGradient(colors: [Color.blue, Color.black], startPoint: .topLeading, endPoint: .bottomTrailing)
				.ignoresSafeArea()
			
			ZStack {
				if vm.currentuserIsSignIn {
					SignInHomeView()
						.frame(maxWidth: .infinity, maxHeight: .infinity)
						.transition(.move(edge: .trailing))
				} else {
					signUpLayer
						.frame(maxWidth: .infinity, maxHeight: .infinity)
						.transition(.move(edge: .leading))
				}
			}
			
		}
    }
}

struct UITestingBootcampView_Previews: PreviewProvider {
    static var previews: some View {
		UITestingBootcampView(currentuserIsSignIn: true)
    }
}

extension UITestingBootcampView {
	private var signUpLayer: some View {
		VStack {
			TextField(vm.placeholderText, text: $vm.text)
				.font(.headline)
				.foregroundColor(.gray)
				.padding()
				.background(.white)
				.cornerRadius(10)
				.accessibilityIdentifier("SignUpTextField") // for UI test
			
			Button {
				withAnimation(.spring()) {
					vm.signUpButtonPressed()
				}
			} label: {
				Text("Sign Up")
					.font(.headline)
					.padding()
					.frame(maxWidth: .infinity)
					.foregroundColor(.white)
					.background(.blue)
					.cornerRadius(10)
			}
			.accessibilityIdentifier("SignUpButton") // for UI test
			
		}
		.padding()
	}
}

struct SignInHomeView:View {
	@State private var showAlert: Bool = false
	var body: some View {
		NavigationView {
			VStack(spacing: 20) {
				Button {
					showAlert.toggle()
				} label: {
					Text("Show welcome alert!")
						.font(.headline)
						.padding()
						.frame(maxWidth: .infinity)
						.foregroundColor(.white)
						.background(.red)
						.cornerRadius(10)
				}
				.alert(isPresented: $showAlert) {
					return Alert(title: Text("Welcome to the app!"))
				}
				.accessibilityIdentifier("ShowAlertButton") // for UI test

				NavigationLink {
					Text("Destination")
				} label: {
					Text("Navigation")
						.font(.headline)
						.padding()
						.frame(maxWidth: .infinity)
						.foregroundColor(.white)
						.background(.blue)
						.cornerRadius(10)
				}
				.accessibilityIdentifier("NavigationLinkToDestination") // for UI test

			}
			.padding()
			.navigationTitle("Welcome")
		}
	}
}
