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
    
    var currentCardCalendar: Card
    
    var body: some View{
        
        VStack{
        
            /*
                Text("How do you feel today?")
                    .multilineTextAlignment(.center)
                .font(Font.custom("SF Mono", size: 34.0))

             */
            
                    
            // Calm/Energized HStack
            HStack{
                CurrentDotView2(currentColor: calmEmotion.color,currentSize: calmEmotion.size, currentCardCalendar: currentCardCalendar)
                CurrentDotView2(currentColor: quiteCalmEmotion.color,currentSize: quiteCalmEmotion.size, currentCardCalendar: currentCardCalendar)
                CurrentDotView2(currentColor: NormalColorCalmEnergizedEmotion.color,currentSize: NormalColorCalmEnergizedEmotion.size, currentCardCalendar: currentCardCalendar)
                CurrentDotView2(currentColor: quiteEnergizedEmotion.color,currentSize: quiteEnergizedEmotion.size, currentCardCalendar: currentCardCalendar)
                CurrentDotView2(currentColor: energizedEmotion.color,currentSize: energizedEmotion.size, currentCardCalendar: currentCardCalendar)
            }.padding()
         
           
            HStack {
            Text("Calm")
            Spacer()
            Text("Energized")
                
            }.padding(.trailing)
             .padding(.leading)
            
            
            //Cheerful/Sensitive HStack
            HStack{
           
                CurrentDotView2(currentColor: relaxedEmotion.color,currentSize: relaxedEmotion.size, currentCardCalendar: currentCardCalendar)
                CurrentDotView2(currentColor: quiteRelaxedEmotion.color,currentSize: quiteRelaxedEmotion.size, currentCardCalendar: currentCardCalendar)
                CurrentDotView2(currentColor: RelaxedStressedNormalEmotion.color,currentSize: RelaxedStressedNormalEmotion.size, currentCardCalendar: currentCardCalendar)
                CurrentDotView2(currentColor: quiteStressedEmotion.color,currentSize: quiteStressedEmotion.size, currentCardCalendar: currentCardCalendar)
                CurrentDotView2(currentColor: stressedEmotion.color,currentSize: stressedEmotion.size, currentCardCalendar: currentCardCalendar)
               
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
                CurrentDotView2(currentColor: insecureEmotion.color,currentSize: insecureEmotion.size, currentCardCalendar: currentCardCalendar)
                CurrentDotView2(currentColor: quiteInsecureEmotion.color,currentSize: quiteInsecureEmotion.size, currentCardCalendar: currentCardCalendar)
                CurrentDotView2(currentColor: InsecureSelfConfidentNormalEmotion.color,currentSize: InsecureSelfConfidentNormalEmotion.size, currentCardCalendar: currentCardCalendar)
                CurrentDotView2(currentColor: quiteSelfConfidentEmotion.color,currentSize: quiteSelfConfidentEmotion.size, currentCardCalendar: currentCardCalendar)
                CurrentDotView2(currentColor: selfConfidentEmotion.color,currentSize: selfConfidentEmotion.size, currentCardCalendar: currentCardCalendar)
            }.padding()
            
            HStack {
            Text("Insecure")
                Spacer()
            Text("Self Confident")
            }.padding(.trailing)
                .padding(.leading)
            
            //Relaxed - Stressed HStack
            
            HStack{
                CurrentDotView2(currentColor: relaxedEmotion.color,currentSize: relaxedEmotion.size, currentCardCalendar: currentCardCalendar).padding()
                CurrentDotView2(currentColor: quiteRelaxedEmotion.color,currentSize: quiteRelaxedEmotion.size, currentCardCalendar: currentCardCalendar)
                CurrentDotView2(currentColor: RelaxedStressedNormalEmotion.color,currentSize: RelaxedStressedNormalEmotion.size, currentCardCalendar: currentCardCalendar).padding()
                CurrentDotView2(currentColor: quiteStressedEmotion.color,currentSize: quiteStressedEmotion.size, currentCardCalendar: currentCardCalendar)
                CurrentDotView2(currentColor: stressedEmotion.color,currentSize: stressedEmotion.size, currentCardCalendar: currentCardCalendar).padding()
            }.padding()
            
            HStack {
            Text("Relaxed")
                Spacer()
            Text("Stressed")
                
            }.padding(.trailing)
                .padding(.leading)
            
            HStack{
                CurrentDotView2(currentColor: distractedEmotion.color,currentSize: distractedEmotion.size, currentCardCalendar: currentCardCalendar)
                CurrentDotView2(currentColor: quiteDistractedEmotion.color,currentSize: quiteDistractedEmotion.size, currentCardCalendar: currentCardCalendar)
                CurrentDotView2(currentColor: distractedFocusedNormalEmotion.color,currentSize: distractedFocusedNormalEmotion.size, currentCardCalendar: currentCardCalendar)
                CurrentDotView2(currentColor: quiteFocusedEmotion.color,currentSize: quiteFocusedEmotion.size, currentCardCalendar: currentCardCalendar)
                CurrentDotView2(currentColor: focusedEmotion.color,currentSize: focusedEmotion.size, currentCardCalendar: currentCardCalendar)
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
        GeneratedCardEmotionSheetView(currentCardCalendar: Card(date: Date(),image: Image(systemName: "camera"),songOfTheDay: "adfa",thoughtOfTheDay: "Ciaooo",emotions: [insecureEmotion,quiteFocusedEmotion,distractedEmotion])).environmentObject(CardModel())
    }
}

struct CurrentDotView2: View {
    
    var currentColor: Color
    var currentSize: CGFloat?
    
    @State var isExpanded: Bool = false
    
    
    @EnvironmentObject var cardModel: CardModel
    
    var currentCardCalendar: Card

    var body: some View {
        Button(action: {
            cardModel.addEmotion(emotion: Emotion(size: currentSize!,color: currentColor))
        
          //      isExpanded = true
          
        }){
            
            Circle()
                .foregroundColor(currentColor)
                .frame(width: currentSize,height: currentSize)
                .overlay{
                    
                     isExpanded ? Circle().stroke(.gray, lineWidth: 5) : nil
                }
             
                
        }.onAppear{
            
            for card in currentCardCalendar.emotions{
                
                if(currentColor.description == card?.color.description){
                   isExpanded = true
                }else{
                    //isExpanded = false
                }
            }
             
        }
             
    
    }
}


