//
//  DependencyInjectionBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 08/10/2022.
//

import SwiftUI
import Combine

protocol DataServiceProtocol {
	func getData() -> AnyPublisher<[PostModel], Error>
}

struct PostsModel: Codable {
	let userId: Int
	let id: Int
	let title:String
	let body: String
}

class ProductionDataService: DataServiceProtocol {
	
	//static let instance = ProductionDataService()
	
	let url:URL
	
	init(url: URL) {
		self.url = url
	}
	
	func getData() -> AnyPublisher<[PostModel], Error> {
		URLSession.shared.dataTaskPublisher(for: url)
			.map( {$0.data})
			.decode(type: [PostModel].self, decoder: JSONDecoder())
			.receive(on: DispatchQueue.main)
			.eraseToAnyPublisher()
	}
}

class MockDataService: DataServiceProtocol {
	
	let testData: [PostModel]
	
	init(data: [PostModel]?) {
		self.testData = data ?? [
			PostModel(userId: 1, id: 1, title: "One", body: "one"),
			PostModel(userId: 2, id: 2, title: "Two", body: "two")
		]
	}
	
	func getData() -> AnyPublisher<[PostModel], Error> {
		Just(testData)
			.tryMap({$0})
			.eraseToAnyPublisher()
	}
	
	
}

class DependencyInjectionViewModel: ObservableObject {
	@Published var dataArray:[PostModel] = []
	var cancellables = Set<AnyCancellable>()
	let dataService: DataServiceProtocol
	
	init(dataService: DataServiceProtocol) {
		self.dataService = dataService // injection
		loadPosts()
	}
	
	private func loadPosts() {
		dataService.getData()
			.sink { _ in
				
			} receiveValue: { [weak self] returnedPosts in
				self?.dataArray = returnedPosts
			}
			.store(in: &cancellables)

	}
}

struct DependencyInjectionBootcamp: View {
	@StateObject private var vm : DependencyInjectionViewModel
	
	init(dataService: DataServiceProtocol) {
		_vm = StateObject(wrappedValue: DependencyInjectionViewModel(dataService: dataService))
	}
	
    var body: some View {
		ScrollView {
			VStack {
				ForEach(vm.dataArray) {post in
					Text(post.title)
				}
			}
		}
    }
}

struct DependencyInjectionBootcamp_Previews: PreviewProvider {
	
//	static let dataService = ProductionDataService(url: URL(string: "https://jsonplaceholder.typicode.com/posts")!)
	static let dataService = MockDataService(data: nil)
	
	
    static var previews: some View {
		DependencyInjectionBootcamp(dataService: dataService)
    }
}
