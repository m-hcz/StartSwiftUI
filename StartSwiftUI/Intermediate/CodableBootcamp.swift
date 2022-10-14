//
//  CodableBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 13/09/2022.
//

import SwiftUI

// Codable = Decodable and Encodable {
struct CustomerModel : Identifiable, Codable {
	let id:String
	let name:String
	let points:Int
	let isPremium:Bool
	
//	enum CodingKeys: String, CodingKey {
//		case id
//		case name
//		case points
//		case isPremium
//	}
//
//	init(id:String, name:String, points:Int, isPremium:Bool) {
//		self.id = id
//		self.name = name
//		self.points = points
//		self.isPremium = isPremium
//	}
//
//	// Decodable
//	init(from decoder:Decoder) throws {
//		let container = try decoder.container(keyedBy: CodingKeys.self)
//		self.id = try container.decode(String.self, forKey: .id)
//		self.name = try container.decode(String.self, forKey: .name)
//		self.points = try container.decode(Int.self, forKey: .points)
//		self.isPremium = try container.decode(Bool.self, forKey: .isPremium)
//	}
//
//	// Encodable
//	func encode(to encoder: Encoder) throws {
//		var container = encoder.container(keyedBy: CodingKeys.self)
//
//		try container.encode(id, forKey: .id)
//		try container.encode(name, forKey: .name)
//		try container.encode(points, forKey: .points)
//		try container.encode(isPremium, forKey: .isPremium)
//	}
}

class CodableViewModel:ObservableObject {
	@Published var customer: CustomerModel? = nil
	
	init() {
		getData()
	}
	
	func getData() {
		guard let data = getJSONData() else {return}
		
		self.customer = try? JSONDecoder().decode(CustomerModel.self, from: data)
		
//		do {
//			self.customer = try JSONDecoder().decode(CustomerModel.self, from: data)
//		} catch let error {
//			print("Error decoding: \(error)")
//		}
		
		// manual decoder
//		if
//			let localData = try? JSONSerialization.jsonObject(with: data),
//			let dictionery = localData as? [String:Any],
//			let id = dictionery["id"] as? String,
//			let name = dictionery["name"] as? String,
//			let points = dictionery["points"] as? Int,
//			let isPremium = dictionery["isPremium"] as? Bool {
//
//			let newCustomer = CustomerModel(id: id, name: name, points: points, isPremium: isPremium)
//			customer = newCustomer
//		}
	}
	
	func getJSONData() -> Data? {
		let customer = CustomerModel(id: "456", name: "Emily", points: 100, isPremium: false)
		let jsonData = try? JSONEncoder().encode(customer)
//		let dictionary: [String:Any] = [
//			"id" : "123",
//			"name" : "Joe",
//			"points" : 5,
//			"isPremium" : true
//		]
//		let jsonData = try? JSONSerialization.data(withJSONObject: dictionary, options: [])
		return jsonData
	}
}

struct CodableBootcamp: View {
	
	@StateObject var vm = CodableViewModel()
	
    var body: some View {
		VStack {
			if let customer = vm.customer {
				Text(customer.id)
				Text(customer.name)
				Text("\(customer.points)")
				Text(customer.isPremium.description)
			}
		}
    }
}

struct CodableBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        CodableBootcamp()
    }
}
