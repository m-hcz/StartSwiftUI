//
//  DownloadWithEscapingBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 13/09/2022.
//

import SwiftUI

struct PostModel: Identifiable, Codable {
	let userId, id: Int
	let title, body: String
	
}

class DownloadWithEscapingViewModel: ObservableObject {
	@Published var posts : [PostModel] = []
	
	init() {
		getPosts()
	}
	
	func getPosts() {
		
		guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
		
		downloadData(url: url) { returnedData in
			if let data = returnedData {
				guard let newPosts = try? JSONDecoder().decode([PostModel].self, from: data) else {return}
				// switch to main thread while updating UI
				DispatchQueue.main.async { [weak self] in
					self?.posts = newPosts
				}
			} else {
				print("No data returned")
			}
		}
	}
	
	func downloadData(url:URL, completionHandler: @escaping (_ data:Data?) -> ()) {
		URLSession.shared.dataTask(with: url) { data, response, error in
			
			guard
				let data = data,
				error == nil,
				let response = response as? HTTPURLResponse,
				response.statusCode >= 200 && response.statusCode < 300 else {
				print("Erroe downloading data")
				completionHandler(nil)
				return
			}
			
			completionHandler(data)
			
		}.resume()
	}
}

struct DownloadWithEscapingBootcamp: View {
	
	@StateObject var vm = DownloadWithEscapingViewModel()
	
    var body: some View {
		List {
			ForEach(vm.posts) { post in
				VStack(alignment: .leading) {
					Text(post.title)
						.font(.headline)
					Text(post.body)
						.foregroundColor(.gray)
				}
				.frame(maxWidth: .infinity, alignment: .leading)
			}
		}
    }
}

struct DownloadWithEscapingBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        DownloadWithEscapingBootcamp()
    }
}
