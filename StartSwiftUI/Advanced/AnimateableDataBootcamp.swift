//
//  AnimateableDataBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 01/10/2022.
//

import SwiftUI

struct AnimateableDataBootcamp: View {
	@State private var animate:Bool = false
    var body: some View {
		ZStack {
//			RectangleWithSingleCornerAnimation(cornerRadius: animate ? 60 : 0)
			PacMan(offsetAmount: animate ? 20 : 0)
				.frame(width: 250, height: 250)
		}
		.onAppear {
			withAnimation(Animation.easeInOut.repeatForever()) {
				animate.toggle()
			}
		}
    }
}

struct AnimateableDataBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        AnimateableDataBootcamp()
    }
}

struct RectangleWithSingleCornerAnimation:Shape {
	var cornerRadius:CGFloat
	var animatableData: CGFloat {
		get {
			cornerRadius
		}
		set {
			cornerRadius = newValue
		}
	}
	
	func path(in rect: CGRect) -> Path {
		Path { path in
			path.move(to: .zero)
			path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
			path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - cornerRadius))
			path.addArc(center: CGPoint(x: rect.maxX - cornerRadius, y: rect.maxY - cornerRadius),
						radius: cornerRadius, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)
			path.addLine(to: CGPoint(x: rect.maxX - cornerRadius, y: rect.maxY ))
			path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
		}
	}
}

struct PacMan: Shape {
	var offsetAmount:Double
	var animatableData: Double {
		get { offsetAmount }
		set { offsetAmount = newValue }
	}
	
	func path(in rect: CGRect) -> Path {
		Path { path in
			path.move(to: CGPoint(x: rect.midX, y: rect.midY))
			path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.height / 2, startAngle: Angle(degrees: offsetAmount), endAngle: Angle(degrees: 360 - offsetAmount), clockwise: false)
		}
	}
}
