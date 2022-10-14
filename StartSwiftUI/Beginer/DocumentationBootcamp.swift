//
//  DocumentationBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 04/09/2022.
//

import SwiftUI

struct DocumentationBootcamp: View {
	
	// MARK: Props
	@State var data:[String] = ["Apples", "Oranges", "Bananas"]
	@State var showAlert:Bool = false
	
	// MARK: Body
    var body: some View {
		NavigationView {
			ScrollView {
				Text("Hello")
				
				ForEach(data, id:\.self) {fruit in
					Text(fruit)
						.font(.headline)
				}
			}
			.navigationTitle("Documentation")
			.navigationBarItems(trailing:
									Button("Alert"){
				showAlert.toggle()
			}
			)
			.alert(isPresented: $showAlert) {
				showAlert(text: "Text")
			}
		}
    }
	
	// MARK: Func
	
	/// Gets an alert with a specified title
	///
	/// Discussion
	/// ```
	/// showAlert(text:"hi") -> Alert(title: Text("hi"))
	/// ```
	///
	/// - Warning: there is no additional message
	/// - Parameter text: alert title
	/// - Returns: alert
	func showAlert(text:String) -> Alert {
		return Alert(title: Text(text))
	}
}

// MARK: Preview
struct DocumentationBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        DocumentationBootcamp()
    }
}
