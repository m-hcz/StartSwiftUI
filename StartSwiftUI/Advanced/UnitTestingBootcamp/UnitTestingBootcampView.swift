//
//  UnitTestingBootcampView.swift
//  StartSwiftUI
//
//  Created by M H on 08/10/2022.
//

/*
 unit tests - business logic
 ui tests - ui
 */

import SwiftUI



struct UnitTestingBootcampView: View {
	@StateObject private var vm: UnitTestingBootcampViewModel
	
	init(isPremium: Bool) {
		_vm = StateObject(wrappedValue: UnitTestingBootcampViewModel(isPremium: isPremium))
	}
    var body: some View {
		Text(vm.isPremium.description)
    }
}

struct UnitTestingBootcampView_Previews: PreviewProvider {
    static var previews: some View {
		UnitTestingBootcampView(isPremium: true)
    }
}
