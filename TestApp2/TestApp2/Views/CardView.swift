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

    @State var myInput1: String = ""
    @State var myInput2: String = ""
    
    @State var showingSheet = false
    
    var cardModel: CardModel
    
    var body: some View {
        
                    VStack{
                        //Card Date
                        Text("24/03/2022")
                            .fontWeight(.black)
                            .font(Font.custom("Helvetica Neue", size: 38.0))
                            .multilineTextAlignment(.leading)
                            .padding()
                            
                        HStack (alignment: .center) {
    
                        SingleImagePickerView(cardModel: cardModel)
                            
                       //Button emotions of the day
                            Button(action: {
                                showingSheet.toggle()
                            }){
                                Image("AppIcon")
                                .resizable()
                                .scaledToFit()
                                .bold()
                                .font(Font.custom("Helvetica Neue", size: 24.0))
                                .foregroundColor(Color.white)
                                .background( Color(red: 0.4612, green: 0.8392, blue: 1.0))
                                .clipShape(Circle())
                            }.sheet(isPresented: $showingSheet){
                                SheetView(cardModel: cardModel)
                                    
                            }
                            
                        }.frame(maxWidth: .infinity)
                        .padding()
                            
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
                        
                        Spacer()
                        Button(action: {
                            cardModel.saveCard()
                        }){
                            Label("Save", systemImage: "square.and.arrow.up")
                            
                                
                        }.buttonStyle(.bordered)
                            .padding()
                        Spacer()
                        
                        
                    }.background{
                        RoundedRectangle(cornerRadius: 30)
                            .foregroundColor(Color("NormalColor"))
                    }
                    .padding()
                   
        }
    }


struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(cardModel: CardModel())
    }
}
