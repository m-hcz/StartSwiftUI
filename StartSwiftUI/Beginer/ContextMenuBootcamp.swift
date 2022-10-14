//
//  ContextMenuBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 03/09/2022.
//

import SwiftUI

struct ContextMenuBootcamp: View {
	
	@State var bgColor:Color = .blue
	
    var body: some View {
		VStack(alignment: .leading, spacing: 10) {
			Image(systemName: "house.fill")
				.font(.title)
			Text("Swift")
				.font(.headline)
			Text("Tutorial contextMenu")
				.font(.subheadline)
		}
		.padding(30)
		.background(bgColor.cornerRadius(30))
		.foregroundColor(.white)
		// click and hold
		.contextMenu{
			Button {
				bgColor = .yellow
			} label: {
				Label("Button 1", systemImage: "flame.fill")
			}
			Button {
				bgColor = .red
			} label: {
				Text("Button 2")
			}
			Button {
				bgColor = .green
			} label: {
				HStack {
					Text("Button 2")
					Image(systemName: "heart.fill")
				}
			}


		}
		
    }
}

struct ContextMenuBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ContextMenuBootcamp()
    }
}
