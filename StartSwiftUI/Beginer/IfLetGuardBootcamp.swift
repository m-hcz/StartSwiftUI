//
//  IfLetGuardBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 04/09/2022.
//

import SwiftUI

struct IfLetGuardBootcamp: View {
	
	@State var currentUserID:String? = nil
	@State var displayText:String? = nil
	@State var isLoading:Bool = false
	
    var body: some View {
		NavigationView {
			VStack {
				Text("Data from database")
				
				if let text = displayText {
					Text(text)
				}
				
				if isLoading {
					ProgressView()
				}
			}
			.onAppear(perform: {
				loadData()
			})
			.navigationTitle("Safe coding")
		}
    }
	
	func loadData() {
		
		if let userId = currentUserID {
			isLoading = true
			
			DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
				displayText = "Data loaded for user: \(userId)"
				isLoading = false
			}
		} else {
			displayText = "Error, no user ID"
		}
		
	}
}

struct IfLetGuardBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        IfLetGuardBootcamp()
    }
}
