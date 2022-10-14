//
//  AnimationTimingBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 03/09/2022.
//

import SwiftUI

struct AnimationTimingBootcamp: View {
	
	@State var isAnimating:Bool = false
	let timing:Double = 3
	
    var body: some View {
		VStack {
			Button("Button") {
					isAnimating.toggle()
			}
			
			RoundedRectangle(cornerRadius: 20)
				.foregroundColor(.orange)
				.frame(width: isAnimating ? 350 : 50, height: 100)
				.animation(Animation.spring())
			
			RoundedRectangle(cornerRadius: 20)
				.frame(width: isAnimating ? 350 : 50, height: 100)
				.animation(Animation.linear(duration: timing))
			
			RoundedRectangle(cornerRadius: 20)
				.frame(width: isAnimating ? 350 : 50, height: 100)
				.animation(Animation.easeIn(duration: timing))
			
			RoundedRectangle(cornerRadius: 20)
				.frame(width: isAnimating ? 350 : 50, height: 100)
				.animation(Animation.easeInOut(duration: timing))
			
			RoundedRectangle(cornerRadius: 20)
				.frame(width: isAnimating ? 350 : 50, height: 100)
				.animation(Animation.easeOut(duration: timing))
		}
    }
}

struct AnimationTimingBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        AnimationTimingBootcamp()
    }
}
