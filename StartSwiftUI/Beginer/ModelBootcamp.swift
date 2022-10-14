//
//  ModelBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 04/09/2022.
//

import SwiftUI

struct UserModel: Identifiable {
	let id:String = UUID().uuidString
	let displayName:String
	let userName:String
	let followerCount:Int
	let isVerified:Bool
}


struct ModelBootcamp: View {
	
	@State var users:[UserModel] = [
		UserModel(displayName: "Nick", userName: "aa", followerCount: 10, isVerified: true),
		UserModel(displayName: "Emily", userName: "rrr", followerCount: 55, isVerified: false),
		UserModel(displayName: "Jack", userName: "ztr", followerCount: 74, isVerified: true)
		
	]
    var body: some View {
		NavigationView {
			List {
				ForEach(users) { user in
					HStack(spacing: 15) {
						Circle()
							.frame(width: 35, height: 35)
						VStack(alignment: .leading) {
							Text(user.displayName)
								.font(.headline)
							Text("@\(user.userName)")
								.foregroundColor(.gray)
								.font(.caption)
						}
						Spacer()
						
						if user.isVerified {
						Image(systemName: "checkmark.seal.fill")
							.foregroundColor(.blue)
						}
						
						VStack {
							Text("\(user.followerCount)")
								.font(.headline)
							Text("Followers")
								.foregroundColor(.gray)
								.font(.caption)
						}
					}
					.padding(.vertical, 10)
				}
			}
			.listStyle(InsetGroupedListStyle())
			.navigationTitle("Users")
		}
    }
}

struct ModelBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ModelBootcamp()
    }
}
