//
//  CustomNavView.swift
//  StartSwiftUI
//
//  Created by M H on 07/10/2022.
//

import SwiftUI

struct CustomNavView<Content: View>: View {
	let content: Content
	
	init(@ViewBuilder content: () -> Content) {
		self.content = content()
	}
	
    var body: some View {
		NavigationView {
			CustomNavBarContainerView {
				content
			}
			.navigationBarHidden(true)
		}
		.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct CustomNavView_Previews: PreviewProvider {
    static var previews: some View {
		CustomNavView{
			Color.yellow.ignoresSafeArea()
		}
    }
}

extension UINavigationController {
	open override func viewDidLoad() {
		super.viewDidLoad()
		
		interactivePopGestureRecognizer?.delegate = nil
	}
}
