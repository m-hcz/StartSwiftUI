//
//  DownloadingImageView.swift
//  StartSwiftUI
//
//  Created by M H on 15/09/2022.
//

import SwiftUI

struct DownloadingImageView: View {
	
	@StateObject var loader : ImageLoadingViewModel
	
	init(url:String, key:String) {
		_loader = StateObject(wrappedValue: ImageLoadingViewModel(url: url, key: key))
	}
	
    var body: some View {
		ZStack {
			if loader.isLoading {
				ProgressView()
			} else if let image = loader.image {
				Image(uiImage: image)
					.resizable()
					.clipShape(Circle())
			}
		}
    }
}

struct DownloadingImageView_Previews: PreviewProvider {
    static var previews: some View {
		DownloadingImageView(url: "https://via.placeholder.com/600/771796", key: "1")
    }
}
