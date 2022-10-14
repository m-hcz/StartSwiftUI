//
//  DarkModeBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 04/09/2022.
//

import SwiftUI

struct DarkModeBootcamp: View {
	
	@Environment(\.colorScheme) var colorScheme
    var body: some View {
		NavigationView {
			ScrollView {
				VStack(spacing: 20) {
					
					Text("primary")
						.foregroundColor(.primary)
					
					Text("secondary")
						.foregroundColor(.secondary)
					
					Text("black")
						.foregroundColor(.black)
					
					Text("white")
						.foregroundColor(.white)
					
					Text("custom color")
						.foregroundColor(Color("CustomColor"))
					
					Text("colorScheme adaptive")
						.foregroundColor(colorScheme == .light ? .green : .yellow)
				}
				.font(.title)
			}
			.navigationTitle("Dark mode bootcamp")
		}
    }
}

struct DarkModeBootcamp_Previews: PreviewProvider {
    static var previews: some View {
		DarkModeBootcamp()
			.preferredColorScheme(.light)
		
        DarkModeBootcamp()
			.preferredColorScheme(.dark)
    }
}
