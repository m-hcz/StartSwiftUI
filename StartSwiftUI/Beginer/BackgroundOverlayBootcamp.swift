//
//  BackgroundOverlayBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 02/09/2022.
//

import SwiftUI

struct BackgroundOverlayBootcamp: View {
    var body: some View {
       Image(systemName: "heart.fill")
			.font(.largeTitle)
			.foregroundColor(Color.white)
			.background(
				Circle()
					.foregroundColor(Color.purple)
					.frame(width: 100, height: 100)
					.shadow(color: Color.purple, radius: 10, x: 0, y: 10)
					.overlay(
						Circle()
							.foregroundColor(Color.red)
							.frame(width: 35, height: 35)
							.overlay(
								Text("5")
									.foregroundColor(.white)
									.font(.title2)
							)
							.shadow(color: Color.purple, radius: 10, x: 2, y: 2)
						,alignment: .topTrailing
					)
			)
		
    }
}

struct BackgroundOverlayBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundOverlayBootcamp()
    }
}
