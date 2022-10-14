//
//  DownloadingImagesViewModel.swift
//  StartSwiftUI
//
//  Created by M H on 15/09/2022.
//

import Foundation
import Combine

class DownloadingImagesViewModel: ObservableObject {
	@Published var dataArray:[PhotoModel] = []
	var cancellables = Set<AnyCancellable>()
	
	let dataService = PhotoModelDataService.instance
	
	init() {
		addSubscribers()
	}
	
	func addSubscribers() {
		dataService.$photoModels
			.sink { [weak self] returnedPhotoModels in
				self?.dataArray = returnedPhotoModels
			}
			.store(in: &cancellables)
	}
}
