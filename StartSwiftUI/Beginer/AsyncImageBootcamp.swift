//
//  AsyncImageBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 06/09/2022.
//

import SwiftUI

struct AsyncImageBootcamp: View {
	
	let url = URL(string: "https://picsum.photos/200")
    var body: some View {
		VStack {
			AsyncImage(url: url) { phase in
				switch phase {
					case .empty:
						ProgressView()
					case .success(let image):
						image
							.resizable()
							.scaledToFit()
							.frame(width: 100, height: 100)
							.cornerRadius(20)
					case .failure:
						Image(systemName: "questionamek")
							.font(.headline)
					default:
						Image(systemName: "questionamek")
							.font(.headline)
						
				}
			}
			AsyncImage(url: url, content: { returnedImage in
				returnedImage
					.resizable()
					.scaledToFit()
					.frame(width: 100, height: 100)
					.cornerRadius(20)
			}, placeholder: {
				ProgressView()
		})
		}
			
    }
}

struct AsyncImageBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImageBootcamp()
    }
}
