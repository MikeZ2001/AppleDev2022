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
        
        VStack{
            //See rounded rectangle
            ZStack{
               
                RoundedRectangle(cornerRadius: 40)
                    
                    .fill(LinearGradient(gradient: Gradient(colors: [Color(ColorsSaved.white1),Color(ColorsSaved.white2)])
                                         ,startPoint: .topLeading,
                                         endPoint: .bottomTrailing))
                    .frame(width: 307.44 , height: 546.56)
                    .background(.ultraThinMaterial,  in: RoundedRectangle(cornerRadius: 40))
                    .aspectRatio(CGSize(width: 9, height: 16), contentMode: .fill)
                    .overlay(
                        
                        //   Spacer()
                        
                        //Card Date
                        VStack{
                            
                            Spacer()
                                Text(Date().getCurrentDate())
                                    .font(Font.custom("Avenir-Heavy", size: 30.0))
                                    .multilineTextAlignment(.leading)
                                .padding()
                            
                            
                            HStack (alignment: .center) {
                                
                                SingleImagePickerView(cardModel: cardModel)
                                    .padding(.leading)
                                //Button emotions of the day
                                Button(action: {
                                    showingSheet.toggle()
                                }){
                                    Image("fiore pdf")
                                        .resizable()
                                        .scaledToFit()
                                        .padding()
                                    
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
                            
                            
                            //Stack centered elements
                            
                            //Song of the dayText("Super star \(Image(systemName: "star"))")
                            Text("\(Image(systemName: "music.note")) What song represents you today?   ")
                                .font(Font.custom("Avenir-Medium", size: 16))
                            
                                .padding(.top)
                            TextField("Write a song...", text: $myInput1)
                                .padding(.leading, 10)
                                .modifier(FlatGlassView())
                                
                            
                            
                            
                            
                            
                            
                            //Daily thoughts
                            Text(" \(Image(systemName: "sun.max.fill")) What are your daily thoughts?           ")
                            
                                .font(Font.custom("Avenir-Medium", size: 16))
                                
                                .padding(.top)
                            
                            TextField("Write your thoughts...", text: $myInput2)
                                .padding(.leading, 10)
                                .modifier(FlatGlassView())
                                .padding(.bottom, 15)
                            
                            Spacer()
                            
                            
                        }
                    )
                RoundedRectangle(cornerRadius: 40)
                
                    .stroke(
                        LinearGradient(
                            gradient: Gradient(colors: [Color(ColorsSaved.white3),Color(ColorsSaved.white4)]),
                            startPoint: .leading,
                            endPoint: .trailing
                        ),
                        lineWidth: 2
                    )
                    .frame(width: 307.44 , height: 546.56)
            }
                /*.background{
                
                RoundedRectangle(cornerRadius: 40)
                    .fill(LinearGradient(gradient: Gradient(colors: [Color(ColorsSaved.white1),Color(ColorsSaved.white2)])
                                         ,startPoint: .topLeading,
                                         endPoint: .bottomTrailing))
               
                    //.padding()
            }
            .padding()
                 */
                
            Spacer()
            
                Button {
                    cardModel.saveCard(songOfTheDay: myInput1, thoughtOfTheDay: myInput2, context: managedObjectContext)
                    saveCardAlertSheet.toggle()
                                }
            label: {
                                ZStack {
                                    Label("Save", systemImage: "square.and.arrow.up")
                                        .bold()
                                        .frame(minWidth: 130, minHeight: 45)
                                        .background(.thickMaterial)
                                        .cornerRadius(14)
                                        .padding(.bottom, 5)
                                        .alert(saveCardAlertText, isPresented: $saveCardAlertSheet) {
                                            Button("Continue"){
                                                
                                                //Set default fields
                                            }
                                        }
                                }
                            }
               
                
            
            //.padding()
                      
                        .foregroundColor(Color.primary.opacity(0.65))
                       
                        .padding()
                
        }.padding()
            
                   
        }
    }

struct ColorsSaved{
    static let white1 = UIColor(red: 1,green: 1,blue: 1,alpha: 0.4)
    static let white2 = UIColor(red: 1,green: 1,blue: 1,alpha: 0.1)
    static let white3 = UIColor(red: 1,green: 1,blue: 1,alpha: 0.5)
    static let white4 = UIColor(red: 1,green: 1,blue: 1,alpha: 0)
}


struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView().environmentObject(CardModel())       .background(Image("AppBackground"))
        }
    }
struct FlatGlassView : ViewModifier {
    func body(content: Content) -> some View {
        if #available(iOS 15.0, *) {
            content
                .padding()
                .frame(width:270, height: 45)
                .background(.ultraThinMaterial)
                .cornerRadius(14)
        } else {
            // Fallback on earlier versions
            content
                .padding()
                .frame(width:270, height: 45)
                .cornerRadius(14)
        }
    }
}

