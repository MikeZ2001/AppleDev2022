//
//  SheetView.swift
//  TestApp2
//
//  Created by Michele Zurlo on 22/10/22.
//

import SwiftUI


struct SheetView: View{
    
    var body: some View{
        
        VStack{
            
            HStack{
                Button {
                } label: {
                  Text("Small")
                }
                .controlSize(.small)
                .buttonStyle(.bordered)
                .clipShape(Circle())
                

            }
            
        }
    }
}

struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        SheetView()
    }
}
