//
//  ContentView.swift
//  TestApp2
//
//  Created by Michele Zurlo on 17/10/22.
//

//
//  ContentView.swift
//  TestAPP
//
//  Created by Michele Zurlo on 15/10/22.
//

import SwiftUI
import Charts

//Enum for the segmented control selections
enum AppSection : String, CaseIterable {
    case MyCard = "My Card"
    case MyJourney = "My Journey"
    case MyMood = "My Mood"
}

struct MainView: View {
    
    //@State is a property wrapper that allow us to update a variable and allows swift to recreate the view when that variable change to see the changes on the screen
    
    @State var segmentationSelection : AppSection = .MyCard
    
    var body: some View {
        VStack (alignment: .leading) {
            Text(".AppName.")
                .font(Font.custom("SFMono", size: 48))
                .multilineTextAlignment(.leading)
                .padding(.leading)
                .fontWeight(.bold)
                .padding(.top)
                
            
            //To change the background of the screen
            //Color(.green).edgesIgnoringSafeArea(.all)
            //Color(red:0.09,green:0.63,blue:0.52) RGB
           
            
            VStack {
                
                //Segmented Control
                Picker("", selection: $segmentationSelection) {
                    ForEach(AppSection.allCases, id: \.self) { option in
                        Text(option.rawValue)
                    }
                }.pickerStyle(SegmentedPickerStyle())
                    .padding()
                
        
                //Logic of Segmented Control
                if(segmentationSelection.rawValue.elementsEqual("My Card")){
                    CardLayout(cardDate: "04/06/2023",photoName:"DogImage")
                    
                }
                
                if(segmentationSelection.rawValue.elementsEqual("My Mood")){
                    
                    MoodView()
                    
                }
                
                if(segmentationSelection.rawValue.elementsEqual("My Journey")){
                    
                    CalendarView()
                    
                }
                    
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

//Card Layout
struct CardLayout: View {
    let cardDate: String
    let photoName : String
   
    
    @State var myInput1: String = ""
    @State var myInput2: String = ""
    
    @State var showingSheet = false
    
    
    var body: some View {
        
      
        VStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.teal)
                .frame(height: 600)
                .overlay(
                    VStack(alignment: .leading){
                        //Card Date
                        Text(cardDate)
                            .fontWeight(.black)
                            .multilineTextAlignment(.leading)
                            .padding(.top)
                            .padding(.leading)
                     
                        HStack {
                            
                        //Image of the day
                        Image(photoName)
                            .resizable()
                           
                            .scaledToFit()
                            .frame(maxWidth: .infinity)
                            .frame(maxHeight: .infinity)
                            .padding(.leading)
                            .cornerRadius(10)
                            .padding(.top)
                   
                            
                            
                       //Button emotions of the day
                            Button(action: {
                                //showingSheet.toggle()
                            }){
                                Image("AppIcon")
                                .resizable()
                                .scaledToFit()
                                .bold()
                                .padding()
                                .frame(maxWidth: .infinity)
                                
                                .font(Font.custom("Helvetica Neue", size: 24.0))
                                .foregroundColor(Color.white)
                                .background( Color(red: 0.4612, green: 0.8392, blue: 1.0))
        
                                .clipShape(Capsule())
                            }.sheet(isPresented: $showingSheet){
                                SheetView()
                            }
                            
                        }.frame(maxWidth: .infinity).frame(maxHeight: .infinity)
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
                   
                    
            ).padding(20)
        }
    }
}

struct ValuePerCategory {
    var dayNumber: String
    var moodCategory: String
}




struct SheetView: View{
    
    var body: some View{
        
        VStack{
            
            HStack{
                Button {
                } label: {
                  Text("Small")
                }
                .controlSize(.small)
                .buttonStyle(.bordered)
                clipShape(Circle())
                

            }
            
        }
    }
}
