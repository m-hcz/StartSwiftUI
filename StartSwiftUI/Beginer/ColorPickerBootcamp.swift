//
//  ColorPickerBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 03/09/2022.
//

import SwiftUI

struct ColorPickerBootcamp: View {
	
	@State var bgColor:Color = .green
    var body: some View {
		ZStack {
			bgColor.ignoresSafeArea()
			
			ColorPicker("Select a color", selection: $bgColor, supportsOpacity: true)
				.padding()
				.background(.black)
				.cornerRadius(10)
				.foregroundColor(.white)
				.padding()
		}
    }
}

struct ColorPickerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ColorPickerBootcamp()
    }
}
