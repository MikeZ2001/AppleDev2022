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
    
    @EnvironmentObject var cardModel: CardModel
    
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.id, order: .reverse)]) var cardData: FetchedResults<CardCoreDataEntity>
    
    var body: some View {
        
        ZStack{
            
            RoundedRectangle(cornerRadius: 40)
                
                .fill(LinearGradient(gradient: Gradient(colors: [Color(ColorsSaved.white1),Color(ColorsSaved.white2)])
                                     ,startPoint: .topLeading,
                                     endPoint: .bottomTrailing))
                .overlay(
            
            
            //Card Date
            VStack{
                Text(Date.getCurrentDate())
                    .font(Font.custom("Avenir-Heavy", size: 36.0))
                    .multilineTextAlignment(.leading)
                    .padding()
                
                HStack (alignment: .center) {
                    
                    SingleImagePickerView(cardModel: cardModel)
                        .padding()
                    
                    //Button emotions of the day
                    Button(action: {
                        showingSheet.toggle()
                    }){
                        Image("fiore pdf")
                            .resizable()
                            .scaledToFit()
        
                    }.sheet(isPresented: $showingSheet){
                        NavigationView {
                            SheetView()
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
                
                
            }
            )
        }
                    .padding()
                   
        }
    }

struct ColorsSaved{
    static let white1 = UIColor(red: 1,green: 1,blue: 1,alpha: 0.4)
    static let white2 = UIColor(red: 1,green: 1,blue: 1,alpha: 0.1)
}


struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView().environmentObject(CardModel())
    }
}
