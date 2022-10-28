//
//  SheetView.swift
//  TestApp2
//
//  Created by Michele Zurlo on 22/10/22.
//

import SwiftUI


struct SheetView: View {
    
    @EnvironmentObject var cardModel: CardModel
    
    
    
    @Environment(\.presentationMode) private var presentationMode
    
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    var body: some View{
        
        VStack{
       

            // Calm/Energized HStack
            HStack{
                CurrentDotView(currentColor: calmEmotion.color,currentSize: calmEmotion.size)
                CurrentDotView(currentColor: quiteCalmEmotion.color,currentSize: quiteCalmEmotion.size)
                CurrentDotView(currentColor: NormalColorCalmEnergizedEmotion.color,currentSize: NormalColorCalmEnergizedEmotion.size)
                CurrentDotView(currentColor: quiteEnergizedEmotion.color,currentSize: quiteEnergizedEmotion.size)
                CurrentDotView(currentColor: energizedEmotion.color,currentSize: energizedEmotion.size)
            }.padding()
         
           
            HStack {
            Text("Calm")
            Spacer()
            Text("Energized")
                
            }.padding(.trailing)
             .padding(.leading)
            
            
            //Cheerful/Sensitive HStack
            HStack{
                CurrentDotView(currentColor: relaxedEmotion.color,currentSize: relaxedEmotion.size)
                CurrentDotView(currentColor: quiteRelaxedEmotion.color,currentSize: quiteRelaxedEmotion.size)
                CurrentDotView(currentColor: RelaxedStressedNormalEmotion.color,currentSize: RelaxedStressedNormalEmotion.size)
                CurrentDotView(currentColor: quiteStressedEmotion.color,currentSize: quiteStressedEmotion.size)
                CurrentDotView(currentColor: stressedEmotion.color,currentSize: stressedEmotion.size)
               
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
                CurrentDotView(currentColor: insecureEmotion.color,currentSize: insecureEmotion.size)
                CurrentDotView(currentColor: quiteInsecureEmotion.color,currentSize: quiteInsecureEmotion.size)
                CurrentDotView(currentColor: InsecureSelfConfidentNormalEmotion.color,currentSize: InsecureSelfConfidentNormalEmotion.size)
                CurrentDotView(currentColor: quiteSelfConfidentEmotion.color,currentSize: quiteSelfConfidentEmotion.size)
                CurrentDotView(currentColor: selfConfidentEmotion.color,currentSize: selfConfidentEmotion.size)
            }.padding()
            
            HStack {
            Text("Insecure")
                Spacer()
            Text("Self Confident")
            }.padding(.trailing)
                .padding(.leading)
            
            //Relaxed - Stressed HStack
            
            HStack{
                CurrentDotView(currentColor: relaxedEmotion.color,currentSize: relaxedEmotion.size).padding()
                CurrentDotView(currentColor: quiteRelaxedEmotion.color,currentSize: quiteRelaxedEmotion.size)
                CurrentDotView(currentColor: RelaxedStressedNormalEmotion.color,currentSize: RelaxedStressedNormalEmotion.size).padding()
                CurrentDotView(currentColor: quiteStressedEmotion.color,currentSize: quiteStressedEmotion.size)
                CurrentDotView(currentColor: stressedEmotion.color,currentSize: stressedEmotion.size).padding()
            }.padding()
            
            HStack {
            Text("Relaxed")
                Spacer()
            Text("Stressed")
                
            }.padding(.trailing)
                .padding(.leading)
            
            HStack{
                CurrentDotView(currentColor: distractedEmotion.color,currentSize: distractedEmotion.size)
                CurrentDotView(currentColor: quiteDistractedEmotion.color,currentSize: quiteDistractedEmotion.size)
                CurrentDotView(currentColor: distractedFocusedNormalEmotion.color,currentSize: distractedFocusedNormalEmotion.size)
                CurrentDotView(currentColor: quiteFocusedEmotion.color,currentSize: quiteFocusedEmotion.size)
                CurrentDotView(currentColor: focusedEmotion.color,currentSize: focusedEmotion.size)
            }.padding()
            
            
            HStack{
                Text("Distracted")
                    .font(.subheadline)
                Spacer()
                Text("Focused")
            }.padding(.trailing)
                .padding(.leading)
             
             
             
            //SaveEmotionView(cardModel: cardModel)
               
            
            
        }.padding()
            
        }
    }


struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        SheetView().environmentObject(CardModel())
        SheetView().environmentObject(CardModel())
    }
}

struct CurrentDotView: View {
    
    var currentColor: Color
    var currentSize: CGFloat?
    
    @State var isExpanded: Bool = false
    
    
    @EnvironmentObject var cardModel: CardModel
    
    var body: some View {
        Button(action: {
            
            cardModel.addEmotion(emotion: Emotion(size: currentSize!,color: currentColor))
            //CoreDataCardModel().addEmotion(emotion: Emotion(size: currentSize,color: currentColor))
            
                isExpanded = true
        
                
            
          
        }){
            
            Circle()
                .foregroundColor(currentColor)
                .frame(width: currentSize,height: currentSize)
                .overlay{
                    
                    
                    
                   
                    isExpanded ? Circle().stroke(.gray, lineWidth: 5) : nil
                       
                    
                }
            
               
                
        }
    }
}

struct SaveEmotionView: View {
    var cardModel: CardModel
   
    
    var body: some View {
        Button(action: {
             //cardModel.saveEmotions()
        }){
            Label("Save", systemImage: "square.and.arrow.up")
            
                
        }.buttonStyle(.bordered)
            .padding()

    }
}
