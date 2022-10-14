//
//  CustomTabBarContainerView.swift
//  StartSwiftUI
//
//  Created by M H on 05/10/2022.
//

import SwiftUI

struct CustomTabBarContainerView<Content:View>: View {
	let content:Content
	@Binding var selection:TabBarItem
	@State private var tabs: [TabBarItem] = []
	
	init(selection: Binding<TabBarItem>, @ViewBuilder content: () -> Content) {
		self._selection = selection
		self.content = content()
		
	}
    var body: some View {
		ZStack(alignment: .bottom) {
				content
					.ignoresSafeArea()
				
			CustomTabBarView(tabs: tabs, selection: $selection, localSelection: selection)
			}
		.onPreferenceChange(TabBarItemsPreferenceKey.self) { value in
			self.tabs = value
		}
    }
}

struct CustomTabBarContainerView_Previews: PreviewProvider {
	
	static let tabs: [TabBarItem] = [
		.home,
		.favorites,
		.profile
	]
	
    static var previews: some View {
		CustomTabBarContainerView(selection: .constant(tabs.first!)) {
			Color.red
		}
    }
}
