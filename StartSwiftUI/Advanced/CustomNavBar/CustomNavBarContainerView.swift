//
//  CustomNavBarContainerView.swift
//  StartSwiftUI
//
//  Created by M H on 07/10/2022.
//

import SwiftUI

struct CustomNavBarContainerView<Content:View>: View {
	let content:Content
	
	@State private var showBackButton: Bool = true
	@State private var title: String = ""
	@State private var subtitle: String? = nil
	
	init(@ViewBuilder content: () -> Content) {
		self.content = content()
	}
	
    var body: some View {
		VStack(spacing: 0) {
			CustomNavBarView(showBackButton: showBackButton, title: title, subtitle: subtitle)
			
			content
				.frame(maxWidth: .infinity, maxHeight: .infinity)
		}
		.onPreferenceChange(CustomNavBarTitlePreferenceKey.self) { value in
			self.title = value
		}
		.onPreferenceChange(CustomNavBarSubTitlePreferenceKey.self) { value in
			self.subtitle = value
		}
		.onPreferenceChange(CustomNavBarBackButtonHiddenPreferenceKey.self) { value in
			self.showBackButton = !value // opposite value
		}
    }
}

struct CustomNavBarContainerView_Previews: PreviewProvider {
    static var previews: some View {
		CustomNavBarContainerView {
			ZStack {
				Color.green.ignoresSafeArea()
				
				Text("Content")
					.foregroundColor(.white)
					.customNavigationTitle("title")
					.customNavigationSubTitle("subtitle")
					.customNavigationBackButtonHidden(false)
			}
		}
    }
}
