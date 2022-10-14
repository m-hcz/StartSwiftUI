//
//  ViewBuilderBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 02/10/2022.
//

import SwiftUI

struct HeaderViewGeneric<Content:View>: View {
	
	let title:String
	let content:Content
	
	init(title: String, @ViewBuilder content: () ->  Content) {
		self.title = title
		self.content = content()
	}
	var body: some View {
		VStack(alignment: .leading){
			Text(title)
				.font(.largeTitle)
				.fontWeight(.semibold)
			
			content
			
			RoundedRectangle(cornerRadius: 5)
				.frame(height: 2)
		}
		.frame(maxWidth: .infinity, alignment: .leading)
		.padding()
	}
}

struct ViewBuilderBootcamp: View {
    var body: some View {
		VStack {
			HeaderViewGeneric(title: "title") {
				HStack {
					Text("text")
					Image(systemName: "heart.fill")
				}
			}
			HeaderViewGeneric(title: "AA") {
				
			}
			Spacer()
		}
    }
}

struct ViewBuilderBootcamp_Previews: PreviewProvider {
    static var previews: some View {
//        ViewBuilderBootcamp()
		LocalViewBuilder(type: .one)
    }
}

struct LocalViewBuilder: View {
	
	enum ViewType {
		case one,two, three
	}
	let type:ViewType
	
	var body: some View {
		VStack {
			headerSection
		}
	}
	
	@ViewBuilder private var headerSection: some View {
		switch type {
			case .one:
				viewOne
			case .two:
				viewTwo
			case .three:
				viewThree
		}
	}
	
	private var viewOne: some View {
		Text("one")
	}
	
	private var viewTwo: some View {
		Text("two")
	}
	
	private var viewThree: some View {
		Text("three")
	}
}
