//
//  CardLayout.swift
//  TestApp2
//
//  Created by Michele Zurlo on 22/10/22.
//

import Foundation
import SwiftUI

//Card Layout
struct CardView: View {
    let cardDate: String
    let photoName : String
   
    
    @State var myInput1: String = ""
    @State var myInput2: String = ""
    
    @State var showingSheet = false
    
    
    var body: some View {
        
      
        VStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.teal)
                .frame(maxWidth: .infinity,maxHeight: .infinity)
                .overlay(
                    VStack(alignment: .leading){
                        //Card Date
                        Text(cardDate)
                            .fontWeight(.black)
                            .multilineTextAlignment(.leading)
                            .padding(.top)
                            .padding(.leading)
                     
                        HStack {
                            
                            /*
                            
                        //Image of the day
                        Image(photoName)
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .padding(.leading)
                            .cornerRadius(10)
                             */
                            
                            ImagePickerAndPhotoView()
                
                   
                            
                            
                       //Button emotions of the day
                            Button(action: {
                                showingSheet.toggle()
                            }){
                                Image("AppIcon")
                                .resizable()
                                .scaledToFit()
                                .bold()
                                .frame(maxWidth: .infinity)
                                .font(Font.custom("Helvetica Neue", size: 24.0))
                                .foregroundColor(Color.white)
                                .background( Color(red: 0.4612, green: 0.8392, blue: 1.0))
                                .clipShape(Capsule())
                            }.sheet(isPresented: $showingSheet){
                                SheetView()
                                  
                            }
                            
                        }.frame(maxWidth: .infinity).frame(maxHeight: .infinity)
                       
                        
                        
                       //Stack centered elements
                        
                            //Song of the day
                            Text("What song represents you today? ")
                                .padding(.top)
                                .padding(.leading)
                            TextField("Write a song...", text: $myInput1)
                                .padding(.leading, 13)
                                .padding(.trailing, 13)
                                .textFieldStyle(RoundedBorderTextFieldStyle.init())
                            
                            //Daily thoughts
                            Text("What are your daily thoughts?")
                                .padding(.top)
                                .padding(.leading)
                            
                            TextField("Write your thoughts...", text: $myInput2)
                                .padding(.leading, 13)
                                .padding(.trailing, 13)
                                .padding(.bottom)
                                .textFieldStyle(RoundedBorderTextFieldStyle.init())
                        
                      
                        
                        //Generate Card Button
                        VStack(alignment: .center) {
                                   Button(action: {}){
                                       Text("Generate Card")
                                       .bold()
                                       .font(Font.custom("Helvetica Neue", size: 24.0))
                                       .padding(20)
                                       .foregroundColor(Color.white)
                                       .background( Color(red: 0.4612, green: 0.8392, blue: 1.0))
                                       .cornerRadius(12)
                                       .clipShape(Capsule())
                                   }
                        }.frame(maxWidth: .infinity).padding(.bottom)
                        
                    }
                   
                    
            )
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(cardDate: "04/06/2023",photoName:"DogImage")
    }
}
