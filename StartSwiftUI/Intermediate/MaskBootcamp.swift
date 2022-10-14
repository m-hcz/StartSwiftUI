//
//  MaskBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 11/09/2022.
//

import SwiftUI

struct MaskBootcamp: View {
	
	@State var rating:Int = 0
	
    var body: some View {
		ZStack {
			startView
				.overlay(
					overlayView
						.mask(startView)
				)
		}
    }
	
	private var overlayView: some View {
		GeometryReader { geometry in
			ZStack(alignment: .leading) {
				Rectangle()
					.foregroundColor(.yellow)
					.frame(width: CGFloat(rating) / 5 * geometry.size.width)
			}
		}
		.allowsHitTesting(false)
	}
	private var startView: some View {
		HStack {
			ForEach(1..<6) { index in
				Image(systemName: "star.fill")
					.font(.largeTitle)
					.foregroundColor(.gray)
					.onTapGesture {
						withAnimation(.easeInOut) {
							rating = index
						}
					}
			}
		}
	}
}

struct MaskBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        MaskBootcamp()
    }
}
