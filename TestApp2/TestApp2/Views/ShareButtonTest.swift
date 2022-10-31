//
//  ShareButtonTest.swift
//  TestApp2
//
//  Created by Cesare Masola on 31/10/22.
//

import SwiftUI

struct ShareButtonTest: View {
    
    @State private var isShareSheetShowing = false
    var body: some View {
        Button(action: shareButton) {
            Image(systemName: "square.and.arrow.up")
                .font(.title)
                .foregroundColor(.black)
        }
    }
    func shareButton() {
        isShareSheetShowing.toggle()
        
        let content = URL(string: "www.google.com")
        let av = UIActivityViewController(activityItems: [content!], applicationActivities: nil)
        
        UIApplication.shared.windows.first?            .rootViewController?.present(av, animated: true, completion: nil)
        
        
   }
    
}

struct ShareButtonTest_Previews: PreviewProvider {
    static var previews: some View {
        ShareButtonTest()
    }
}
