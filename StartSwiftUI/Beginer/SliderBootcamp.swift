//
//  SliderBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 04/09/2022.
//

import SwiftUI

struct SliderBootcamp: View {
	
	@State var sliderValue:Double = 10
	@State var color:Color = .red
    var body: some View {
		VStack {
			Text("Rating:")
			Text(
				String(format: "%.2f", sliderValue)
			)
			.foregroundColor(color)
			
			Slider(value: $sliderValue)
				.accentColor(.red)
			
			Slider(value: $sliderValue, in: 0...100)
			
			Slider(value: $sliderValue, in: 1...5, step: 1)
			
			Slider(value: $sliderValue, in: 1...5, step: 1) {
				Text("Title")
			} minimumValueLabel: {
				Text("1")
			} maximumValueLabel: {
				Text("5")
			} onEditingChanged: { (_) in
				color = .green
			}

		}
		.padding()
    }
}

struct SliderBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SliderBootcamp()
    }
}
