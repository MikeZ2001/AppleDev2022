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
    
   // @ObservedObject var cardModel = CardModel()
    
    @EnvironmentObject var modelData: CardModel
    
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    var body: some View {
        VStack (alignment: .leading) {
            Text(".5Dots.")
                .font(Font.custom("SFMono", size: 40))
                .font(.title2)
                .padding()
                .fontWeight(.bold)
            
                
                    
            VStack {
                
                //Segmented Control
                Picker("", selection: $segmentationSelection) {
                    ForEach(AppSection.allCases, id: \.self) { option in
                        Text(option.rawValue)
                    }
                }.pickerStyle(SegmentedPickerStyle())
                    //.padding()
                
        
                //Logic of Segmented Control
                if(segmentationSelection.rawValue.elementsEqual("My Card")){
                    CardView()
                    
                }
                
                if(segmentationSelection.rawValue.elementsEqual("My Mood")){
                    
                    MoodView()
                        
                }
                
                if(segmentationSelection.rawValue.elementsEqual("My Journey")){
                    ScrollView {
                        CalendarView()
                        
                    }
                      
                }
                    
            }
            
        }.padding()
            
                .background(Image("AppBackground"))
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(CardModel())
           
    }
}

