//
//  EnronmentObjectBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 04/09/2022.
//

import SwiftUI

class EnvironmentViewModel: ObservableObject {
	@Published var dataArray:[String] = []
	
	init() {
		getData()
	}
	
	func getData() {
		self.dataArray.append(contentsOf: ["iPhone", "iPad", "iMac" , "iWatch"])
	}
}

struct EnronmentObjectBootcamp: View {
	
	@StateObject var vm:EnvironmentViewModel = EnvironmentViewModel()
	
    var body: some View {
		NavigationView {
			List {
				ForEach(vm.dataArray, id:\.self) { data in
					NavigationLink {
						SecondViewEnvironment(selectedItem: data)
					} label: {
						Text(data)
					}

				}
			}
			.navigationTitle("iOS devices")
		}
		.environmentObject(vm)
		
	}
}

struct SecondViewEnvironment:View {
	
	let selectedItem:String
	
	var body: some View {
		ZStack {
			Color.yellow.ignoresSafeArea()
			
			NavigationLink {
				FinalViewEnvironment()
			} label: {
				Text(selectedItem)
					.font(.headline)
			}

		}
	}
}

struct FinalViewEnvironment: View {
	
	@EnvironmentObject var vm:EnvironmentViewModel
	var body: some View {
		ZStack {
			Color.green.ignoresSafeArea()
			
			ScrollView {
				VStack {
					ForEach(vm.dataArray, id:\.self) { data in
							Text(data)
					}
				}
			}
		}
	}
}

struct EnronmentObjectBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        EnronmentObjectBootcamp()
    }
}
