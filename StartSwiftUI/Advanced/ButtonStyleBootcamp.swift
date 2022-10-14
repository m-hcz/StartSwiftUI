//
//  ButtonStyleBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 30/09/2022.
//

import SwiftUI

struct PressableButtonStyle: ButtonStyle {
	let scaleAmount: CGFloat
	
//	init(scaleAmount: CGFloat = 0.8) {
//		self.scaleAmount = scaleAmount
//	}
//
	func makeBody(configuration: Configuration) -> some View {
		configuration.label
			.scaleEffect(configuration.isPressed ? scaleAmount : 1)
			.brightness(configuration.isPressed ? 0.05 : 0)
			.opacity(configuration.isPressed ? 0.8 : 1)
	}
}
extension View {
	func withPressableStyle(scaleAmount: CGFloat = 0.8) -> some View {
		self.buttonStyle(PressableButtonStyle(scaleAmount: scaleAmount))
	}
}

struct ButtonStyleBootcamp: View {
    var body: some View {
		Button {
			
		} label: {
			Text("Click me")
				.font(.headline)
				.foregroundColor(.white)
				.frame(height: 55)
				.frame(maxWidth: .infinity)
				.background(.blue)
				.cornerRadius(10)
				.shadow(color: Color.blue.opacity(0.3), radius: 10)

		}
		.withPressableStyle()
//		.buttonStyle(PressableButtonStyle())
		.padding(40)

    }
}

struct ButtonStyleBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStyleBootcamp()
    }
}
