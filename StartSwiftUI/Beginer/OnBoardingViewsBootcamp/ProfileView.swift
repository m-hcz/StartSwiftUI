//
//  ProfileView.swift
//  StartSwiftUI
//
//  Created by M H on 04/09/2022.
//

import SwiftUI

struct ProfileView: View {
	
	// appstorage
	@AppStorage("name") var currnetUserName:String?
	@AppStorage("age") var currnetUserAge:Int?
	@AppStorage("gender") var currnetUserGender:String?
	@AppStorage("signed_in") var currentUserSignedIn:Bool = false // default false
	
    var body: some View {
		VStack(spacing: 10.0) {
			Image(systemName: "person.circle.fill")
				.resizable()
				.scaledToFit()
				.frame(width: 150, height: 150)
			Text(currnetUserName ?? "Username")
			Text("Age \(currnetUserAge ?? 0)")
			Text(currnetUserGender ?? "usergender")
			Text("sign out".uppercased())
				.foregroundColor(.white)
				.font(.headline)
				.frame(height: 55)
				.frame(maxWidth: .infinity)
				.background(.black)
				.cornerRadius(10)
				.padding(.vertical, 10)
				.onTapGesture {
					signOut()
				}
		}
		
		.font(.title)
		.padding()
		.background(.white)
		.cornerRadius(10)
		.shadow(radius: 10)
		.foregroundColor(.purple)
		.padding()
    }
	
	func signOut() {
		currnetUserName = nil
		currnetUserAge = nil
		currnetUserGender = nil
		
		withAnimation(.spring()) {
			currentUserSignedIn = false
		}
		
	}
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
