//
//  CustomNavBarPreferenceKeys.swift
//  StartSwiftUI
//
//  Created by M H on 07/10/2022.
//

import Foundation
import SwiftUI


//@State private var showBackButton: Bool = true
//@State private var title: String = "Title"
//@State private var subtitle: String? = "Sub"

struct CustomNavBarTitlePreferenceKey: PreferenceKey {
	static var defaultValue: String = ""
	
	static func reduce(value: inout String, nextValue: () -> String) {
		value = nextValue()
	}
}

struct CustomNavBarSubTitlePreferenceKey: PreferenceKey {
	static var defaultValue: String? = ""
	
	static func reduce(value: inout String?, nextValue: () -> String?) {
		value = nextValue()
	}
}

struct CustomNavBarBackButtonHiddenPreferenceKey: PreferenceKey {
	static var defaultValue: Bool = false
	
	static func reduce(value: inout Bool, nextValue: () -> Bool) {
		value = nextValue()
	}
}

extension View {
	func customNavigationTitle(_ title: String) -> some View {
		self.preference(key: CustomNavBarTitlePreferenceKey.self, value: title)
	}
	func customNavigationSubTitle(_ subtitle: String?) -> some View {
		self.preference(key: CustomNavBarSubTitlePreferenceKey.self, value: subtitle)
	}
	func customNavigationBackButtonHidden(_ hidden: Bool) -> some View {
		self.preference(key: CustomNavBarBackButtonHiddenPreferenceKey.self, value: hidden)
	}
	func customNavBarItems(title: String = "", subtitle: String? = nil, backButtonHidden:Bool = false) -> some View {
		self
			.customNavigationTitle(title)
			.customNavigationSubTitle(subtitle)
			.customNavigationBackButtonHidden(backButtonHidden)
	}
}
