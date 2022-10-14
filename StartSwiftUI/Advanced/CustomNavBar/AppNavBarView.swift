//
//  AppNavBarView.swift
//  StartSwiftUI
//
//  Created by M H on 07/10/2022.
//

import SwiftUI

struct AppNavBarView: View {
    var body: some View {
		CustomNavView {
			ZStack {
				Color.orange.ignoresSafeArea()
				
				CustomNavLink {
					Text("Destination")
						.customNavBarItems(title: "Second title", subtitle: "Second subtitle", backButtonHidden: false)
				} label: {
					Text("Navigate")
				}
			}
			.customNavBarItems(title: "Custom title", subtitle: "Custom subtitle", backButtonHidden: true)
		}
    }
}

struct AppNavBarView_Previews: PreviewProvider {
    static var previews: some View {
        AppNavBarView()
    }
}

extension AppNavBarView {
	private var defualtNavBarView: some View {
		NavigationView {
			ZStack {
				Color.red.ignoresSafeArea()
				
				NavigationLink(destination:
								Text("Destination")
					.navigationTitle("Title 2")
					.navigationBarBackButtonHidden(false)
				) {
					Text("Navigate")
				}
			}
			.navigationTitle("Nav title")
		}
	}
}
