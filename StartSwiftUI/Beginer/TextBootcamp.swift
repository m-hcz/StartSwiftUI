//
//  TextBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 02/09/2022.
//

import SwiftUI

struct TextBootcamp: View {
    var body: some View {
		Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
			.font(.body)
			.fontWeight(.semibold)
			.foregroundColor(Color.red)
			.underline()
			.baselineOffset(50)
			.kerning(10)
			.multilineTextAlignment(.leading)
			.frame(width: 200, height: 100, alignment: .center)
			.minimumScaleFactor(0.1)
			
    }
}

struct TextBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TextBootcamp()
    }
}
