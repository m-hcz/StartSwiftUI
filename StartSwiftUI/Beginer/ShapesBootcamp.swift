//
//  ShapesBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 02/09/2022.
//

import SwiftUI

struct ShapesBootcamp: View {
    var body: some View {
		VStack{
			
		
		Circle()
			//.fill(Color.blue)
			//.foregroundColor(.pink)
			.trim(from: 0.25, to: 1)
			.stroke(Color.red,style: StrokeStyle(lineWidth: 20, lineCap: .square, dash: [30]))
			
		Ellipse()
				.trim(from: 0.25, to: 1)
				.frame(width: 300, height: 150)
				
			Capsule(style: .circular)
				.padding()
			Capsule(style: .continuous)
				.padding()
			Rectangle()
				.padding()
			RoundedRectangle(cornerRadius: 20)
				.padding()
		}
		
	}
}

struct ShapesBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ShapesBootcamp()
    }
}
