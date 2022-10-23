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
        
            /*
                Text("How do you feel today?")
                    .multilineTextAlignment(.center)
                .font(Font.custom("SF Mono", size: 34.0))

             */
            
            
            // Calm/Energized HStack
            HStack{
                CurrentDotView(currentColor: Color("DistractedColor"))
                CurrentDotView(currentColor: Color("QuiteDistractedColor"))
                CurrentDotView(currentColor: Color("NormalColor"))
                CurrentDotView(currentColor: Color("QuiteFocusedColor"))
                CurrentDotView(currentColor: Color("FocusedColor"))
            }.padding()
         
           
            HStack {
            Text("Calm")
            Spacer()
            Text("Energized")
                
            }.padding(.trailing)
             .padding(.leading)
            
            //Cheerful/Sensitive HStack
            
            HStack{
                CurrentDotView(currentColor: Color("DistractedColor"))
                CurrentDotView(currentColor: Color("QuiteDistractedColor"))
                CurrentDotView(currentColor: Color("NormalColor"))
                CurrentDotView(currentColor: Color("QuiteFocusedColor"))
                CurrentDotView(currentColor: Color("FocusedColor"))
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
                CurrentDotView(currentColor: Color("InsecureColor"))
                CurrentDotView(currentColor: Color("QuiteInsecureColor"))
                CurrentDotView(currentColor: Color("NormalColor"))
                CurrentDotView(currentColor: Color("QuiteSelfConfidentColor"))
                CurrentDotView(currentColor: Color("SelfConfidentColor"))
            }.padding()
            
            HStack {
            Text("Insecure")
                Spacer()
            Text("Self Confident")
            }.padding(.trailing)
                .padding(.leading)
            
            //Relaxed - Stressed HStack
            
            HStack{
                CurrentDotView(currentColor: Color("DistractedColor"))
                CurrentDotView(currentColor: Color("QuiteDistractedColor"))
                CurrentDotView(currentColor: Color("NormalColor"))
                CurrentDotView(currentColor: Color("QuiteFocusedColor"))
                CurrentDotView(currentColor: Color("FocusedColor"))
            }.padding()
            
            HStack {
            Text("Relaxed")
                Spacer()
            Text("Stressed")
                
            }.padding(.trailing)
                .padding(.leading)
            
            HStack{
                CurrentDotView(currentColor: Color("DistractedColor"))
                CurrentDotView(currentColor: Color("QuiteDistractedColor"))
                CurrentDotView(currentColor: Color("NormalColor"))
                CurrentDotView(currentColor: Color("QuiteFocusedColor"))
                CurrentDotView(currentColor: Color("FocusedColor"))
            }.padding()
            
            HStack{
                Text("Relaxed")
                Spacer()
                Text("Stressed")
            }.padding(.trailing)
                .padding(.leading)
                
         
            
           
            
            
        
            

            
        }.padding()
            
        }
    }


struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        SheetView()
    }
}

struct CurrentDotView: View {
    
    var currentColor: Color
    
    var body: some View {
        Button(action: {
            
        }){
            Image("AppIcon")
                .resizable()
                .scaledToFit()
                .bold()
                .foregroundColor(.myColor)
                .background(currentColor)
                .clipShape(Capsule())
        }
    }
}
