//
//  CustomShapesBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 01/10/2022.
//

import SwiftUI

struct Triangle: Shape {
	func path(in rect: CGRect) -> Path {
		Path { path in
			path.move(to: CGPoint(x: rect.midX, y: rect.minY))
			path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
			path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
			path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
		}
	}
}

struct Diamond: Shape {
	func path(in rect: CGRect) -> Path {
		Path { path in
			path.move(to: CGPoint(x: rect.midX, y: rect.minY))
			path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
			path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
			path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
			path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
		}
	}
}

struct CustomShapesBootcamp: View {
    var body: some View {
		ZStack {
//			Triangle()
//				.frame(width: 300, height: 300)
			
			Diamond()
				.frame(width: 300, height: 300)
		}
    }
}

struct CustomShapesBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        CustomShapesBootcamp()
    }
}
