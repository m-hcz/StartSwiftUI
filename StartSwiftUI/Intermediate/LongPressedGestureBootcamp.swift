//
//  LongPressedGestureBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 10/09/2022.
//

import SwiftUI

struct LongPressedGestureBootcamp: View {
	@State var isComplete:Bool = false
	@State var isSuccess:Bool = false
	
    var body: some View {
		VStack {
			Rectangle()
				.fill(isSuccess ? Color.green :Color.blue)
				.frame(maxWidth: isComplete ? .infinity : 0)
				.frame(height: 55)
				.frame(maxWidth: .infinity, alignment: .leading)
				.background(.gray)
			
			HStack {
				Text("Click here")
					.foregroundColor(.white)
					.padding()
					.background(.black)
				.cornerRadius(10)
				.onLongPressGesture(minimumDuration: 1, maximumDistance: 50) {
					// as the min duration
					withAnimation(.easeInOut) {
						isSuccess = true
					}
				} onPressingChanged: { isPressing in
					// start of press
					if isPressing {
						withAnimation(.easeInOut(duration: 1)){
							isComplete = true
						}
					} else {
						DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
							if !isSuccess {
								withAnimation(.easeInOut){
									isComplete = false
								}
							}
						}
					}
				}
				
				Text("Reset")
					.foregroundColor(.white)
					.padding()
					.background(.black)
					.cornerRadius(10)
					.onTapGesture {
						isComplete=false
						isSuccess=false
					}

			}
		}
//		Text(isComplete ? "Completed" : "Not complete")
//			.padding()
//			.padding(.horizontal)
//			.background(isComplete ? .green : .gray)
//			.cornerRadius(10)
////			.onTapGesture {
////				isComplete.toggle()
////			}
//			.onLongPressGesture(minimumDuration: 1, maximumDistance: 50) {
//				isComplete.toggle()
//			}
    }
}

struct LongPressedGestureBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        LongPressedGestureBootcamp()
    }
}
