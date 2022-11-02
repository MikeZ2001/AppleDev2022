//
//  CurrentDotView.swift
//  TestApp2
//
//  Created by Michele Zurlo on 02/11/22.
//

import SwiftUI

struct CurrentDotView: View {
    
    var currentColor: Color
    var currentSize: CGFloat?
    
    @State var isExpanded: Bool = false
    
   @Binding var selectedColor: Color?
    
    
    @EnvironmentObject var cardModel: CardModel
    
    var body: some View {
        Button(action: {
            
        
            
            cardModel.addEmotion(emotion: Emotion(size: currentSize!,color: currentColor))
           
                //isExpanded = true
            
            self.selectedColor = self.currentColor
    
          
        }){
            
            Circle()
                .foregroundColor(currentColor)
                .frame(width: currentSize,height: currentSize)
                .overlay{
                    
                    
                    
                    self.selectedColor == currentColor ? Circle().stroke(.gray, lineWidth: 5) : nil
                       
                    
                }
            
               
                
        }
    }
}


