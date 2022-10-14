//
//  OnBoardingView.swift
//  StartSwiftUI
//
//  Created by M H on 04/09/2022.
//

import SwiftUI

struct OnBoardingView: View {
	
	// onboarding states:
	/*
	 0 - welcome screen
	 1 - add name
	 2 - add age
	 3 - add gender
	 */
	@State var onBoardingState:Int = 0
	
	let transition: AnyTransition = .asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading))
	
	// inputs
	@State var name:String = ""
	@State var age:Double = 20
	@State var gender:String = ""
	
	// alert
	@State var aletrTitle:String = ""
	@State var showalert:Bool = false
	
	// appstorage
	@AppStorage("name") var currnetUserName:String?
	@AppStorage("age") var currnetUserAge:Int?
	@AppStorage("gender") var currnetUserGender:String?
	@AppStorage("signed_in") var currentUserSignedIn:Bool = false // default false
	
    var body: some View {
		ZStack {
			// content
			ZStack {
				switch onBoardingState {
					case 0:
						welcomeSection
							.transition(transition)
					case 1 :
						addNameSection
							.transition(transition)
					case 2:
						addAgeSection
							.transition(transition)
					case 3:
						addGenderSection
							.transition(transition)
					default:
						RoundedRectangle(cornerRadius: 25)
							.foregroundColor(.green)
				}
			}
			// buttons
			VStack {
				Spacer()
				bottomButton
			}
			.padding(30)
		}
		.alert(isPresented: $showalert) {
			return Alert(title: Text(aletrTitle))
		}
    }
	
	
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
			.background(.purple)
    }
}

// MARK: Components
extension OnBoardingView {
	private var bottomButton: some View {
		Text(onBoardingState == 0 ? "Sign up".uppercased() : onBoardingState == 3 ? "Finish".uppercased() : "Next".uppercased())
			.font(.headline)
			.foregroundColor(.purple)
			.frame(height: 55)
			.frame(maxWidth: .infinity)
			.background(.white)
			.cornerRadius(10)
			.animation(nil)
			.onTapGesture {
				handleNextButtonPressed()
			}
	}
	
	private var welcomeSection:some View {
		VStack(spacing: 40) {
			Spacer()
			Image(systemName: "heart.text.square.fill")
				.resizable()
				.scaledToFit()
				.frame(width: 200, height: 200)
				.foregroundColor(.white)
			Text("Find your match.")
				.font(.largeTitle)
				.fontWeight(.semibold)
				.foregroundColor(.white)
				.overlay (
					Capsule(style: .continuous)
						.frame(height: 3)
						.offset(y: 5)
						.foregroundColor(.white)
					, alignment: .bottom
				)
				Text("This is the #1 app for finding your match online! We are practicing using AppStorage")
				.fontWeight(.medium)
				.foregroundColor(.white)
			Spacer()
			Spacer()
		}
		.multilineTextAlignment(.center)
		.padding(30)
	}
	
	private var addNameSection:some View {
		VStack(spacing: 40) {
			Spacer()
			Text("What's your name?")
				.font(.largeTitle)
				.fontWeight(.semibold)
				.foregroundColor(.white)
			TextField("Your name here...", text: $name)
				.font(.headline)
				.frame(height: 55)
				.padding(.horizontal)
				.background(.white)
				.cornerRadius(10)
			Spacer()
			Spacer()
		}
		.padding(30)
	}
	
	private var addAgeSection:some View {
		VStack(spacing: 40) {
			Spacer()
			Text("What's your age?")
				.font(.largeTitle)
				.fontWeight(.semibold)
				.foregroundColor(.white)
			Text(String(format: "%.0f", age))
				.font(.largeTitle)
				.fontWeight(.semibold)
				.foregroundColor(.white)
			Slider(value: $age, in: 18...100, step: 1)
				.accentColor(.white)
			
			Spacer()
			Spacer()
		}
		.padding(30)
	}
	
	private var addGenderSection:some View {
		VStack(spacing: 40) {
			Spacer()
			Text("What's your gender?")
				.font(.largeTitle)
				.fontWeight(.semibold)
				.foregroundColor(.white)
			
			Menu {
				Picker(selection: $gender, label: EmptyView()) {
					Text("Male").tag("Male")
					Text("Female").tag("Female")
					Text("Non-Binary").tag("Non-Binary")
				}
			} label: {
				Text(gender.count > 1 ? gender : "Select a gender")
					.font(.headline)
					.foregroundColor(.purple)
					.frame(height: 55)
					.frame(maxWidth: .infinity)
					.background(.white)
					.cornerRadius(10)
			}
			Spacer()
			Spacer()
		}
		.padding(30)
	}
}

// MARK: Functions
extension OnBoardingView {
	func handleNextButtonPressed() {
		
		// check inputs
		switch onBoardingState {
			case 1:
				guard name.count >= 3 else {
					showAlert(title: "Your name must be at least 3 characters long!")
					return
				}
			case 3:
				guard gender.count > 1 else {
					showAlert(title: "Please select a gender!")
					return
				}
			default:
				break
		}
		
		// go to next section
		if onBoardingState == 3 {
			signIn()
		} else {
			withAnimation(.spring()) {
				onBoardingState += 1
			}
		}
		
	}
	
	func signIn() {
		currnetUserName = name
		currnetUserAge = Int(age)
		currnetUserGender = gender
		
		withAnimation(.spring()){
			currentUserSignedIn = true
		}
	
	}
	func showAlert(title:String) {
		aletrTitle = title
		showalert.toggle()
	}
}
