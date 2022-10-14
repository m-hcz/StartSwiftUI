//
//  DownloadWithCombineBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 13/09/2022.
//

import SwiftUI
import Combine

struct CombinePostModel: Identifiable, Codable {
	let userId, id: Int
	let title, body: String
	
}

class DownloadWithCombineViewModel: ObservableObject {
	@Published var posts: [CombinePostModel] = []
	var cancellables = Set<AnyCancellable>()
	
	init() {
		getPosts()
	}
	
	func getPosts() {
		guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
		
		URLSession.shared.dataTaskPublisher(for: url)
			.subscribe(on: DispatchQueue.global(qos: .background))
			.receive(on: DispatchQueue.main)
			.tryMap { (data, response) -> Data in
				guard let response = response as? HTTPURLResponse,
					  response.statusCode >= 200 && response.statusCode < 300 else {
					throw URLError(.badServerResponse)
				}
				return data
			}
			.decode(type: [CombinePostModel].self, decoder: JSONDecoder())
			.sink { completion in
				switch completion {
					case .finished:
						print("finished")
					case .failure(let error):
						print("Error: \(error)")
				}
			} receiveValue: { [weak self] returnedPosts in
				self?.posts = returnedPosts
			}
			.store(in: &cancellables)

	}
}

struct DownloadWithCombineBootcamp: View {
	
	@StateObject var vm = DownloadWithCombineViewModel()
	
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

struct DonwloadWithCombineBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        DownloadWithCombineBootcamp()
    }
}
