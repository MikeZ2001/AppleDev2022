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
    
    @State var currentCardCalendar: Card
    
    
    
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
                            Text(Date().getDateToString(date: currentCardCalendar.date))
                                    .font(Font.custom("Avenir-Heavy", size: 30.0))
                                    .multilineTextAlignment(.leading)
                                .padding()
                            
                            
                            HStack (alignment: .center) {
                                
                              //  SingleImagePickerView(cardModel: cardModel)
                                    //.padding(.leading)
                                
                                UserPhotoOfTheDay(imageState: .success(currentCardCalendar.image))
                                    .padding(.leading)
                                
                
                                   // .padding(.leading)
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
                                     
                                        
                                            GeneratedCardEmotionSheetView(currentCardCalendar: currentCardCalendar)
                                                .toolbar {
                                                    Button(action: {
                                                        
                                                        showingSheet.toggle()
                                                        
                                                        
                                                    }) {
                                                        Text("Close")
                                                        
                                                        
                                                    }
                                                }
                                    }
                                    }
                                
                                
                            }.frame(maxWidth: .infinity)
                            
                            
                            //Stack centered elements
                            
                     
                            Text("\(Image(systemName: "music.note")) What song represents you today?   ")
                                .font(Font.custom("Avenir-Medium", size: 16))
                                .padding(.top)
                            
                            Text(currentCardCalendar.songOfTheDay)
                                .padding(.leading, 10)
                                .modifier(FlatGlassView())
                                
                            //Daily thoughts
                            Text(" \(Image(systemName: "sun.max.fill")) What are your daily thoughts?           ")
                            
                                .font(Font.custom("Avenir-Medium", size: 16))
                                
                                .padding(.top)
                            
                            Text(currentCardCalendar.thoughtOfTheDay)
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
              
            Spacer()
            
                Button {
                    cardModel.shareCard()
                                }
            label: {
                                ZStack {
                                    Label("Share", systemImage: "square.and.arrow.up")
                                        .bold()
                                        .frame(minWidth: 130, minHeight: 45)
                                        .background(.thickMaterial)
                                        .cornerRadius(14)
                                        .padding(.bottom, 5)
                                        
                                }
                            }
        
                        .foregroundColor(Color.primary.opacity(0.65))
                        .padding()
                
        }.padding()
            .background(Image("AppBackground"))
        }

    }


struct GeneratedCardSheetView_Previews: PreviewProvider {
    static var previews: some View {
        
        GeneratedCardSheetView(currentCardCalendar: Card(date: Date(),image: Image(systemName: "camera"),songOfTheDay: "adfa",thoughtOfTheDay: "Ciaooo",emotions: [Emotion]())).background(Image("AppBackground"))
            .environmentObject(CardModel())
    }
}



