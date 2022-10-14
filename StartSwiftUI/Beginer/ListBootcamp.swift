//
//  ListBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 03/09/2022.
//

import SwiftUI

struct ListBootcamp: View {
	
	@State var fruits:[String] = ["Apple", "Orange", "Banana", "Peach"]
	@State var veggies:[String] = ["Tomato", "Potato", "Carrot"]
	
    var body: some View {
		NavigationView {
			List {
				Section(header: Text("Fruits")) {
					ForEach(fruits, id: \.self) { fruit in
						Text(fruit)
					}
					.onDelete { indexSet in
						delete(index: indexSet)
					}
					.onMove { indexSet, i in
						move(index: indexSet, i: i)
					}
					.listRowBackground(Color.yellow)
				}
				
				Section(header: Text("Veggies")) {
					ForEach(veggies, id: \.self) { fruit in
						Text(fruit)
					}
				}
				
			}
			
			.listStyle(InsetGroupedListStyle())
			.navigationTitle("Glocery List")
			.navigationBarItems(
				leading: EditButton(),
				trailing: Button("Add") {
					add()
				})
		}
		.accentColor(.red)
    }
	
	func delete(index: IndexSet){
		fruits.remove(atOffsets: index)
	}
	func move(index:IndexSet, i:Int){
		fruits.move(fromOffsets: index, toOffset: i)
	}
	func add(){
		fruits.append("Coconut")
	}
}

struct ListBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ListBootcamp()
    }
}
