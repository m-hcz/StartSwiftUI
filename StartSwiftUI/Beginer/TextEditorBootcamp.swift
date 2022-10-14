//
//  TextEditorBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 03/09/2022.
//

import SwiftUI

struct TextEditorBootcamp: View {
	
	@State var textEdit:String = "Text"
    var body: some View {
		NavigationView {
			VStack {
				TextEditor(text: $textEdit)
					.frame(height: 250)
					.colorMultiply(.gray)
					.cornerRadius(10)
				Button {
					
				} label: {
					Text("Save")
						.font(.headline)
						.foregroundColor(.white)
						.padding()
						.frame(maxWidth:.infinity)
						.background(.blue)
						.cornerRadius(10)
				}
Spacer()
			}
			.padding()
			.navigationTitle("TextEditor")
		}
    }
}

struct TextEditorBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TextEditorBootcamp()
    }
}
