//
//  UIViewControllerRepresentableBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 07/10/2022.
//

import SwiftUI

struct UIViewControllerRepresentableBootcamp: View {
	@State private var showScreen:Bool = false
	@State private var image:UIImage? = nil
	
    var body: some View {
		VStack {
			Text("AA")
			
			if let image = image {
				Image(uiImage: image)
					.resizable()
					.scaledToFit()
					.frame(width: 200, height: 200)
			}
			Button {
				showScreen.toggle()
			} label: {
				Text("Click here")
			}
			.sheet(isPresented: $showScreen) {
//				BasicUIViewControllerRepresentable(labelText: "New text")
				UIImagePickerControllerRepresentable(image: $image, showScreen: $showScreen)
			}
		}
    }
}

struct UIViewControllerRepresentableBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        UIViewControllerRepresentableBootcamp()
    }
}

struct UIImagePickerControllerRepresentable: UIViewControllerRepresentable {
	
	@Binding var image:UIImage?
	@Binding var showScreen:Bool
	
	func makeUIViewController(context: Context) -> some UIImagePickerController {
		let vc = UIImagePickerController()
		vc.allowsEditing = false
		vc.delegate = context.coordinator
		return vc
	}
	// from swiftui to uikit
	func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {

	}
	// from uikit to swiftui
	func makeCoordinator() -> Coordinator {
		return Coordinator(image: $image,showScreen: $showScreen)
	}
	
	class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
		@Binding var image:UIImage?
		@Binding var showScreen:Bool
		
		init(image: Binding<UIImage?>, showScreen: Binding<Bool>) {
			self._image = image
			self._showScreen = showScreen
		}
		
		func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
			guard let newImage = info[.originalImage] as? UIImage else {return}
			image = newImage
			showScreen = false
		}
	}
}

struct BasicUIViewControllerRepresentable: UIViewControllerRepresentable {
	
	let labelText:String
	
	
	
	func makeUIViewController(context: Context) -> some UIViewController {
		let vc = MyFirstViewController()
		vc.labelText = labelText
		
		return vc
	}
	func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
		
	}
}

class MyFirstViewController:UIViewController {
	
	var labelText:String = "Starting value"
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.backgroundColor = .blue
		
		let label = UILabel()
		label.text = labelText
		label.textColor = .white
		
		view.addSubview(label)
		label.frame = view.frame
		
	}
}
