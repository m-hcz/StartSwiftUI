//
//  BackgroundThreadBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 12/09/2022.
//

import SwiftUI

class BackgroundThreadViewModel: ObservableObject {
	@Published var dataArray: [String] = []
	
	func fetchData() {
		DispatchQueue.global(qos: .background).async {
			let newData = self.downloadData()
			
			print("Thread.current: \(Thread.current)")
			print("Thread.isMainThread: \(Thread.isMainThread)")
			
			DispatchQueue.main.async {
				self.dataArray = newData
				
				print("Thread.current: \(Thread.current)")
				print("Thread.isMainThread: \(Thread.isMainThread)")
			}
		}
		
	}
	
	private func downloadData() -> [String] {
		var data:[String] = []
		
		for x in 0..<100 {
			data.append("\(x)")
			print(data)
		}
		
		return data
	}
}

struct BackgroundThreadBootcamp: View {
	
	@StateObject var vm = BackgroundThreadViewModel()
	
    var body: some View {
		ScrollView {
			LazyVStack(spacing: 10) {
				Text("Load data")
					.font(.largeTitle)
					.fontWeight(.semibold)
					.onTapGesture {
						vm.fetchData()
					}
				
				ForEach(vm.dataArray, id:\.self) { item in
					Text(item)
						.font(.headline)
						.foregroundColor(.red)
				}
			}
		}
    }
}

struct BackgroundThreadBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundThreadBootcamp()
    }
}
