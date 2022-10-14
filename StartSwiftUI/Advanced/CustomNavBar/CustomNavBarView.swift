//
//  CustomNavBarView.swift
//  StartSwiftUI
//
//  Created by M H on 07/10/2022.
//

import SwiftUI

struct CustomNavBarView: View {
	
	@Environment(\.presentationMode) var presentationMode
	let showBackButton: Bool
	let title: String
	let subtitle: String?
	
    var body: some View {
		HStack {
			if showBackButton {
				backButton
			}
			
			
			Spacer()
			
			titleSection
			
			Spacer()
			
			if showBackButton {
				Image(systemName: "chevron.left")
					.opacity(0)
			}
			
		}
		.padding()
		.accentColor(Color.white)
		.foregroundColor(.white)
		.font(.headline)
		.background(Color.blue.ignoresSafeArea(edges: .top))
    }
}

struct CustomNavBarView_Previews: PreviewProvider {
    static var previews: some View {
		VStack {
			CustomNavBarView(showBackButton: true, title: "title", subtitle: "subtitle")
			Spacer()
		}
    }
}

extension CustomNavBarView {
	private var backButton: some View {
		Button {
			presentationMode.wrappedValue.dismiss()
		} label: {
			Image(systemName: "chevron.left")
		}
	}
	
	private var titleSection: some View {
		VStack(spacing: 4) {
			Text(title)
				.font(.title)
				.fontWeight(.semibold)
			
			if let subtitle = subtitle {
				Text(subtitle)
			}
			
		}
	}
}
