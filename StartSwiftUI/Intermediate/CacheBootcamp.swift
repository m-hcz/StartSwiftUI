//
//  CacheBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 15/09/2022.
//

import SwiftUI

class CacheManager {
	static let instance = CacheManager()
	
	private init() {
		
	}
	
	var imageCache: NSCache<NSString, UIImage> = {
		let cache = NSCache<NSString, UIImage>()
		cache.countLimit = 100
		cache.totalCostLimit = 1024*1024*100 //100MB
		
		return cache
	}()
	
	func add(image:UIImage, name:String) -> String {
		imageCache.setObject(image, forKey: name as NSString)
			return "Added to cache"
	}
	
	func remove(name:String) -> String {
		imageCache.removeObject(forKey: name as NSString)
		return "Removed from cache"
	}
	
	func get(name:String) -> UIImage? {
		return imageCache.object(forKey: name as NSString)
	}
}

class CacheViewModel : ObservableObject {
	@Published var startingImage:UIImage? = nil
	@Published var cachedImage: UIImage? = nil
	@Published var infomessage:String = ""
	
	let imageName:String = "bg"
	let manager = CacheManager.instance
	
	init() {
		getImageFromAssetsFolder()
	}
	
	func getImageFromAssetsFolder() {
		startingImage = UIImage(named: imageName)
	}
	
	func savedToCache() {
		guard let image = startingImage else {return}
		infomessage = manager.add(image: image, name: imageName)
	}
	
	func removeFromCache() {
		infomessage = manager.remove(name: imageName)
	}
	
	func getFromCache() {
		if let returnedImage = manager.get(name: imageName) {
			cachedImage = returnedImage
			infomessage = "Got image from cache"
		} else {
			infomessage = "Image not found in cache"
		}
	}
}

struct CacheBootcamp: View {
	
	@StateObject var vm = CacheViewModel()
	
    var body: some View {
		NavigationView {
			VStack {
				if let image = vm.startingImage {
					Image(uiImage: image)
						.resizable()
						.scaledToFill()
						.frame(width: 200,height: 200)
						.clipped()
						.cornerRadius(10)
				}
				
				Text(vm.infomessage)
					.font(.largeTitle)
					.fontWeight(.semibold)
				
				HStack {
					Button {
						vm.savedToCache()
					} label: {
						Text("Save to cache")
							.foregroundColor(.white)
							.padding()
							.padding(.horizontal)
							.background(.blue)
							.cornerRadius(10)
					}
					Button {
						vm.removeFromCache()
					} label: {
						Text("Delete from cache")
							.foregroundColor(.white)
							.padding()
							.padding(.horizontal)
							.background(.red)
							.cornerRadius(10)
					}
					
					Button {
						vm.getFromCache()
					} label: {
						Text("Get from cache")
							.foregroundColor(.white)
							.padding()
							.padding(.horizontal)
							.background(.red)
							.cornerRadius(10)
					}
				}
				
				if let image = vm.cachedImage {
					Image(uiImage: image)
						.resizable()
						.scaledToFill()
						.frame(width: 200,height: 200)
						.clipped()
						.cornerRadius(10)
				}
				
				
				
				Spacer()
			}
			.navigationTitle("File Manager")
			
			
		}
    }
}

struct CacheBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        CacheBootcamp()
    }
}
