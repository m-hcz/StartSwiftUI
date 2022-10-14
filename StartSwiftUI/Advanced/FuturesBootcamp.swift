//
//  FuturesBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 14/10/2022.
//

import SwiftUI
import Combine

class FuturesBootcampViewModel: ObservableObject {
	@Published var title: String = "Starting title"
	let url = URL(string: "https://www.youtube.com/")!
	var cancellable = Set<AnyCancellable>()
	
	init() {
		download()
	}
	
	func download() {
		//		getCombinePublisher()
		getFuturePublisher()
			.sink { _ in
				
			} receiveValue: { [weak self] returnedValue in
				self?.title = returnedValue
			}
			.store(in: &cancellable)
		
		//		getEscapingClosure { [weak self] returnedValue, error in
		//			self?.title = returnedValue
		//		}
		
		
	}
	
	func getCombinePublisher() -> AnyPublisher<String,URLError> {
		URLSession.shared.dataTaskPublisher(for: url)
			.timeout(1, scheduler: DispatchQueue.main)
			.map({ _ in
				return "New value"
			})
			.eraseToAnyPublisher()
	}
	
	func getEscapingClosure(completionHandler: @escaping (_ value:String, _ error:Error?) -> ()) {
		URLSession.shared.dataTask(with: url) { data, response, error in
			completionHandler("New value 2", nil)
		}
		.resume()
	}
	
	func getFuturePublisher() -> Future<String, Error> {
		return Future { promise in
			self.getEscapingClosure { returnedValue, error in
				if let error = error {
					promise(.failure(error))
				} else {
					promise(.success(returnedValue))
				}
			}
		}
	}
	
	func doSomething(completionHandler: @escaping (_ value:String) -> ()) {
		DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
			completionHandler("NEW STRING")
		}
	}
	
	func doSomethingInTheFuture() -> Future<String, Never> {
		Future { promise in
			self.doSomething { value in
				promise(.success(value))
			}
		}
	}
}

struct FuturesBootcamp: View {
	
	@StateObject private var vm = FuturesBootcampViewModel()
	
    var body: some View {
		Text(vm.title)
    }
}

struct FuturesBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        FuturesBootcamp()
    }
}
