//
//  TimerBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 13/09/2022.
//

import SwiftUI

struct TimerBootcamp: View {
	
	let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
	//	@State var currentDate:Date = Date()
	//	var dateFormatter:DateFormatter {
	//		let formatter = DateFormatter()
	//		formatter.timeStyle = .medium
	//		return formatter
	//	}
	
//	@State var timeRemaining:String = ""
//	let futureDate: Date = Calendar.current.date(byAdding: .day, value: 1, to: Date()) ?? Date()
//
//	func updateTimeRemaining() {
//		let remaining = Calendar.current.dateComponents([.hour,.minute,.second], from: Date(), to: futureDate)
//		let hour = remaining.hour ?? 0
//		let minute = remaining.minute ?? 0
//		let second = remaining.second ?? 0
//		timeRemaining = "\(hour):\(minute):\(second)"
//	}
	
	@State var count:Int = 0
	
    var body: some View {
		ZStack {
			RadialGradient(colors: [Color.gray,Color.yellow], center: .topLeading, startRadius: 0, endRadius: 500)
				.ignoresSafeArea()
			
			
			TabView(selection: $count) {
				Rectangle().foregroundColor(.red)
					.tag(1)
				Rectangle().foregroundColor(.gray)
					.tag(2)
				Rectangle().foregroundColor(.blue)
					.tag(3)
			}
			.tabViewStyle(PageTabViewStyle())
			.frame(height: 200)
			
			
			HStack(spacing: 15) {
				Circle()
					.offset(y: count == 1 ? -20 : 0)
				Circle()
					.offset(y: count == 2 ? -20 : 0)
				Circle()
					.offset(y: count == 3 ? -20 : 0)
			}
			.frame(width: 150)
			.foregroundColor(.white)
//			Text(timeRemaining)
//				.font(.system(size: 100, weight: .semibold, design: .rounded))
//				.foregroundColor(.white)
//				.lineLimit(1)
//				.minimumScaleFactor(0.1)
		}
		.onReceive(timer) { _ in
			withAnimation(.easeOut(duration: 0.5)){
				count = count == 3 ? 0 : count + 1
			}
			
		}
    }
}

struct TimerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TimerBootcamp()
    }
}
