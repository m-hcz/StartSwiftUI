//
//  GridBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 02/09/2022.
//

import SwiftUI

struct GridBootcamp: View {
	let columns: [GridItem] = [
		//GridItem(.fixed(50), spacing: nil, alignment: nil)
		GridItem(.flexible(), spacing: 1, alignment: nil),
		GridItem(.flexible(), spacing: 1, alignment: nil),
		GridItem(.flexible(), spacing: 1, alignment: nil)
	]
    var body: some View {
		ScrollView{
			
			Rectangle()
				.fill(.orange)
				.frame(height: 400)
			
			LazyVGrid(columns: columns, alignment: .center, spacing: 1, pinnedViews: [.sectionHeaders]){
				
				
				Section(header:
							Text("Section 1")
					.font(.title)
					.foregroundColor(.white)
					.frame(maxWidth: .infinity, alignment: .leading)
					.background(.blue)
					.padding()
				) {
					ForEach(0..<10) { i in
						Rectangle()
							.frame(height: 150)
							.overlay() {
								Text("\(i)")
									.foregroundColor(.white)
							}
						
					}
				}
				Section(header:
							Text("Section 2")
					.font(.title)
					.foregroundColor(.white)
					.frame(maxWidth: .infinity, alignment: .leading)
					.background(.green)
					.padding()
				) {
					ForEach(0..<10) { i in
						Rectangle()
							.frame(height: 150)
							.overlay() {
								Text("\(i)")
									.foregroundColor(.white)
							}
						
					}
				}
				
				}
			
		
//		LazyVGrid(columns: columns) {
//			ForEach(0..<40) { i in
//				Rectangle()
//					.frame(height: 150)
//					.overlay() {
//						Text("\(i)")
//							.foregroundColor(.white)
//					}
//
//			}
//		}
    }
	}
}

struct GridBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        GridBootcamp()
    }
}
