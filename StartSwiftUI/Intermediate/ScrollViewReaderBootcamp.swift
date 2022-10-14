//
//  ScrollViewReaderBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 11/09/2022.
//

import SwiftUI

struct ScrollViewReaderBootcamp: View {
	@State var fieldText:String = ""
	@State var scrollToIndex:Int = 0
	
    var body: some View {
		VStack {
			TextField("Enter a number here...", text: $fieldText)
				.frame(height: 55)
				.border(Color.gray)
				.padding(.horizontal)
				.keyboardType(.numberPad)
			
			Button("Scroll now") {
				withAnimation(.spring()) {
					if let index = Int(fieldText) {
						scrollToIndex = index
					}
					//proxy.scrollTo(30, anchor: .bottom)
				}
			}
			
			ScrollView {
				ScrollViewReader { proxy in
					ForEach(0..<50) { index in
						Text("Item number #\(index)")
							.font(.headline)
							.frame(height: 200)
							.frame(maxWidth: .infinity)
							.background(.white)
							.cornerRadius(10)
							.shadow(radius: 10)
							.padding()
							.id(index)
					}
					.onChange(of: scrollToIndex) { newValue in
						withAnimation(.spring()) {
							proxy.scrollTo(newValue, anchor: .bottom)
						}
					}
				}
				
			}
		}
    }
}

struct ScrollViewReaderBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewReaderBootcamp()
    }
}
