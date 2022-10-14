//
//  AnimationBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 03/09/2022.
//

import SwiftUI

struct AnimationBootcamp: View {
	
	@State var isAnimated:Bool = false
	
    var body: some View {
		VStack {
			Spacer()
			
			Button("Button") {
				withAnimation {
					isAnimated.toggle()
				}
			}
			
			Spacer()
			
			RoundedRectangle(cornerRadius: 25)
				.fill(isAnimated ? .red : .green)
				.frame(width: 300, height: 300)
			
				Spacer()
		}
    }
}

struct AnimationBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        AnimationBootcamp()
    }
}
