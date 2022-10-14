//
//  SheetsBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 03/09/2022.
//

import SwiftUI

struct SheetsBootcamp: View {
	
	@State var showsheet:Bool = false
	
    var body: some View {
		ZStack {
			Color.green
				.ignoresSafeArea()
			
			Button {
				showsheet.toggle()
			} label: {
				Text("Button")
					.foregroundColor(.green)
					.font(.headline)
					.padding()
					.background(Color.white.cornerRadius(10))
			}
			// one sheet or fullScreenCover per view
			.fullScreenCover(isPresented: $showsheet, content: {
				SecondScreen()
			})
			
//			.sheet(isPresented: $showsheet) {
//				SecondScreen()
//			}

		}
    }
}

struct SecondScreen:View {
	
	@Environment(\.presentationMode) var mode
	
	var body: some View {
		ZStack (alignment:.topTrailing) {
			Color.yellow
				.ignoresSafeArea()
			
			Button {
				mode.wrappedValue.dismiss()
			} label: {
				Image(systemName: "xmark")
					.foregroundColor(.white)
					.font(.largeTitle)
					.padding()
					
			}
	
			
		}
	}
}

struct SheetsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SheetsBootcamp()
		//SecondScreen()
    }
}
