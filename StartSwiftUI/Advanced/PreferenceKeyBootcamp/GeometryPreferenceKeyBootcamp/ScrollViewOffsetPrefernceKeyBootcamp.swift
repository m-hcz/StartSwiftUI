//
//  ScrollViewOffsetPrefernceKeyBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 02/10/2022.
//

import SwiftUI

struct ScrollViewOffsetPreferenceKey: PreferenceKey {
	static var defaultValue: CGFloat = 0
	
	static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
		value = nextValue()
	}
}

extension View {
	func onScrollViewOffsetChanged(action: @escaping (_ offset: CGFloat) -> ()) -> some View {
		self
			.background(
				GeometryReader { geo in
					Text("")
						.preference(key: ScrollViewOffsetPreferenceKey.self, value: geo.frame(in: .global).minY)
				}
			)
			.onPreferenceChange(ScrollViewOffsetPreferenceKey.self) { value in
				action(value)
			}
	}
}
struct ScrollViewOffsetPrefernceKeyBootcamp: View {
	
	@State private var scrollViewOffset:CGFloat = 0
	let title: String = "New title"
	
    var body: some View {
	
			ScrollView {
				VStack {
					titleLayer
						.opacity(Double(scrollViewOffset) / 63)
						.onScrollViewOffsetChanged { value in
							scrollViewOffset = value
						}
					
					contentLayer
				}
				.padding()
			}
			.overlay(content: {
				Text("\(scrollViewOffset)")
			})
			.overlay(alignment: .top) {
				navBarLayer
					.opacity(Double(scrollViewOffset) < 40 ? 1 : 0)
			}
    }
}

extension ScrollViewOffsetPrefernceKeyBootcamp {
	private var titleLayer: some View {
		Text(title)
			.font(.largeTitle)
			.fontWeight(.semibold)
			.frame(maxWidth: .infinity, alignment: .leading)
	}
	private var contentLayer: some View {
		ForEach(0..<30) { _ in
			RoundedRectangle(cornerRadius: 10)
				.fill(Color.red.opacity(0.3))
				.frame(width: 300, height: 200)
		}
	}
	private var navBarLayer: some View {
		Text(title)
			.font(.headline)
			.frame(maxWidth: .infinity)
			.frame(height: 55)
			.background(.blue)
	}
	
	
}

struct ScrollViewOffsetPrefernceKeyBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewOffsetPrefernceKeyBootcamp()
    }
}
