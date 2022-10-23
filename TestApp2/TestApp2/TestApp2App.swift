//
//  TestApp2App.swift
//  TestApp2
//
//  Created by Michele Zurlo on 17/10/22.
//

import SwiftUI

@main
struct TestApp2App: App {
    var body: some Scene {
        WindowGroup {
            MainView()
            
            Spacer()
            Button {
                //GeneratedCard.toPNG
                let activityVC = UIActivityViewController(activityItems: [CardView().toPNG()], applicationActivities: nil)
                   let scenes = UIApplication.shared.connectedScenes
                   let windowScene = scenes.first as? UIWindowScene
                    
                   windowScene?.keyWindow?.rootViewController?.present(activityVC, animated: true, completion: nil)
            } label: {
                Label("Save or Share", systemImage: "square.and.arrow.up")
            }
            .buttonStyle(.bordered)
            Spacer()
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
