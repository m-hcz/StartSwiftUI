//
//  TabViewBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 04/09/2022.
//

import SwiftUI

struct TabViewBootcamp: View {
	
	@State var selectedTab:Int = 0
    var body: some View {
		VStack {
			TabView(selection: $selectedTab) {
				HomeView(selectedTab: $selectedTab)
					.tabItem {
						Image(systemName: "house.fill")
						Text("Home")
					}
					.tag(0)
				
				Text("Browse tab")
					.tabItem {
						Image(systemName: "globe")
						Text("Browse")
					}
					.tag(1)
				
				Text("Profile tab")
					.tabItem {
						Image(systemName: "person.fill")
						Text("Profile")
					}
					.tag(2)
			}
			.accentColor(.yellow)
		}
    }
}

struct TabViewBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TabViewBootcamp()
    }
}

struct HomeView: View {
	
	@Binding var selectedTab:Int
	let icons:[String] = ["heart.fill", "globe", "house.fill", "person.fill"]
	var body: some View {
		ZStack {
			Color.red.ignoresSafeArea(edges: .top)
			VStack {
				Text("Home tab")
					.font(.largeTitle)
				.foregroundColor(.white)
				
				Button {
					selectedTab = 2
				} label: {
					Text("Go to Profile")
						.font(.headline)
						.padding()
						.background(.white)
						.cornerRadius(10)
				}
				
				TabView {
					ForEach(icons, id:\.self) { icon in
						Image(systemName: icon)
							.resizable()
							.scaledToFit()
							.padding()
					}
				}
				.frame(height:300)
				.tabViewStyle(PageTabViewStyle())
			}
			

		}
	}
}
