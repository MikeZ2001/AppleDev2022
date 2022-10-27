//
//  SheetView.swift
//  TestApp2
//
//  Created by Michele Zurlo on 22/10/22.
//

import SwiftUI


struct SheetView: View {
    
    var cardModel: CardModel
    
    
    
    @Environment(\.presentationMode) private var presentationMode
    
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    var body: some View{
        
        VStack{
       

            // Calm/Energized HStack
            HStack{
                CurrentDotView(currentColor: calmEmotion.color,currentSize: calmEmotion.size,cardModel: cardModel)
                CurrentDotView(currentColor: quiteCalmEmotion.color,currentSize: quiteCalmEmotion.size,cardModel: cardModel)
                CurrentDotView(currentColor: NormalColorCalmEnergizedEmotion.color,currentSize: NormalColorCalmEnergizedEmotion.size,cardModel: cardModel)
                CurrentDotView(currentColor: quiteEnergizedEmotion.color,currentSize: quiteEnergizedEmotion.size,cardModel: cardModel)
                CurrentDotView(currentColor: energizedEmotion.color,currentSize: energizedEmotion.size,cardModel: cardModel)
            }.padding()
         
           
            HStack {
            Text("Calm")
            Spacer()
            Text("Energized")
                
            }.padding(.trailing)
             .padding(.leading)
            
            
            //Cheerful/Sensitive HStack
            HStack{
                CurrentDotView(currentColor: relaxedEmotion.color,currentSize: relaxedEmotion.size,cardModel: cardModel)
                CurrentDotView(currentColor: quiteRelaxedEmotion.color,currentSize: quiteRelaxedEmotion.size,cardModel: cardModel)
                CurrentDotView(currentColor: RelaxedStressedNormalEmotion.color,currentSize: RelaxedStressedNormalEmotion.size,cardModel: cardModel)
                CurrentDotView(currentColor: quiteStressedEmotion.color,currentSize: quiteStressedEmotion.size,cardModel: cardModel)
                CurrentDotView(currentColor: stressedEmotion.color,currentSize: stressedEmotion.size,cardModel: cardModel)
               
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
                CurrentDotView(currentColor: insecureEmotion.color,currentSize: insecureEmotion.size,cardModel: cardModel)
                CurrentDotView(currentColor: quiteInsecureEmotion.color,currentSize: quiteInsecureEmotion.size,cardModel: cardModel)
                CurrentDotView(currentColor: InsecureSelfConfidentNormalEmotion.color,currentSize: InsecureSelfConfidentNormalEmotion.size,cardModel: cardModel)
                CurrentDotView(currentColor: quiteSelfConfidentEmotion.color,currentSize: quiteSelfConfidentEmotion.size,cardModel: cardModel)
                CurrentDotView(currentColor: selfConfidentEmotion.color,currentSize: selfConfidentEmotion.size,cardModel: cardModel)
            }.padding()
            
            HStack {
            Text("Insecure")
                Spacer()
            Text("Self Confident")
            }.padding(.trailing)
                .padding(.leading)
            
            //Relaxed - Stressed HStack
            
            HStack{
                CurrentDotView(currentColor: relaxedEmotion.color,currentSize: relaxedEmotion.size,cardModel: cardModel).padding()
                CurrentDotView(currentColor: quiteRelaxedEmotion.color,currentSize: quiteRelaxedEmotion.size,cardModel: cardModel)
                CurrentDotView(currentColor: RelaxedStressedNormalEmotion.color,currentSize: RelaxedStressedNormalEmotion.size,cardModel: cardModel).padding()
                CurrentDotView(currentColor: quiteStressedEmotion.color,currentSize: quiteStressedEmotion.size,cardModel: cardModel)
                CurrentDotView(currentColor: stressedEmotion.color,currentSize: stressedEmotion.size,cardModel: cardModel).padding()
            }.padding()
            
            HStack {
            Text("Relaxed")
                Spacer()
            Text("Stressed")
                
            }.padding(.trailing)
                .padding(.leading)
            
            HStack{
                CurrentDotView(currentColor: distractedEmotion.color,currentSize: distractedEmotion.size,cardModel: cardModel)
                CurrentDotView(currentColor: quiteDistractedEmotion.color,currentSize: quiteDistractedEmotion.size,cardModel: cardModel)
                CurrentDotView(currentColor: distractedFocusedNormalEmotion.color,currentSize: distractedFocusedNormalEmotion.size,cardModel: cardModel)
                CurrentDotView(currentColor: quiteFocusedEmotion.color,currentSize: quiteFocusedEmotion.size,cardModel: cardModel)
                CurrentDotView(currentColor: focusedEmotion.color,currentSize: focusedEmotion.size,cardModel: cardModel)
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
        SheetView( cardModel: CardModel())
        SheetView( cardModel: CardModel())
    }
}

struct CurrentDotView: View {
    
    var currentColor: Color
    var currentSize: CGFloat?
    
    @State var isExpanded: Bool = false
    
    
    @ObservedObject var cardModel = CardModel()
    
    var body: some View {
        Button(action: {
            
            cardModel.addEmotion(emotion: Emotion(size: currentSize,color: currentColor))
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
