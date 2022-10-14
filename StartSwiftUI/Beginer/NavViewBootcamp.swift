//
//  NavViewBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 03/09/2022.
//

import SwiftUI

struct NavViewBootcamp: View {
    var body: some View {
		NavigationView {
			ScrollView {
				
				NavigationLink("Hello") {
					MyOtherScreen()
				}
				Text("A")
				Text("A")
				Text("A")
			}
			.navigationTitle("Title")
//			.navigationBarTitleDisplayMode(.inline)
			//.navigationBarHidden(true)
			.navigationBarItems(
				leading:
					HStack {
						Image(systemName: "person.fill")
						Image(systemName: "flame.fill")
					}
				, trailing: NavigationLink(destination: {
					MyOtherScreen()
				}, label: {
					Image(systemName: "gear")
						.accentColor(.red)
				})
			)
		
		}
    }
}

struct MyOtherScreen:View {
	
	@Environment(\.presentationMode) var mode
	var body: some View {
		ZStack {
			Color.green.ignoresSafeArea()
				.navigationTitle("Green Screen!")
				.navigationBarHidden(true)
			
			VStack {
				Button("Back button") {
					mode.wrappedValue.dismiss()
				}
				
				NavigationLink("Click here"){
					Text("3rd screen")
				}
			}
		}
	}
}

struct NavViewBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        NavViewBootcamp()
    }
}
