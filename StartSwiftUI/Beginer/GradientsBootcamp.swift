//
//  GradientsBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 02/09/2022.
//

import SwiftUI

struct GradientsBootcamp: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
			.fill(
				//Color.red
				LinearGradient(colors: [Color.red,Color.blue], startPoint: .leading, endPoint: .trailing)
			)
			.frame(width: 300, height: 200)
    }
}

struct GradientsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        GradientsBootcamp()
    }
}
