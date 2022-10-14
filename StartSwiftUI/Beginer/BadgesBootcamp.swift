//
//  BadgesBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 06/09/2022.
//

import SwiftUI

struct BadgesBootcamp: View {
    var body: some View {
		TabView {
			Color.red
				.tabItem {
					Image(systemName: "heart.fill")
					Text("Hello")
				}
				.badge(5)
			
			Color.green
				.tabItem {
					Image(systemName: "heart.fill")
					Text("Hello")
				}
			
			Color.blue
				.tabItem {
					Image(systemName: "heart.fill")
					Text("Hello")
				}
			
		}
    }
}

struct BadgesBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        BadgesBootcamp()
    }
}
