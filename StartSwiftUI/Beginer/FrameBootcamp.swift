//
//  FrameBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 02/09/2022.
//

import SwiftUI

struct FrameBootcamp: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
			.background(Color.green)
			.frame(width: 200, height: 100, alignment: .center)
			.background(Color.red)
		
    }
}

struct FrameBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        FrameBootcamp()
    }
}
