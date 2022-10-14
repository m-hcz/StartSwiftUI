//
//  AppStorageBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 04/09/2022.
//

import SwiftUI

struct AppStorageBootcamp: View {
	
	//@State var currentUserName: String? = nil
	@AppStorage("name") var currentUserName: String?
	
    var body: some View {
		VStack(spacing: 20) {
			Text(currentUserName ?? "Add name here")
			
			if let name = currentUserName {
				Text(name)
			}
			
			Button("Save") {
				let name = "Adam"
				currentUserName = name
				
				//UserDefaults.standard.set(name, forKey: "name")
			}
		}
//		.onAppear {
//			currentUserName = UserDefaults.standard.string(forKey: "name")
//		}
    }
}

struct AppStorageBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        AppStorageBootcamp()
    }
}
