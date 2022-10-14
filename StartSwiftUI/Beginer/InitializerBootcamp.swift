//
//  InitializerBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 02/09/2022.
//

import SwiftUI

struct InitializerBootcamp: View {
	
	let backgroundColor:Color
	let count:Int
	let title:String
	
	enum Fruit {
		case apple
		case orange
	}
	
	init(count:Int,fruit:Fruit){
		self.count = count
		
		if fruit == .apple {
			self.title = "Apples"
			self.backgroundColor = Color.red
		}
		else {
			self.title = "Oranges"
			self.backgroundColor = Color.orange
		}
	}
	
    var body: some View {
		VStack {
			VStack(spacing: 15) {
				Text("\(count)")
					.foregroundColor(.white)
					.font(.largeTitle)
					.underline()
				
				Text(title)
					.foregroundColor(.white)
					.font(.title2)
			}
		}
		
		.frame(width: 150, height: 150)
		.background(backgroundColor)
		.cornerRadius(20)
    }
}

struct InitializerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
		VStack {
			InitializerBootcamp(count: 55, fruit: .apple)
			InitializerBootcamp(count: 10, fruit: .orange)

		}
    }
}
