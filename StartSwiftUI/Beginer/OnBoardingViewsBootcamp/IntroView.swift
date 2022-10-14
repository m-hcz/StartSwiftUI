//
//  IntroView.swift
//  StartSwiftUI
//
//  Created by M H on 04/09/2022.
//

import SwiftUI

struct IntroView: View {
	
	@AppStorage("signed_in") var currentUserSignedIn:Bool = false // default false
	
    var body: some View {
		ZStack {
			LinearGradient(colors: [Color.purple, Color.blue], startPoint: .topLeading, endPoint: .bottomTrailing)
				.ignoresSafeArea()
			
			if currentUserSignedIn {
				ProfileView()
					.transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .top)))
			} else {
				OnBoardingView()
					.transition(.asymmetric(insertion: .move(edge: .top), removal: .move(edge: .bottom)))

			}
		}
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}
