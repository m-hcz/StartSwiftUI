//
//  ActionSheetBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 03/09/2022.
//

import SwiftUI

struct ActionSheetBootcamp: View {
	
	@State var showActionSheet:Bool = false
    var body: some View {
		Button("Click me") {
			showActionSheet.toggle()
		}
		.actionSheet(isPresented: $showActionSheet) {
//			ActionSheet(title: Text("Title"))
			ActionSheet(title: Text("Title"), message: Text("Message"), buttons: [.cancel(),.destructive(Text("Delete"))])
		}
    }
}

struct ActionSheetBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ActionSheetBootcamp()
    }
}
