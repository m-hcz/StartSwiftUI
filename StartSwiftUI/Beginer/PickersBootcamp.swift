//
//  PickersBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 03/09/2022.
//

import SwiftUI

struct PickersBootcamp: View {
	
	@State var selection:String = "18"
	
    var body: some View {
		VStack {
			HStack {
				Text("Age:")
				Text(selection)
			}
			Picker(
				selection: $selection,
				content: {
					ForEach(18..<100) { number in
						Text("\(number)")
							.tag("\(number)")
					}
				},
				label: {
					Text("Picker")
				}
			)
			.pickerStyle(WheelPickerStyle())
		}
    }
}

struct PickersBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        PickersBootcamp()
    }
}
