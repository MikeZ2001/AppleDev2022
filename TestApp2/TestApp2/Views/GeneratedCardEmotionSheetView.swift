//
//  GeneratedCardEmotionSheetView.swift
//  TestApp2
//
//  Created by Michele Zurlo on 27/10/22.
//

import SwiftUI

struct GeneratedCardEmotionSheetView: View {
    
    @EnvironmentObject var cardModel: CardModel
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    var body: some View{
        
        VStack{
        
            /*
                Text("How do you feel today?")
                    .multilineTextAlignment(.center)
                .font(Font.custom("SF Mono", size: 34.0))

             */
            
                    
            // Calm/Energized HStack
            HStack{
                CurrentDotView2(currentColor: calmEmotion.color,currentSize: calmEmotion.size)
                CurrentDotView2(currentColor: quiteCalmEmotion.color,currentSize: quiteCalmEmotion.size)
                CurrentDotView2(currentColor: NormalColorCalmEnergizedEmotion.color,currentSize: NormalColorCalmEnergizedEmotion.size)
                CurrentDotView2(currentColor: quiteEnergizedEmotion.color,currentSize: quiteEnergizedEmotion.size)
                CurrentDotView2(currentColor: energizedEmotion.color,currentSize: energizedEmotion.size)
            }.padding()
         
           
            HStack {
            Text("Calm")
            Spacer()
            Text("Energized")
                
            }.padding(.trailing)
             .padding(.leading)
            
            
            //Cheerful/Sensitive HStack
            HStack{
           
                CurrentDotView2(currentColor: relaxedEmotion.color,currentSize: relaxedEmotion.size)
                CurrentDotView2(currentColor: quiteRelaxedEmotion.color,currentSize: quiteRelaxedEmotion.size)
                CurrentDotView2(currentColor: RelaxedStressedNormalEmotion.color,currentSize: RelaxedStressedNormalEmotion.size)
                CurrentDotView2(currentColor: quiteStressedEmotion.color,currentSize: quiteStressedEmotion.size)
                CurrentDotView2(currentColor: stressedEmotion.color,currentSize: stressedEmotion.size)
               
            }.padding()
            
            HStack {
            Text("Cheerful")
                .frame(alignment: .leading)
            
                Spacer()
                
            Text("Sensitive")
                    .frame(alignment: .trailing)
                
            }.padding(.trailing)
                .padding(.leading)
             
             
            
            // Insecure - Self Confident HStack
            
            HStack{
                CurrentDotView2(currentColor: insecureEmotion.color,currentSize: insecureEmotion.size)
                CurrentDotView2(currentColor: quiteInsecureEmotion.color,currentSize: quiteInsecureEmotion.size)
                CurrentDotView2(currentColor: InsecureSelfConfidentNormalEmotion.color,currentSize: InsecureSelfConfidentNormalEmotion.size)
                CurrentDotView2(currentColor: quiteSelfConfidentEmotion.color,currentSize: quiteSelfConfidentEmotion.size)
                CurrentDotView2(currentColor: selfConfidentEmotion.color,currentSize: selfConfidentEmotion.size)
            }.padding()
            
            HStack {
            Text("Insecure")
                Spacer()
            Text("Self Confident")
            }.padding(.trailing)
                .padding(.leading)
            
            //Relaxed - Stressed HStack
            
            HStack{
                CurrentDotView2(currentColor: relaxedEmotion.color,currentSize: relaxedEmotion.size).padding()
                CurrentDotView2(currentColor: quiteRelaxedEmotion.color,currentSize: quiteRelaxedEmotion.size)
                CurrentDotView2(currentColor: RelaxedStressedNormalEmotion.color,currentSize: RelaxedStressedNormalEmotion.size).padding()
                CurrentDotView2(currentColor: quiteStressedEmotion.color,currentSize: quiteStressedEmotion.size)
                CurrentDotView2(currentColor: stressedEmotion.color,currentSize: stressedEmotion.size).padding()
            }.padding()
            
            HStack {
            Text("Relaxed")
                Spacer()
            Text("Stressed")
                
            }.padding(.trailing)
                .padding(.leading)
            
            HStack{
                CurrentDotView2(currentColor: distractedEmotion.color,currentSize: distractedEmotion.size)
                CurrentDotView2(currentColor: quiteDistractedEmotion.color,currentSize: quiteDistractedEmotion.size)
                CurrentDotView2(currentColor: distractedFocusedNormalEmotion.color,currentSize: distractedFocusedNormalEmotion.size)
                CurrentDotView2(currentColor: quiteFocusedEmotion.color,currentSize: quiteFocusedEmotion.size)
                CurrentDotView2(currentColor: focusedEmotion.color,currentSize: focusedEmotion.size)
            }.padding()
            
        
            HStack{
                Text("Distracted")
                Spacer()
                Text("Focused")
            }.padding(.trailing)
                .padding(.leading)
             
             
        }.padding()
            
        }
    }



struct GeneratedCardEmotionSheetView_Previews: PreviewProvider {
    static var previews: some View {
        GeneratedCardEmotionSheetView().environmentObject(CardModel())
    }
}

struct CurrentDotView2: View {
    
    var currentColor: Color
    var currentSize: CGFloat?
    
    @State var isExpanded: Bool = false
    
    
    @EnvironmentObject var cardModel: CardModel
    
    var body: some View {
        Button(action: {
            cardModel.addEmotion(emotion: Emotion(size: currentSize!,color: currentColor))
        
                isExpanded = true
          
        }){
            Circle()
                .foregroundColor(currentColor)
                .frame(width: currentSize,height: currentSize)
                
        }
    }
}


