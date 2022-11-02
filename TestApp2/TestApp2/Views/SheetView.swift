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
    
    @State var selectedColor: Color?
    
    var body: some View{
        
        VStack{
        
            Text("How do you feel today?").font(Font.custom("Avenir-Heavy", size: 24.0))
                .padding()

            
            // Calm/Energized HStack
            HStack{
            RadioButtonsCalmEnergized()
                
            }
         
           
            HStack {
            Text("Calm") .font(Font.custom("Avenir-Medium", size: 16))
            Spacer()
            Text("Energized") .font(Font.custom("Avenir-Medium", size: 16))
                
            }
            .padding(.trailing)
             .padding(.leading)
            
           
            //Cheerful/Sensitive HStack
            
            HStack{
                
                    RadioButtonsCheerfulSensitive()
        
                    
            }
            HStack {
            Text("Cheerful") .font(Font.custom("Avenir-Medium", size: 16))
                
            
                Spacer()
                
            Text("Sensitive")
                    .font(Font.custom("Avenir-Medium", size: 16))
                
            }
                .padding(.trailing)
                .padding(.leading)
            
            
            //Distracted-Focused
            Group{
                
                HStack{
                   
                    RadioButtonsDistractedFocused()
                }
                
                
                
                
                HStack{
                    Text("Distracted") .font(Font.custom("Avenir-Medium", size: 16))
                        .font(.subheadline)
                    Spacer()
                    Text("Focused") .font(Font.custom("Avenir-Medium", size: 16))
                }.padding(.trailing)
                    .padding(.leading)
                
             
            //Relaxed - Stressed HStack
            
            HStack{
                RadioButtonsRelaxedStressed()
   
            }
            
            Group{
                HStack {
                    Text("Relaxed") .font(Font.custom("Avenir-Medium", size: 16))
                    Spacer()
                    Text("Stressed") .font(Font.custom("Avenir-Medium", size: 16))
                    
                }.padding(.trailing)
                    .padding(.leading)
            
            // Insecure - Self Confident HStack
            
            HStack{
            
                RadioButtonsInsecureSelfConfident()
            }
           
            HStack {
            Text("Insecure") .font(Font.custom("Avenir-Medium", size: 16))
                Spacer()
            Text("Self Confident") .font(Font.custom("Avenir-Medium", size: 16))
            }.padding(.trailing)
                .padding(.leading)
            
           
        
                
                }
                
            }
            
            
        }.padding(.leading)
            .padding(.trailing)
            
        }
    }


struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        SheetView().environmentObject(CardModel())
       
    }
}



