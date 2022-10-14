//
//  UIViewRepresentableBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 07/10/2022.
//

import SwiftUI

// convert a uiview from uikit to swiftui
struct UIViewRepresentableBootcamp: View {
	@State private var text:String = ""
	
    var body: some View {
		VStack {
			Text("UIViewRepresentable")
			Text(text)
			
			TextField("Type here...", text: $text)
				.frame(height: 55)
				.background(Color.gray.opacity(0.3))
			
			UITextFieldUIViewRepresentable(text: $text, placeholder: "type here...", placeholderColor: UIColor.blue)
				.frame(height: 55)
				.background(Color.gray.opacity(0.3))
		}
    }
}

struct UIViewRepresentableBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        UIViewRepresentableBootcamp()
    }
}

struct UITextFieldUIViewRepresentable: UIViewRepresentable {
	
	@Binding var text:String
	let placeholder:String
	let placeholderColor:UIColor
	
	func makeUIView(context: Context) -> some UITextField {
		let textField = getTextField()
		textField.delegate = context.coordinator
		return textField
	}
	// send data from swiftui to uikit
	func updateUIView(_ uiView: UIViewType, context: Context) {
		(uiView as UITextField).text = text
	}
	private func getTextField() -> UITextField {
		let textField = UITextField(frame: .zero)
		let placeholder = NSAttributedString(string: placeholder, attributes: [
			.foregroundColor : placeholderColor])
		textField.attributedPlaceholder = placeholder
		return textField
	}
	// send data from uikit to swiftui
	func makeCoordinator() -> Coordinator {
		return Coordinator(text: $text)
	}
	
	class Coordinator: NSObject, UITextFieldDelegate {
		@Binding var text:String
		
		init(text: Binding<String>) {
			self._text = text
		}
		
		func textFieldDidChangeSelection(_ textField: UITextField) {
			text = textField.text ?? ""
		}
	}
}

struct BasicViewUIViewRepresentable: UIViewRepresentable {
	func makeUIView(context: Context) -> some UIView {
		let view = UIView()
		view.backgroundColor = .red
		return view
	}
	func updateUIView(_ uiView: UIViewType, context: Context) {
		
	}
}
