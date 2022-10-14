//
//  EscapingBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 12/09/2022.
//

import SwiftUI

class EscapingViewModel : ObservableObject {
	@Published var text:String = "Hello"
	
	func getData() {
		downloadData5 { [weak self] returnedDataModel in
			self?.text = returnedDataModel.data
		}
	}
	
	// sync
	func downloadData() -> String {
		return "new data!"
	}
	
	// async
	func downloadData2(completionHandler: (_ data:String) -> ()) { // () = Void
		completionHandler("new data!!")
	}
	func downloadData3(completionHandler: @escaping (_ data:String) -> ()) { // () = Void
		DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
			completionHandler("new data!!")
		}
	}
	func downloadData4(completionHandler: @escaping (_ data:DownloadResultModel) -> ()) { // () = Void
		DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
			let result = DownloadResultModel(data: "new data!!")
			completionHandler(result)
		}
	}
	func downloadData5(completionHandler: @escaping DownloadCompletionModel) {
		DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
			let result = DownloadResultModel(data: "new data!!")
			completionHandler(result)
		}
	}
}

struct DownloadResultModel {
	let data:String
}

typealias DownloadCompletionModel = (DownloadResultModel) -> ()

struct EscapingBootcamp: View {
	
	@StateObject var vm = EscapingViewModel()
	
    var body: some View {
		Text(vm.text)
			.font(.largeTitle)
			.fontWeight(.semibold)
			.foregroundColor(.blue)
			.onTapGesture {
				vm.getData()
			}
    }
}

struct EscapingBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        EscapingBootcamp()
    }
}
