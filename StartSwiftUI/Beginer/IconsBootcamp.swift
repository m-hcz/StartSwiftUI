//
//  IconsBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 02/09/2022.
//

import SwiftUI

struct IconsBootcamp: View {
    var body: some View {
        Image(systemName: "heart.fill")
			.resizable()
			.aspectRatio(contentMode: .fit)
			.font(.largeTitle)
			.foregroundColor(.red)
			.frame(width: 300, height: 300)
			
    }
}

struct IconsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        IconsBootcamp()
    }
}
