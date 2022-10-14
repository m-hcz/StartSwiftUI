//
//  AdvancedCombineBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 12/10/2022.
//

import SwiftUI
import Combine

// source: https://heckj.github.io/swiftui-notes/

class AdvancedCombineDataService {
//	@Published var basicPublisher: String = ""
//	let currentValuePublisher = CurrentValueSubject<Int, Error> (0)
	let passThrougnPublisher = PassthroughSubject<Int, Error>()
	let boolPublisher = PassthroughSubject<Bool, Error>()
	let intPublisher = PassthroughSubject<Int, Error>()
	
	init () {
		publishData()
	}
	
	private func publishData() {
		let items: [Int] = Array(1..<11)
		 
		for x in items.indices {
			DispatchQueue.main.asyncAfter(deadline: .now() + Double(x)) {
//				self.basicPublisher = items[x]
				self.passThrougnPublisher.send(items[x])
				
				if x > 4 && x < 8 {
					self.boolPublisher.send(true)
					self.intPublisher.send(999)
				} else {
					self.boolPublisher.send(false)
				}
				
				if x == items.indices.last {
					self.passThrougnPublisher.send(completion: .finished)
				}
			}
		}
	}
}

class AdvancedCombineBootcampViewModel: ObservableObject {
	@Published var data: [String] = []
	@Published var dataBool: [Bool] = []
	@Published var error: String = ""
	
	let dataService = AdvancedCombineDataService()
	var cancellables = Set<AnyCancellable>()
	
	init() {
		addSubscribers()
	}
	
	private func addSubscribers() {
//		dataService.passThrougnPublisher
			// MARK: sequence operations
//			.first()
//			.first(where: { $0 > 4 })
//			.tryFirst(where: { int in
//				if int == 3 {
//					throw URLError(.badServerResponse)
//				}
//
//				return int > 1
//			})
//			.last() // wait to finish
//			.last(where: { $0 > 4 }) // wait to finish
//			.tryLast(where: { int in
//				if int == 3 {
//					throw URLError(.badServerResponse)
//				}
//
//				return int > 1
//			})
//			.dropFirst()
//			.dropFirst(3)
//			.drop(while: { $0 < 3 })
//			.prefix(4)
//			.prefix(while: { $0 < 5 })
//			.output(at: 2) // st index
		
			// MARK: Mathematic operation
//			.max() // wait to finish
//			.max(by: { int1, int2 in
//				return int1 < int2
//			})
//			.min()
//			.min(by: )
		
			// MARK: filter / reducing operations
		
//			.map({String($0)})
//			.tryMap({ int in
//				if int == 5 {
//					throw URLError(.badServerResponse)
//				}
//				return String(int)
//			})
//			.compactMap({ int in
//				if int == 5 {
//					return nil
//				}
//				return String(int)
//			})
//			.tryCompactMap()
//			.filter({ $0 > 3 && $0 < 7})
//			.removeDuplicates()
//			.replaceNil(with: 5)
//			.replaceError(with: "Default value")
//			.scan(0, { existingValue, newValue in
//				return existingValue + newValue
//			})
//			.scan(0, {$0 + $1})
//			.reduce(0, { existingValue, newValue in
//				return existingValue + newValue
//			}) // reduce to single value
//			.collect() // collect to one array
//			.allSatisfy({ $0 == 5 }) / true or false
		
		
			// MARK: timing operations
//			.debounce(for: 1, scheduler: DispatchQueue.main) // at least 1 sec between pubsishers
//			.delay(for: 2, scheduler: DispatchQueue.main) // delay first publisher
//			.measureInterval(using: DispatchQueue.main) // time before publishers in nanosecodns
//			.map({ stride in
//				return "\(stride.timeInterval)"
//			})
//			.throttle(for: 10, scheduler: DispatchQueue.main, latest: true) // skip to last/first publisher for interval
//			.retry(3) // try redownload
//			.timeout(0.75, scheduler: DispatchQueue.main) // terminate publisher called erlier then 0.75 sec
		
			// MARK: multiple publishers / subscribers
//			.combineLatest(dataService.boolPublisher, dataService.intPublisher) // need to wait for all publisher they must have at least one value
//			.compactMap({ (int, bool) in
//				if bool {
//					return String(int)
//				} else {
//					return nil
//				}
//			})
//			.compactMap({ $1 ? String($0) : nil })
//			.removeDuplicates()
//			.compactMap({ (int1, bool, int2) in
//				if bool {
//					return String(int1)
//				} else {
//					return nil
//				}
//			})
//			.merge(with: dataService.intPublisher)
//			.zip(dataService.boolPublisher, dataService.intPublisher)
//			.map({tupple in
//				return String(tupple.0) + tupple.1.description + String(tupple.2)
//			})
//			.tryMap({ _ in
//				throw URLError(.badServerResponse)
//			})
//			.catch({ error in
//				return self.dataService.intPublisher
//			})
		
		
		let sharedPublisher = dataService.passThrougnPublisher
			.dropFirst(2)
			.share()
			.multicast {
				PassthroughSubject<Int, Error>()
			}
		
		sharedPublisher
			.map({String($0)})
			.sink { completion in
				switch completion {
					case .finished:
						break
					case .failure(let error):
						self.error = "Error: \(error)"
				}
			} receiveValue: { [weak self] returnedValue in
				self?.data.append(returnedValue)
			}
			.store(in: &cancellables)
		
		sharedPublisher
			.map({$0 > 5 ? true : false})
			.sink { completion in
				switch completion {
					case .finished:
						break
					case .failure(let error):
						self.error = "Error: \(error)"
				}
			} receiveValue: { [weak self] returnedValue in
				self?.dataBool.append(returnedValue)
			}
			.store(in: &cancellables)
		
		// delay subscribers
		DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
			sharedPublisher
				.connect()
				.store(in: &self.cancellables)
		}
	}
	
}
struct AdvancedCombineBootcamp: View {
	
	@StateObject private var vm = AdvancedCombineBootcampViewModel()
	
    var body: some View {
		ScrollView {
			HStack {
				VStack {
					ForEach(vm.data, id: \.self) {
						Text($0)
							.font(.largeTitle)
							.fontWeight(.black)
					}
					vm.error != "" ? Text(vm.error) : nil
				}
				VStack {
					ForEach(vm.dataBool, id: \.self) {
						Text($0.description)
							.font(.largeTitle)
							.fontWeight(.black)
					}
				}
			}
		}
    }
}

struct AdvancedCombineBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        AdvancedCombineBootcamp()
    }
}
