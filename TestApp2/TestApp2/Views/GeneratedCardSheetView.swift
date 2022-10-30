//
//  CardSheetView.swift
//  TestApp2
//
//  Created by Michele Zurlo on 27/10/22.
//

import Foundation
import SwiftUI

//Card Layout
struct GeneratedCardSheetView: View {

    @State var showingSheet = false
    @State var alertSheet = false
    
    @EnvironmentObject var cardModel: CardModel
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    var currentCardCalendar: Card
    
    var body: some View {
        
                    VStack{
                        //Card Date
                        Text(Date().getDateToString(date: currentCardCalendar.date))
                            .fontWeight(.black)
                            .font(Font.custom("Helvetica Neue", size: 38.0))
                            .multilineTextAlignment(.leading)
                            .padding()
                            
                        HStack (alignment: .center) {
    
                                //Image
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
                                    GeneratedCardEmotionSheetView(currentCardCalendar: currentCardCalendar)
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
                        Text(currentCardCalendar.songOfTheDay)
                                .padding(.leading, 13)
                                .padding(.trailing, 13)
                                .textFieldStyle(RoundedBorderTextFieldStyle.init())
                            
                            //Daily thoughts
                            Text("What are your daily thoughts?")
                                .padding(.top)
                                .padding(.leading)
                            
                        Text(currentCardCalendar.thoughtOfTheDay)
                                .padding(.leading, 13)
                                .padding(.trailing, 13)
                                .padding(.bottom)
                                .textFieldStyle(RoundedBorderTextFieldStyle.init())
                        
                        Spacer()
                        Button(action: {
                            
                            //Share card only
                            
                            
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


struct GeneratedCardSheetView_Previews: PreviewProvider {
    static var previews: some View {
        GeneratedCardSheetView(currentCardCalendar: Card(date: Date(),image: Image(systemName: "camera"),songOfTheDay: "adfa",thoughtOfTheDay: "Ciaooo",emotions: [Emotion]())).environmentObject(CardModel())
    }
}
