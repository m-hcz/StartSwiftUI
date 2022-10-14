//
//  StateBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 03/09/2022.
//

import SwiftUI

struct StateBootcamp: View {
	
	@State var bgColor:Color = Color.green
	@State var title:String = "Title"
	@State var count:Int = 0
	
    var body: some View {
		ZStack {
			bgColor
				.ignoresSafeArea(.all)
			
			VStack(spacing: 20) {
				Text(title)
					.font(.title)
				Text("count: \(count)")
					.font(.headline)
					.underline()
				
				HStack(spacing: 20) {
					Button("Button 1") {
						bgColor = .red
						title = "Button 1 was pressed"
						count+=1
					}
					
					Button("Button 2") {
						bgColor = .orange
						title = "Button 2 was pressed"
						count+=1
						
					}
				}
			}
			.foregroundColor(.white)
		}
    }
}

struct StateBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        StateBootcamp()
    }
}
