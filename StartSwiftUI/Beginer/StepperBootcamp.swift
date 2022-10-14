//
//  StepperBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 04/09/2022.
//

import SwiftUI

struct StepperBootcamp: View {
	
	@State var stepperValue:Int = 10
	@State var widthIncrement:CGFloat = 0
    var body: some View {
		VStack {
			Stepper("Stepper \(stepperValue)", value: $stepperValue)
				.padding()
			
			RoundedRectangle(cornerRadius: 20)
				.frame(width: 100 + widthIncrement, height: 100)
			
			Stepper("Stepper 2") {
				withAnimation(.easeInOut) {
					widthIncrement += 10
				}
			} onDecrement: {
				widthIncrement -= 10
			}
			.padding()

		}
    }
}

struct StepperBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        StepperBootcamp()
    }
}
