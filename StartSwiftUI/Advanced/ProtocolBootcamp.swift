//
//  ProtocolBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 08/10/2022.
//

import SwiftUI


protocol ColorThemeProtocol {
	var primary:Color {get}
	var secondary:Color {get}
	var tertiary:Color {get}
	
	func colorChange()
}

struct DefaultColorTheme: ColorThemeProtocol {
	func colorChange() {
		//
	}
	
	let primary:Color = .blue
	let secondary:Color = .white
	let tertiary:Color = .gray
}

struct AlternativeColorTheme: ColorThemeProtocol {
	func colorChange() {
		//
	}
	
	let primary:Color = .red
	let secondary:Color = .white
	let tertiary:Color = .gray
}



struct ProtocolBootcamp: View {
	
	let colorTheme: ColorThemeProtocol
	
    var body: some View {
		ZStack {
			colorTheme.tertiary.ignoresSafeArea()
			
			Text("Protocol")
				.font(.headline)
				.foregroundColor(colorTheme.secondary)
				.padding()
				.background(colorTheme.primary)
				.cornerRadius(10)
		}
    }
}

struct ProtocolBootcamp_Previews: PreviewProvider {
    static var previews: some View {
		ProtocolBootcamp(colorTheme: AlternativeColorTheme())
    }
}
