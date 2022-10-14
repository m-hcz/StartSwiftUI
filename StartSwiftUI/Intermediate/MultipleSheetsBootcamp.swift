//
//  MultipleSheetsBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 11/09/2022.
//

import SwiftUI

struct MultipleSheetModel: Identifiable {
	let id = UUID().uuidString
	let title:String
}

struct MultipleSheetsBootcamp: View {
	
	@State var selectedModel:MultipleSheetModel? = nil
	
    var body: some View {
		ScrollView {
			VStack (spacing: 20) {
				Button("Button one") {
					selectedModel = MultipleSheetModel(title: "One")
				}
			
				Button("Button two") {
					selectedModel = MultipleSheetModel(title: "Two")
				}
				
				ForEach(0..<10) { index in
					Button("Button #\(index)") {
						selectedModel = MultipleSheetModel(title: "#\(index)")
					}
				}
			}
			.sheet(item: $selectedModel) { model in
				MultipleSheetNextScreen(selectedModel: model)
			}
		}
    }
}

struct MultipleSheetsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        MultipleSheetsBootcamp()
    }
}

struct MultipleSheetNextScreen: View {
	let selectedModel:MultipleSheetModel
	
	var body: some View {
		Text(selectedModel.title)
			.font(.largeTitle)
	}
}
