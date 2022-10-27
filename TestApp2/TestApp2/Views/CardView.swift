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
    @State var alertSheet = false
    
    @State var alertText:String = ""
    @State var saveCardAlertText: String = "Card Saved"
    
    @State var saveCardAlertSheet = false
    
    var cardModel: CardModel
    
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.id, order: .reverse)]) var cardData: FetchedResults<CardCoreDataEntity>
    
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
                                Image("AppIcon")
                                .resizable()
                                .scaledToFit()
                                .bold()
                                .font(Font.custom("Helvetica Neue", size: 24.0))
                                .foregroundColor(Color.white)
                                .background( Color(red: 0.4612, green: 0.8392, blue: 1.0))
                                .clipShape(Circle())
                            }.sheet(isPresented: $showingSheet){
                                NavigationView {
                                    SheetView(cardModel: cardModel)
                                        .toolbar {
                                            Button(action: {
                                                
                                                if(cardModel.saveEmotions(context: managedObjectContext)){
                                                    //Se il salvataggio va a buon fine emotion sheet dismiss alert sheet show else alert sheet input all the emotionù
                                                    alertText = "Emotions saved"
                                                      alertSheet.toggle()
                                                    
                                                   
                                                }
                                                else{
                                                    alertText = "All the emotions should be selected"
                                                    alertSheet.toggle()
                                                    
                                                }
                                               
                                            }) {
                                                  Text("Save")
                                                    
                                                   
                                                }.alert(alertText, isPresented: $alertSheet) {
                                                    Button("Continue"){
                                                        if(cardModel.saveEmotions(context: managedObjectContext)){
                                                            showingSheet.toggle()
                                                        }
                                                    }
                                                }
                                        }
                                }
                            }
                                    
                        }.frame(maxWidth: .infinity)
                        .padding()
                            
                       //Stack centered elements
                        
                            //Song of the day
                        Text("What song represents you today? ")
                            .font(.callout)
                            .fontWeight(.bold)
                                .padding(.top)
                                .padding(.leading)
                            TextField("Write a song...", text: $myInput1)
                                .padding(.leading, 13)
                                .padding(.trailing, 13)
                                .textFieldStyle(RoundedBorderTextFieldStyle.init())
                            
                            //Daily thoughts
                        Text("What are your daily thoughts?")
                            .font(.callout)
                            .fontWeight(.bold)
                            .padding(.top)
                                .padding(.leading)
                            
                            TextField("Write your thoughts...", text: $myInput2)
                                .padding(.leading, 13)
                                .padding(.trailing, 13)
                                .padding(.bottom)
                                .textFieldStyle(RoundedBorderTextFieldStyle.init())
                        
                        Spacer()
                        Button(action: {
                            cardModel.saveCard(songOfTheDay: myInput1, thoughtOfTheDay: myInput2, context: managedObjectContext)
                            
                            //CoreDataCardModel().saveData(songOfTheDay: myInput1, thoughtOfTheDay: myInput2, context: managedObjectContext)
                            //if card is saved correctly
                            saveCardAlertSheet.toggle()
                        }){
                            Label("Save", systemImage: "square.and.arrow.up")
                                .alert(saveCardAlertText, isPresented: $saveCardAlertSheet) {
                                    Button("Continue"){
                                        
                                        //Set default fields
                                    }
                                }
                            
                                
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
        CardView(alertText: " ",cardModel: CardModel())
    }
}
