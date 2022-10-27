//
//  CardSheetView.swift
//  TestApp2
//
//  Created by Michele Zurlo on 27/10/22.
//

import Foundation
import SwiftUI

//Card Layout
struct CardSheetView: View {

    @State var showingSheet = false
    @State var alertSheet = false
    
    var cardModel: CardModel
    
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    var body: some View {
        
                    VStack{
                        //Card Date
                        Text(Date.getCurrentDate())
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
                                Image("fiore")
                                .resizable()
                                .scaledToFit()
                                .bold()
                                .font(Font.custom("Helvetica Neue", size: 24.0))
                                
                                
                            }.sheet(isPresented: $showingSheet){
                                NavigationView {
                                    GeneratedCardEmotionSheetView(cardModel: cardModel)
                                        .toolbar {
                                            Button(action: {
                                                
                                                if(cardModel.saveEmotions(context: managedObjectContext)){
                                                    //Se il salvataggio va a buon fine emotion sheet dismiss alert sheet show else alert sheet input all the emotionù
                                                  
                                                      //alertSheet.toggle()
                                                    
                                                   
                                                }
                                                else{
                                                  //  alertSheet.toggle()
                                                    
                                                }
                                               
                                            }) {
                                                  Text("Edit")
                                                    
                                                   
                                                }
                                        }
                                }
                            }
                                    
                        }.frame(maxWidth: .infinity)
                        .padding()
                            
                       //Stack centered elements
                        
                            //Song of the day
                            Text("What song represents you today? ")
                                .padding(.top)
                                .padding(.leading)
                            Text("Azzurro")
                                .padding(.leading, 13)
                                .padding(.trailing, 13)
                                .textFieldStyle(RoundedBorderTextFieldStyle.init())
                            
                            //Daily thoughts
                            Text("What are your daily thoughts?")
                                .padding(.top)
                                .padding(.leading)
                            
                            Text("My daily thoughts are ...")
                                .padding(.leading, 13)
                                .padding(.trailing, 13)
                                .padding(.bottom)
                                .textFieldStyle(RoundedBorderTextFieldStyle.init())
                        
                        Spacer()
                        Button(action: {
                            
                            //Share card only
                            
                            //CoreDataCardModel().saveData(songOfTheDay: myInput1, thoughtOfTheDay: myInput2, context: managedObjectContext)
                            //if card is saved correctly
                            
                        }){
                            Label("Share", systemImage: "square.and.arrow.up")
                               
                            
                                
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


struct CardSheetView_Previews: PreviewProvider {
    static var previews: some View {
        CardSheetView(cardModel: CardModel())
    }
}
