//
//  CoreDataBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 11/09/2022.
//

import SwiftUI
import CoreData

class CoreDataViewModel: ObservableObject {
	let container: NSPersistentContainer
	@Published var savedEntities: [FruitEntity] = []
	
	init() {
		container = NSPersistentContainer(name: "FruitsContainer")
		container.loadPersistentStores { description, error in
			if let error = error {
				print("Error loadinf core data: \(error)")
			} else {
				//print("Successfully load core data")
			}
		}
	}
	
	func fetchFruits() {
		let request = NSFetchRequest<FruitEntity>(entityName: "FruitEntity")
		
		do {
			savedEntities = try container.viewContext.fetch(request)
		} catch let error {
		print("Error fetching: \(error)")
		}
		
	}
	
	func addFruit(name: String) {
		let fruit = FruitEntity(context: container.viewContext)
		fruit.name = name
		
		saveData()
	}
	
	func updateFruit(fruit:FruitEntity) {
		fruit.name = (fruit.name ?? "") + "!"
		
		saveData()
	}
	func deleteFruit(indexSet:IndexSet) {
		guard let index = indexSet.first else {return}
		let entity = savedEntities[index]
		container.viewContext.delete(entity)
		
		saveData()
	}
	
	func saveData() {
		do {
			try container.viewContext.save()
			fetchFruits()
		} catch let error {
			print("Error saving: \(error)")
		}
	}
	
}

struct CoreDataBootcamp: View {
	
	@StateObject var vm = CoreDataViewModel()
	@State var filedText:String = ""
	
    var body: some View {
		NavigationView {
			VStack(spacing: 20.0) {
				TextField("Add fruit here...", text: $filedText)
					.font(.headline)
					.padding(.leading)
					.frame(height: 55)
					.background(Color.primary.opacity(0.1))
					.cornerRadius(10)
					.padding(.horizontal)
				
				Button {
					guard !filedText.isEmpty else {return}
					vm.addFruit(name: filedText)
					filedText = ""
				} label: {
					Text("Add")
						.font(.headline)
						.foregroundColor(.white)
						.frame(height: 55)
						.frame(maxWidth: .infinity)
						.background(.blue)
						.cornerRadius(10)
						.padding(.horizontal)
				}

				List {
					ForEach(vm.savedEntities) {fruit in
						Text(fruit.name ?? "No name")
							.onTapGesture {
								vm.updateFruit(fruit: fruit)
							}
					}
					.onDelete(perform: vm.deleteFruit)
				}
				.listStyle(PlainListStyle())
			}
			.navigationTitle("Fruits")
		}
    }
}

struct CoreDataBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataBootcamp()
    }
}
