//
//  DragGesture2Bootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 11/09/2022.
//

import SwiftUI

struct DragGesture2Bootcamp: View {
	
	@State var startingOffsetY:CGFloat = UIScreen.main.bounds.height * 0.85
	@State var currentDragOffsetY:CGFloat = 0
	@State var endingOffsetY:CGFloat = 0
	
    var body: some View {
		ZStack {
			Color.yellow.ignoresSafeArea()
			
			MySignUpView()
				.offset(y: startingOffsetY)
				.offset(y: currentDragOffsetY)
				.offset(y: endingOffsetY)
				.gesture(
					DragGesture()
						.onChanged({ value in
							withAnimation(.spring()) {
								currentDragOffsetY = value.translation.height
							}
						})
						.onEnded({ value in
							
							
							withAnimation(.spring()) {
								if currentDragOffsetY < -UIScreen.main.bounds.height / 3 {
									endingOffsetY = -startingOffsetY
								} else if endingOffsetY != 0 && currentDragOffsetY > UIScreen.main.bounds.height / 3 {
									endingOffsetY = 0
								}
									currentDragOffsetY = 0
							}
						})
				)
			
			Text("\(currentDragOffsetY)")
		}
		.ignoresSafeArea(edges: .bottom)
    }
}

struct DragGesture2Bootcamp_Previews: PreviewProvider {
    static var previews: some View {
        DragGesture2Bootcamp()
    }
}

struct MySignUpView: View {
	var body: some View {
		VStack(spacing: 20.0) {
			Image(systemName: "chevron.up")
				.padding(.top)
			Text("Sign up")
				.font(.headline)
				.fontWeight(.semibold)
			
			Image(systemName: "flame.fill")
				.resizable()
				.scaledToFit()
				.frame(width: 100, height: 100)
			
			Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.")
				.multilineTextAlignment(.center)
			
			Text("Create an account".uppercased())
				.font(.headline)
				.foregroundColor(.white)
				.padding()
				.padding(.horizontal)
				.background(Color.black.cornerRadius(10))
			
			Spacer()
		}
		.frame(maxWidth:.infinity)
		.background(.white)
		.cornerRadius(30)
	}
}
