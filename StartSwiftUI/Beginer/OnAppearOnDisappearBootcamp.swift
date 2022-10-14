//
//  OnAppearOnDisappearBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 04/09/2022.
//

import SwiftUI

struct OnAppearOnDisappearBootcamp: View {
	
	@State var myText:String = "Start text."
	@State var count:Int = 0
    var body: some View {
		NavigationView{
			ScrollView {
				Text(myText)
				
				LazyVStack {
					ForEach(0..<50) {_ in
						RoundedRectangle(cornerRadius: 25)
							.frame(height: 200)
							.padding()
							.onAppear {
								count += 1
							}
							.onDisappear {
								count -= 1
							}
					}
				}
			}
			.onAppear(perform: {
				// update in 5s
				DispatchQueue.main.asyncAfter(deadline: .now() + 5){
				myText = "New text"
				}
			})
			.onDisappear(perform: {
				myText = "Ending text"
			})
			.navigationTitle("On Appear, \(count)")
		}
    }
}

struct OnAppearOnDisappearBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        OnAppearOnDisappearBootcamp()
    }
}
