//
//  DatePickerBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 04/09/2022.
//

import SwiftUI

struct DatePickerBootcamp: View {
	
	@State var selectedDate:Date = Date() // currnet date
	let startingDate:Date = Calendar.current.date(from: DateComponents(year: 2018)) ?? Date()
	let endingDate:Date = Date()
	
	var dateFormatter:DateFormatter {
		let formatter = DateFormatter()
		formatter.dateStyle = .short
		formatter.timeStyle = .short
		return formatter
	}
	
    var body: some View {
		VStack {
			Text("Selected date")
			Text(dateFormatter.string(from: selectedDate))
			
			DatePicker("Select a date", selection: $selectedDate)
				.accentColor(.red)
			.datePickerStyle(GraphicalDatePickerStyle())
			
			DatePicker("Select a date", selection: $selectedDate, displayedComponents: [.date])
			
			DatePicker("Select a date", selection: $selectedDate, in: startingDate...endingDate, displayedComponents: [.date])
		}
    }
}

struct DataPickerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerBootcamp()
    }
}
