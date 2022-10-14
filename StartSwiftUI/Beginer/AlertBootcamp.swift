//
//  AlertBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 03/09/2022.
//

import SwiftUI

struct AlertBootcamp: View {
	
	@State var showAlert:Bool = false
    var body: some View {
		ZStack {
			Color.yellow.ignoresSafeArea()
			
			Button("Click here"){
				showAlert.toggle()
			}
			.alert(isPresented: $showAlert) {
				Alert(
					title: Text("Title"),
					message: Text("Error message"),
					primaryButton: .destructive(Text("DELETE"), action: {
						
					}),
					secondaryButton: .cancel()
				)
				//Alert(title: Text("There was an error"))
		}
		}
    }
}

struct AlertBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        AlertBootcamp()
    }
}
