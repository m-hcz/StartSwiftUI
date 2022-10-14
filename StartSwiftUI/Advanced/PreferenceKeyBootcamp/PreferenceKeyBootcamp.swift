//
//  PreferenceKeyBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 02/10/2022.
//

import SwiftUI

struct PreferenceKeyBootcamp: View {
	@State private var text: String = "Hello"
	
    var body: some View {
		NavigationView {
			VStack {
				SecondaryScreen(text: text)
			}
			.navigationTitle("nav title")
			
		}
		.onPreferenceChange(CustomTitlePreferenceKey.self) { value in
			self.text = value
		}
    }
}

struct PreferenceKeyBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        PreferenceKeyBootcamp()
    }
}

extension View {
	func customTitle(text:String) -> some View {
		self.preference(key: CustomTitlePreferenceKey.self, value: text)
	}
}

struct SecondaryScreen: View {
	let text:String
	@State private var newValue:String = ""
	
	var body: some View {
		Text(text)
			.onAppear(perform: getDataFromDB)
			.customTitle(text: newValue)
	}
	
	func getDataFromDB() {
		DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
			self.newValue = "New value from DB"
		}
	}
}

struct CustomTitlePreferenceKey: PreferenceKey {
	static var defaultValue: String = ""
	
	static func reduce(value: inout String, nextValue: () -> String) {
		value = nextValue()
	}
}
