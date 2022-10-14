//
//  GeometryPreferenceKeyBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 02/10/2022.
//

import SwiftUI

struct GeometryPreferenceKeyBootcamp: View {
	@State private var rectSize: CGSize = .zero
    var body: some View {
		VStack {
			Spacer()
			Text("Hello")
				.frame(width: rectSize.width, height: rectSize.height)
				.background(.blue)
			Spacer()
			HStack {
				Rectangle()
				GeometryReader { geo in
					Rectangle()
						.updateRectangleGeoSize(size: geo.size)
				}
				
				Rectangle()
			}
			.frame(height: 55)
		}
		.onPreferenceChange(RectangleGeometryPreferenceKey.self) { value in
			self.rectSize = value
		}
    }
}

struct GeometryPreferenceKeyBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        GeometryPreferenceKeyBootcamp()
    }
}

extension View {
	func updateRectangleGeoSize(size: CGSize) -> some View {
		preference(key: RectangleGeometryPreferenceKey.self, value: size)
	}
}
struct RectangleGeometryPreferenceKey: PreferenceKey {
	static var defaultValue: CGSize = .zero
	
	static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
		value = nextValue()
	}
	
	
}
