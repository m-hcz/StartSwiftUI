//
//  WeakSelfBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 12/09/2022.
//

import SwiftUI

struct WeakSelfBootcamp: View {
	
	@AppStorage("count") var count: Int?
	
	init() {
		count = 0
	}
	
    var body: some View {
		NavigationView {
			NavigationLink("Navigate") {
				WeakSelfSecondScreen()
					
			}
			.navigationTitle("Screen 1")
		}
		.overlay(
			Text("\(count ?? 0)")
				.font(.largeTitle)
				.padding()
				.background(Color.green.cornerRadius(10))
			, alignment: .topTrailing
		)
    }
}

struct WeakSelfSecondScreen: View {
	
	@StateObject var vm = WeakSelfSecondScreenViewModel()
	
	var body: some View {
		VStack {
			Text("Second View")
				.font(.largeTitle)
			.foregroundColor(.red)
			
			if let data = vm.data {
				Text(data)
			}
		}
		
		
	}
}

class WeakSelfSecondScreenViewModel: ObservableObject {
	@Published var data: String? = nil
	
	init() {
		print("initialize now")
		let currentCount = UserDefaults.standard.integer(forKey: "count")
		UserDefaults.standard.set(currentCount + 1, forKey: "count")
		getData()
	}
	
	deinit {
		print("deinitialize now")
		let currentCount = UserDefaults.standard.integer(forKey: "count")
		UserDefaults.standard.set(currentCount - 1, forKey: "count")
	}
	
	func getData() {
		// self = class waits till task is ended
		// weak self = class is deinit, does't wait
		DispatchQueue.main.asyncAfter(deadline: .now() + 500) { [weak self] in
			self?.data = "New data!!"
		}
	}
}

struct WeakSelfBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        WeakSelfBootcamp()
    }
}
