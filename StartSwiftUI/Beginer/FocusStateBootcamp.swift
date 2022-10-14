//
//  FocusStateBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 06/09/2022.
//

import SwiftUI

struct FocusStateBootcamp: View {
	
	@FocusState private var usernameInFocus:Bool
	@State private var username:String = ""
	
    var body: some View {
		VStack {
			TextField("Add your name here ...", text: $username)
				.focused($usernameInFocus)
				.padding()
				.background(Color.gray.opacity(0.3))
				.cornerRadius(10)
				.onSubmit {
					print("print to the console")
				}
				.submitLabel(.next)
		}
		.padding()
		.onAppear {
			DispatchQueue.main.asyncAfter(deadline: .now()  + 0.5) {
				usernameInFocus.toggle()

			}
		}
    }
}

struct FocusStateBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        FocusStateBootcamp()
    }
}
