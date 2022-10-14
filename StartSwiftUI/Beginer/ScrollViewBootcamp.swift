//
//  ScrollViewBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 02/09/2022.
//

import SwiftUI

struct ScrollViewBootcamp: View {
    var body: some View {
		ScrollView(.vertical, showsIndicators: true) {
		LazyVStack {
			ForEach(0..<50) { i in
				ScrollView(.horizontal, showsIndicators: false) {
				HStack {
						ForEach(0..<10) { j in
							Rectangle()
								.fill(Color.white)
								.frame(width: 200,height: 150)
								.cornerRadius(15)
								.shadow(radius: 10)
								.padding()
						}
					}
				}
			}
		} // vs
		} //scrv
    }
}

struct ScrollViewBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewBootcamp()
    }
}
