//
//  ViewModelBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 04/09/2022.
//

import SwiftUI

struct FruitModel: Identifiable {
	let id:String = UUID().uuidString
	let name:String
	let count:Int
}

class FruitViewModel : ObservableObject{
	@Published var fruits: [FruitModel] = [] // @Published == @State for classes
	@Published var isLoading:Bool = false
	
	
	init() {
		getFruits()
	}
	
	
	func getFruits() {
		isLoading = true
		
		DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
			self.fruits.append( FruitModel(name: "Orange", count: 1))
			self.fruits.append( FruitModel(name: "Mango", count: 14))
			self.fruits.append( FruitModel(name: "Watermelon", count: 98))
			
			self.isLoading = false
		}
		
	}
	
	func deleteFruit(i:IndexSet) {
		fruits.remove(atOffsets: i)
	}
}

struct ViewModelBootcamp: View {
	
	//@ObservedObject var fruitViewModel:FruitViewModel = FruitViewModel() // @ObservedObject will refresh if view is refreshed = use it for subviews
	@StateObject var fruitViewModel:FruitViewModel = FruitViewModel() // @StateObject stays if view is refresed = use it only for init or creation
	
    var body: some View {
		NavigationView {
			List {
				if fruitViewModel.isLoading {
					ProgressView()
				} else {
					ForEach(fruitViewModel.fruits) { fruit in
						HStack {
							Text("\(fruit.count)")
								.foregroundColor(.red)
							Text(fruit.name)
								.font(.headline)
								.bold()
						}
					}
					.onDelete { indexSet in
						fruitViewModel.deleteFruit(i: indexSet)
					}
				}
				
			}
			.navigationTitle("Fruit list")
			.navigationBarItems(trailing:
									NavigationLink(destination: {
				SecondScreenObservable(fruitViewModel: fruitViewModel)
			}, label: {
				Image(systemName: "arrow.right")
			})
			)
		}
    }
	

}


struct SecondScreenObservable:View {
	
	@ObservedObject var fruitViewModel:FruitViewModel
	
	var body: some View {
		ZStack {
			Color.gray.ignoresSafeArea()
			
			VStack {
				ForEach(fruitViewModel.fruits) { fruit in
						Text(fruit.name)
							.font(.headline)
							.bold()
				}
			}
		}
	}
}
struct ViewModelBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ViewModelBootcamp()
    }
}
