//
//  ImagesBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 02/09/2022.
//

import SwiftUI

struct ImagesBootcamp: View {
    var body: some View {
        Image("myimage")
			.renderingMode(.template)
			.resizable()
			.foregroundColor(Color.red)
			.scaledToFit()
			.frame(width: 150, height: 150)
			.clipShape(Circle())
    }
}

struct ImagesBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ImagesBootcamp()
    }
}
