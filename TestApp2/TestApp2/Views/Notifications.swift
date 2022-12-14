//
//  Notifications.swift
//  TestApp2
//
//  Created by Cesare Masola on 28/10/22.
//

import SwiftUI
import UserNotifications


struct Notifications: View {
    var body: some View {
        VStack {
            Button("Enable Notifications"){
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        print("All set!")
                    } else if let error = error {
                        print(error.localizedDescription)
                    }
                }
            }
            Button("Schedule Notifications"){
                let content = UNMutableNotificationContent()
                content.title = "How are you today?"
                content.subtitle = "It's time to discover you five dots of the day"
                content.sound = UNNotificationSound.default

                // show this notification five seconds from now
              //  let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                var dateComponents = DateComponents()
                dateComponents.hour = 13
                dateComponents.minute = 22
                
                let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)

                // choose a random identifier
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

                // add our notification request
                UNUserNotificationCenter.current().add(request)
                
//Now for the important part: once your notification has been added press Cmd+L in the simulator to lock the screen. After a few seconds have passed the device should wake up with a sound, and show our message
                
            }
        }
    }
}

struct Notifications_Previews: PreviewProvider {
    static var previews: some View {
        Notifications()
    }
}
