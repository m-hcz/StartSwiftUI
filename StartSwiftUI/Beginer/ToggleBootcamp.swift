//
//  ToggleBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 03/09/2022.
//

import SwiftUI

struct ToggleBootcamp: View {
	
	@State var toggleIsOn:Bool = false
    var body: some View {
		VStack {
			HStack {
				Text("Status:")
				Text(toggleIsOn ? "Online" : "Offline")
			}
			.font(.title)
			
			Toggle(isOn: $toggleIsOn) {
				Text("Change status")
			}
			.toggleStyle(SwitchToggleStyle(tint: Color.red))
			
			Spacer()
		}
		.padding()
    }
}

struct ToggleBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ToggleBootcamp()
    }
}
