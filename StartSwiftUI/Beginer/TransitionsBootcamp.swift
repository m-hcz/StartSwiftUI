//
//  TransitionsBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 03/09/2022.
//

import SwiftUI

struct TransitionsBootcamp: View {
	
	@State var showView:Bool = false
	
    var body: some View {
		ZStack(alignment: .bottom) {
			VStack {
				Button("Button") {
					showView.toggle()
				}
				Spacer()
			}
			
			if showView {
				RoundedRectangle(cornerRadius: 30)
					.fill(.yellow)
					.frame(height: UIScreen.main.bounds.height / 2)
					.transition(.move(edge: .bottom))
					.animation(.easeInOut)
			}
			
		}
		.ignoresSafeArea(edges: .bottom)
    }
		
		
}

struct TransitionsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TransitionsBootcamp()
    }
}
