//
//  ArraysBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 11/09/2022.
//

import SwiftUI

struct UserCustomModel:Identifiable {
	let id = UUID().uuidString
	let name:String
	let points:Int
	let isVerified:Bool
}

class ArrayModificationViewModel: ObservableObject {
	@Published var daraArray:[UserCustomModel] = []
	@Published var filteredArray: [UserCustomModel] = []
	@Published var mappedArray: [String] = []
	init() {
		getUsers()
		updateFilteredarray()
	}
	
	func getUsers() {
		daraArray.append(contentsOf: [
			UserCustomModel(name: "A", points: 1, isVerified: false),
			UserCustomModel(name: "B", points: 2, isVerified: true),
			UserCustomModel(name: "C", points: 3, isVerified: true),
			UserCustomModel(name: "D", points: 4, isVerified: false),
			UserCustomModel(name: "E", points: 5, isVerified: true),
			UserCustomModel(name: "F", points: 6, isVerified: true),
			UserCustomModel(name: "G", points: 7, isVerified: false),
			UserCustomModel(name: "H", points: 8, isVerified: true),
			UserCustomModel(name: "I", points: 9, isVerified: false)
		])
	}
	
	func updateFilteredarray() {
		// sort
		// sorted by poitns from bigger
//		filteredArray = daraArray.sorted { user1, user2 in
//			return user1.points > user2.points
//		}
		filteredArray = daraArray.sorted { $0.points > $1.points}
		
		// filetr
//		filteredArray = daraArray.filter({ user in
//			return user.isVerified
//			//return user.name.contains("A")
//		})
		filteredArray = daraArray.filter { $0.isVerified}
		
		// map
//		mappedArray = daraArray.map({ user in
//			return user.name
//		})
		//mappedArray = daraArray.map { $0.name }
		// if propesty is odtional
		//mappedArray = daraArray.compactMap { $0.name }
		

		filteredArray = daraArray
			.sorted { $0.points > $1.points}
			.filter { $0.isVerified}
	}
}

struct ArraysBootcamp: View {
	
	@State var vm: ArrayModificationViewModel = ArrayModificationViewModel()
	
    var body: some View {
		ScrollView {
			VStack(spacing: 20.0) {
				ForEach(vm.filteredArray) { user in
					VStack(alignment: .leading) {
						Text(user.name)
							.font(.headline)
						HStack {
							Text("Points: \(user.points)")
							Spacer()
							if user.isVerified {
								Image(systemName: "flame.fill")
							}
						}
					}
					.foregroundColor(.white)
					.padding()
					.background(Color.blue.cornerRadius(10))
					.padding(.horizontal)
				}
				ForEach(vm.mappedArray, id:\.self) {name in
					Text(name)
						.font(.title)
				}
			}
		}
    }
}

struct ArraysBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ArraysBootcamp()
    }
}
