//
//  HashableBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 11/09/2022.
//

import SwiftUI

struct HashableCustomModel:Hashable {
	let title:String
	
	func hash(into hasher: inout Hasher) {
		hasher.combine(title)
	}
}

struct HashableBootcamp: View {
	
	let data:[HashableCustomModel] = [
		HashableCustomModel(title: "one"),
		HashableCustomModel(title: "two"),
		HashableCustomModel(title: "three")
	]
	
    var body: some View {
		ScrollView {
			VStack(spacing: 40.0) {
				ForEach(data, id:\.self) { item in
					Text(item.hashValue.description)
						.font(.headline)
				}
//				ForEach(data) { item in
//					Text(item.id)
//						.font(.headline)
//				}
			}
		}
    }
}

struct HashableBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        HashableBootcamp()
    }
}
