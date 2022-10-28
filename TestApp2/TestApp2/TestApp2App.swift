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
    
    @StateObject private var modelData = CardModel()
    
    var body: some Scene {
        WindowGroup {
            
            MainView()
                .environment(\.managedObjectContext, modelData.container.viewContext)
                .environmentObject(modelData)
            
            // provide the model as environment object
        }
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
