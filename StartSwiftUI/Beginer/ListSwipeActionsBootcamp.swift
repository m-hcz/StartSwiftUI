//
//  ListSwipeActionsBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 06/09/2022.
//

import SwiftUI

struct ListSwipeActionsBootcamp: View {
	
	@State var fruits:[String] = ["Apple", "Orange", "Banana", "Peach"]
	@State var veggies:[String] = ["Tomato", "Potato", "Carrot"]
	
    var body: some View {
        
		List {
			ForEach(fruits, id:\.self) { fruit in
				Text(fruit)
					.swipeActions(edge: .trailing, allowsFullSwipe: false) {
						Button("Archive") {
							
						}
						.tint(.pink)
						Button("Save") {
							
						}
						.tint(.green)
						Button("AAA") {
							
						}
						.tint(.black)
					}
					.swipeActions(edge: .leading, allowsFullSwipe: true) {
						Button("share") {
							
						}
						.tint(.yellow)
					
					}
			}
//			.onDelete { indexSet in
//				// delete
//			}
		}
    }
}

struct ListSwipeActionsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ListSwipeActionsBootcamp()
    }
}
