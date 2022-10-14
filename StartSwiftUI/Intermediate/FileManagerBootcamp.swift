//
//  FileManagerBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 14/09/2022.
//

import SwiftUI

class LocalFileManager {
	static let instance = LocalFileManager()
	let folderName:String = "MyApp_Images"
	
	private init () {
		createdFolderIfNeeded()
	}
	
	func createdFolderIfNeeded() {
		guard
			let path = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)
				.first?
				.appendingPathComponent(folderName)
				.path else {
			return
		}
		
		if !FileManager.default.fileExists(atPath: path) {
			do {
				try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true)
				print("Success creating folder")
			} catch let error {
				print("Error deleting folder: \(error)")
			}
		}
	}
	func deleteFolder() {
		guard
			let path = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)
				.first?
				.appendingPathComponent(folderName)
				.path else {
			return
		}
		
			do {
				try FileManager.default.removeItem(atPath: path)
				print("Success deleting folder")
			} catch let error {
				print("Error deleting folder: \(error)")
			}
	}
	func saveImage(image:UIImage,name:String) -> String {
		guard
			let data = image.pngData(),
		let path = getPath(name: name) else {
			print("error getting data")
			return "error getting data"
		}
		
		do {
			try data.write(to: path)
			print(path)
			print("Success saving")
			return "Success saving"
		} catch let error {
			print("Error saving: \(error)")
			return "Error saving: \(error)"
		}
	}
	
	func getImage(name:String ) -> UIImage? {
		guard
			let path = getPath(name: name)?.path,
			FileManager.default.fileExists(atPath: path) else {
			print("Error getting path")
			return nil
		}
		
		return UIImage(contentsOfFile: path)
	}
	
	func getPath(name:String) -> URL? {
		
		//		let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
		//		let path = directory?.appendingPathComponent("\(name).png")
		//

		guard
			let path = FileManager
				.default
				.urls(for: .cachesDirectory, in: .userDomainMask)
				.first?
				.appendingPathComponent(folderName)
				.appendingPathComponent("\(name).png") else {
			print("Error getting path")
			return nil
		}
		return path
	}
	
	func deleteImage(name:String) -> String {
		guard
			let path = getPath(name: name),
			FileManager.default.fileExists(atPath: path.path) else {
			print("Error getting path")
			return "Error getting path"
		}
		
		do {
			try FileManager.default.removeItem(at: path)
			print("Successfully deleted")
			return "Successfully deleted"
		} catch let error {
			print("Error deleting: \(error)")
			return "Error deleting: \(error)"
		}
	}
}

class FileManagerViewModel: ObservableObject {

	@Published var image: UIImage? = nil
	@Published var infomessage:String = ""
	let imageName:String = "bg"
	let manager = LocalFileManager.instance
	
	init() {
		getImageFromAssetsFolder()
//		getImageFromFileManager()
	}
	
	func getImageFromAssetsFolder() {
		image = UIImage(named: imageName)
	}
	func getImageFromFileManager() {
		image = manager.getImage(name: imageName)
	}
	func saveImage() {
		guard let image = image else {return}
		infomessage = manager.saveImage(image: image, name: imageName)
	}
	func deleteImage() {
		infomessage = manager.deleteImage(name: imageName)
		manager.deleteFolder()
	}
}

struct FileManagerBootcamp: View {
	
	@StateObject var vm = FileManagerViewModel()
	
    var body: some View {
		NavigationView {
			VStack {
				if let image = vm.image {
					Image(uiImage: image)
						.resizable()
						.scaledToFill()
						.frame(width: 200,height: 200)
						.clipped()
						.cornerRadius(10)
				}
				
				HStack {
					Button {
						vm.saveImage()
					} label: {
						Text("Save to FM")
							.foregroundColor(.white)
							.padding()
							.padding(.horizontal)
							.background(.blue)
							.cornerRadius(10)
				}
					Button {
						vm.deleteImage()
					} label: {
						Text("Delete from FM")
							.foregroundColor(.white)
							.padding()
							.padding(.horizontal)
							.background(.red)
							.cornerRadius(10)
					}
				}
				
				Text(vm.infomessage)
					.font(.largeTitle)
					.fontWeight(.semibold)

				Spacer()
			}
			.navigationTitle("File Manager")
			
			
		}
    }
}

struct FileManagerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        FileManagerBootcamp()
    }
}
