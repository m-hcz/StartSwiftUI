//
//  RotationGestureBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 11/09/2022.
//

import SwiftUI

struct RotationGestureBootcamp: View {
	
	@State var angle:Angle = Angle(degrees: 0)
    var body: some View {
        Text("Hello, World!")
			.font(.largeTitle)
			.fontWeight(.semibold)
			.foregroundColor(.white)
			.padding(50)
			.background(Color.blue.cornerRadius(10))
			.rotationEffect(angle)
			.gesture(
				RotationGesture()
					.onChanged({ value in
						angle = value
					})
					.onEnded({ value in
						withAnimation(.spring()) {
							angle = Angle(degrees: 0)
						}
					})
			)
			
    }
}

struct RotationGestureBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        RotationGestureBootcamp()
    }
}
