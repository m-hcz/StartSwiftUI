//
//  ViewModifierBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 30/09/2022.
//

import SwiftUI

struct DefaultButtonViewModifier: ViewModifier {
	let bgColor:Color
	
	func body(content: Content) -> some View {
		content
			.font(.headline)
			.foregroundColor(.white)
			.frame(height: 55)
			.frame(maxWidth: .infinity)
			.background(bgColor)
			.cornerRadius(10)
			.shadow(radius: 10)
			.padding()
	}
}

extension View {
	func withDefaultButtonFormatting(bgColor: Color = .blue) -> some View {
		modifier(DefaultButtonViewModifier(bgColor: bgColor))
	}
}
struct ViewModifierBootcamp: View {
	
    var body: some View {
		VStack {
			Text("Hello, World!")
				.withDefaultButtonFormatting(bgColor: .red)
			
			Text("Hello, World!")
				.withDefaultButtonFormatting(bgColor: .orange)
				
			Text("Hello, World!")
				.withDefaultButtonFormatting()
		}
    }
}

struct ViewModifierBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ViewModifierBootcamp()
    }
}
