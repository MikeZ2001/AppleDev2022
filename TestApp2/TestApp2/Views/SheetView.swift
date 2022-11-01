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
        
            Text("How do you feel today?").font(Font.custom("Avenir-Heavy", size: 24.0))
                .padding()

            // Calm/Energized HStack
            HStack{
                CurrentDotView(currentColor: calmEmotion.color,currentSize: calmEmotion.size).padding()
                CurrentDotView(currentColor: quiteCalmEmotion.color,currentSize: quiteCalmEmotion.size)
                CurrentDotView(currentColor: NormalColorCalmEnergizedEmotion.color,currentSize: NormalColorCalmEnergizedEmotion.size).padding()
                CurrentDotView(currentColor: quiteEnergizedEmotion.color,currentSize: quiteEnergizedEmotion.size)
                CurrentDotView(currentColor: energizedEmotion.color,currentSize: energizedEmotion.size).padding()
            }
         
           
            HStack {
            Text("Calm") .font(Font.custom("Avenir-Medium", size: 16))
            Spacer()
            Text("Energized") .font(Font.custom("Avenir-Medium", size: 16))
                
            }.padding(.trailing)
             .padding(.leading)
            
            
            //Cheerful/Sensitive HStack
            HStack{
                CurrentDotView(currentColor: cheerfulEmotion.color,currentSize: cheerfulEmotion.size).padding()
                CurrentDotView(currentColor: quiteCheerfulEmotion.color,currentSize: quiteCheerfulEmotion.size)
                CurrentDotView(currentColor: NormalColorCheerfulSensitiveEmotion.color,currentSize: NormalColorCheerfulSensitiveEmotion.size).padding()
                CurrentDotView(currentColor: quiteSensitiveEmotion.color,currentSize: quiteSensitiveEmotion.size)
                CurrentDotView(currentColor: sensitiveEmotion.color,currentSize: sensitiveEmotion.size).padding()
               
            }
            
            HStack {
            Text("Cheerful") .font(Font.custom("Avenir-Medium", size: 16))
                
            
                Spacer()
                
            Text("Sensitive")
                    .font(Font.custom("Avenir-Medium", size: 16))
                
            }.padding(.trailing)
                .padding(.leading)
             
             
            
            // Insecure - Self Confident HStack
            
            HStack{
                CurrentDotView(currentColor: insecureEmotion.color,currentSize: insecureEmotion.size).padding()
                CurrentDotView(currentColor: quiteInsecureEmotion.color,currentSize: quiteInsecureEmotion.size)
                CurrentDotView(currentColor: InsecureSelfConfidentNormalEmotion.color,currentSize: InsecureSelfConfidentNormalEmotion.size).padding()
                CurrentDotView(currentColor: quiteSelfConfidentEmotion.color,currentSize: quiteSelfConfidentEmotion.size)
                CurrentDotView(currentColor: selfConfidentEmotion.color,currentSize: selfConfidentEmotion.size).padding()
            }
            
            HStack {
            Text("Insecure") .font(Font.custom("Avenir-Medium", size: 16))
                Spacer()
            Text("Self Confident") .font(Font.custom("Avenir-Medium", size: 16))
            }.padding(.trailing)
                .padding(.leading)
            
            //Relaxed - Stressed HStack
            
            HStack{
                CurrentDotView(currentColor: relaxedEmotion.color,currentSize: relaxedEmotion.size).padding()
                CurrentDotView(currentColor: quiteRelaxedEmotion.color,currentSize: quiteRelaxedEmotion.size)
                CurrentDotView(currentColor: RelaxedStressedNormalEmotion.color,currentSize: RelaxedStressedNormalEmotion.size).padding()
                CurrentDotView(currentColor: quiteStressedEmotion.color,currentSize: quiteStressedEmotion.size)
                CurrentDotView(currentColor: stressedEmotion.color,currentSize: stressedEmotion.size).padding()
            }
            
            Group{
                HStack {
                    Text("Relaxed") .font(Font.custom("Avenir-Medium", size: 16))
                    Spacer()
                    Text("Stressed") .font(Font.custom("Avenir-Medium", size: 16))
                    
                }.padding(.trailing)
                    .padding(.leading)
                
                
                Group{
                    HStack{
                        CurrentDotView(currentColor: distractedEmotion.color,currentSize: distractedEmotion.size).padding()
                        CurrentDotView(currentColor: quiteDistractedEmotion.color,currentSize: quiteDistractedEmotion.size)
                        CurrentDotView(currentColor: distractedFocusedNormalEmotion.color,currentSize: distractedFocusedNormalEmotion.size).padding()
                        CurrentDotView(currentColor: quiteFocusedEmotion.color,currentSize: quiteFocusedEmotion.size)
                        CurrentDotView(currentColor: focusedEmotion.color,currentSize: focusedEmotion.size).padding()
                    }
                    
                    
                    
                    
                    HStack{
                        Text("Distracted") .font(Font.custom("Avenir-Medium", size: 16))
                            .font(.subheadline)
                        Spacer()
                        Text("Focused") .font(Font.custom("Avenir-Medium", size: 16))
                    }.padding(.trailing)
                        .padding(.leading)
                }
                
            }
            
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
