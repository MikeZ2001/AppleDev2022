//
//  TestApp2App.swift
//  TestApp2
//
//  Created by Michele Zurlo on 17/10/22.
//

import SwiftUI

@main
struct TestApp2App: App {
    
    // TODO: Create the MODEL as environment object
    
    
    //@StateObject private var coreDataCardModel = CoreDataCardModel()
    
    @StateObject var cardModel = CardModel()
    
    //@EnvironmentObject var cardModel:
    
    var body: some Scene {
        WindowGroup {
            
            MainView()
                .environment(\.managedObjectContext, cardModel.container.viewContext)
                .environmentObject(cardModel)
                .onAppear{
                    
                    setPermissionNotification()
                    setScheduleNotification()
            
                }
            
        }
    }
    
    func setPermissionNotification(){
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                print("All set!")
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    func setScheduleNotification(){
        let content = UNMutableNotificationContent()
        content.title = "How are you today?"
        content.subtitle = "It's time to discover you five dots of the day"
        content.sound = UNNotificationSound.default

        // show this notification five seconds from now
      //  let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        var dateComponents = DateComponents()
        dateComponents.hour = 14
        dateComponents.minute = 18
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)

        // choose a random identifier
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

        // add our notification request
        UNUserNotificationCenter.current().add(request)
    }
   
    
 
}



extension View {
    
 
    
    
func getSafeArea() -> UIEdgeInsets {
    guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
        return .zero
    }
    guard let safeArea = screen.windows.first?.safeAreaInsets else {
        return .zero
    }
    return safeArea
}

func toPNG() -> Data {
    

    let controller = UIHostingController(rootView: self)
    let view = controller.view
    var targetSize = controller.view.intrinsicContentSize
    targetSize.height += getSafeArea().top
    view?.bounds = CGRect(x: .zero, y: .zero, width: targetSize.width, height: targetSize.height)
    view?.backgroundColor = .clear

    let renderer = UIGraphicsImageRenderer(size: targetSize)

    return renderer.pngData { _ in
        view?.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
    }
}
}

