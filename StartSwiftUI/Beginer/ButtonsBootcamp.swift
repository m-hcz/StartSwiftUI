//
//  ButtonsBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 03/09/2022.
//

import SwiftUI

struct ButtonsBootcamp: View {
	
	@State var title: String = "My title"
	
    var body: some View {
		VStack(spacing: 20) {
			Text(title)
			Button("Press me") {
				title = "Button pressed"
			}
			
			Button {
				title = "Button 2 pressed"
			} label: {
				Text("Save")
					.font(.headline)
					.fontWeight(.semibold)
					.foregroundColor(.white)
					.padding()
					.padding(.horizontal, 10)
					.background(
						Color.blue
							.cornerRadius(10)
							.shadow(radius: 10)
					)
			}
			
			Button {
				title = "Button 3"
			} label: {
				Circle()
					.fill(.white)
					.frame(width: 75, height: 75)
					.shadow(radius: 10)
					.overlay {
						Image(systemName: "heart.fill")
							.font(.largeTitle)
							.foregroundColor(.red)
					}
			}
			
			Button {
				title = "Button 4"
			} label: {
				Text("Finish")
					.font(.caption)
					.foregroundColor(.gray)
					.bold()
					.padding()
					.padding(.horizontal, 10)
					.background(
						Capsule()
							.stroke(.gray, lineWidth: 2)
					)
			}



		}
    }
}

struct ButtonsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsBootcamp()
    }
}
