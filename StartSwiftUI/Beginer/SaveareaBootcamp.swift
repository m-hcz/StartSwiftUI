//
//  SaveareaBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 03/09/2022.
//

import SwiftUI

struct SaveareaBootcamp: View {
    var body: some View {

			
		ScrollView {
			VStack {
				Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
					.font(.largeTitle)
				
				ForEach(0..<10){ i in
					RoundedRectangle(cornerRadius: 20)
						.fill(Color.orange)
						.frame(height: 150)
						.padding()
				}
			}
			
		}
		.background(
			Color.red
				//.edgesIgnoringSafeArea(.all) // old
				.ignoresSafeArea(.all)
		)
			
			

    }
}

struct SaveareaBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SaveareaBootcamp()
    }
}
