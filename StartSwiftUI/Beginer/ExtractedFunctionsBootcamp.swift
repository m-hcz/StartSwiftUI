//
//  ExtractedFunctionsBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 03/09/2022.
//

import SwiftUI

struct ExtractedFunctionsBootcamp: View {
	
	@State var bgColor:Color = .yellow
	
	

	
    var body: some View {
		ZStack {
			bgColor
				.ignoresSafeArea()
			
			contetnLayer
		}
    }
	
	var contetnLayer:some View {
		VStack {
			Text("Title")
				.font(.largeTitle)
			
			Button {
				buttonPressed()
			} label: {
				Text("PRESS ME")
					.font(.headline)
					.foregroundColor(.white)
					.padding()
					.background(.black)
					.cornerRadius(20)
			}
			
		}
	}
	
	func buttonPressed(){
		bgColor = .blue
	}
	
	
	
}

struct ExtractedFunctionsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ExtractedFunctionsBootcamp()
    }
}
