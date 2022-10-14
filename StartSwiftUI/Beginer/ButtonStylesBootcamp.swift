//
//  ButtonStylesBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 06/09/2022.
//

import SwiftUI

struct ButtonStylesBootcamp: View {
    var body: some View {
		VStack(spacing: 20) {
			Button("Button") {
				
			}
			.frame(height: 25)
			.frame(width:.infinity)
			.controlSize(.large)
			.buttonStyle(.automatic)
			
			Button("Button") {
				
			}
			.frame(height: 25)
			.frame(width:.infinity)
			.controlSize(.large)
			.buttonStyle(.bordered)
			
			Button("Button") {
				
			}
			.frame(height: 25)
			.frame(width:.infinity)
			.buttonStyle(.borderedProminent)
			
			Button("Button") {
				
			}
			.frame(height: 25)
			.frame(width:.infinity)
			.buttonStyle(.borderless)
			
			Button("Button") {
				
			}
			.frame(height: 25)
			.frame(width:.infinity)
			.buttonStyle(.plain)
		}
		.padding()
    }
}

struct ButtonStylesBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStylesBootcamp()
    }
}
