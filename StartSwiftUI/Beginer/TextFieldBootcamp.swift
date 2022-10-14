//
//  TextFieldBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 03/09/2022.
//

import SwiftUI

struct TextFieldBootcamp: View {
	
	@State var textfiled:String = ""
	@State var dataArray:[String] = []
	
    var body: some View {
		NavigationView {
			VStack {
				TextField("Type here ...", text: $textfiled)
					//.textFieldStyle(RoundedBorderTextFieldStyle())
					.padding()
					.background(Color.gray.opacity(0.3).cornerRadius(10))
				.font(.headline)
				
				Button {
					if validateText(){
						saveText()
					}
				} label: {
					Text("Save".uppercased())
						.padding()
						.frame(maxWidth:.infinity)
						.background(validateText() ? .blue : .gray)
						.cornerRadius(10)
						.foregroundColor(.white)
						.font(.headline)
						
				}
				.disabled(!validateText())
				
				ForEach(dataArray, id: \.self) { data in
					Text(data)
				}
Spacer()
			}
			.padding()
			.navigationTitle("TextField Bootcamp")
		}
    }
	
	func validateText() -> Bool {
		if textfiled.count >= 3 {
			return true
		}
		return false
	}
	
	func saveText(){
		dataArray.append(textfiled)
		textfiled = ""
	}
}

struct TextFieldBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldBootcamp()
    }
}
