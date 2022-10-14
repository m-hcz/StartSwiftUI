//
//  ExtractSubviewBootchamp.swift
//  StartSwiftUI
//
//  Created by M H on 03/09/2022.
//

import SwiftUI

struct ExtractSubviewBootchamp: View {
    var body: some View {
		ZStack {
			Color.blue
				.ignoresSafeArea()
			HStack {
				MyItem(title: "Apples", count: 2, color: .red)
				MyItem(title: "Oranges", count: 5, color: .orange)
				MyItem(title: "Bananas", count: 8, color: .yellow)
				MyItem(title: "Peaches", count: 10, color: .pink)
			}
		} 
    }
	

}

struct ExtractSubviewBootchamp_Previews: PreviewProvider {
    static var previews: some View {
        ExtractSubviewBootchamp()
    }
}

struct MyItem: View {
	
	let title:String
	let count:Int
	let color:Color
	
	var body: some View {
		VStack {
			Text("\(count)")
			Text(title)
		}
		.padding()
		.background(color)
		.cornerRadius(10)
	}
}
