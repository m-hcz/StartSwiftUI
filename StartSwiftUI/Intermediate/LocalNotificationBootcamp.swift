//
//  LocalNotificationBootcamp.swift
//  StartSwiftUI
//
//  Created by M H on 11/09/2022.
//

import SwiftUI
import UserNotifications
import CoreLocation

class NotificationManager {
	static let instance = NotificationManager()
	
	func requestAuthorization() {
		let options: UNAuthorizationOptions = [.alert, .sound, .badge]
		UNUserNotificationCenter.current().requestAuthorization(options: options) { success, error in
			if let error = error {
				print("Error: \(error)")
			} else {
				print("Success")
			}
		}
	}
	
	func scheduleNotification() {
		let content = UNMutableNotificationContent()
		content.title = "this is my first notification"
		content.subtitle = "subtitle"
		content.sound = .default
		content.badge = 1
		
		// time
		let trigger1 = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
		
		// calendar
		var dateComponents = DateComponents()
		dateComponents.hour = 15
		dateComponents.month = 47
		dateComponents.weekday = 1
		
		let trigger2 = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
		
		// location
		let coordinates = CLLocationCoordinate2D(latitude: 10, longitude: 20)
		let region = CLCircularRegion(center: coordinates, radius: 10, identifier: UUID().uuidString)
		region.notifyOnEntry = true
		region.notifyOnExit = true
		
		let trigger3 = UNLocationNotificationTrigger(region: region, repeats: false)
		
		let request = UNNotificationRequest(
			identifier: UUID().uuidString,
			content: content,
			trigger: trigger1)
		
		UNUserNotificationCenter.current().add(request)
	}
	
	func cancleNotification() {
		UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
		UNUserNotificationCenter.current().removeAllDeliveredNotifications()
	}
}

struct LocalNotificationBootcamp: View {
    var body: some View {
		VStack(spacing: 40) {
			Button("Request permission") {
				NotificationManager.instance.requestAuthorization()
			}
			Button("schedule notification") {
				NotificationManager.instance.scheduleNotification()
			}
			Button("cancel notification") {
				NotificationManager.instance.cancleNotification()
			}
		}
		.onAppear {
			UIApplication.shared.applicationIconBadgeNumber = 0
		}
    }
}

struct LocalNotificationBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        LocalNotificationBootcamp()
    }
}
