//
//  CalendarView2.swift
//  TestApp2
//
//  Created by Michele Zurlo on 27/10/22.
//

import SwiftUI

struct CalendarView: View {
    
    //@State private var dateSelected = Date()
   // @State private var displayEvents = false
    
    //Calendar View
    @EnvironmentObject var cardModel: CardModel
    //@EnvironmentObject var eventStore: EventStore
    @State private var dateSelected: DateComponents?
    @State private var displayEvents = false
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.id, order: .reverse)]) var cardFetchedResults: FetchedResults<CardCoreDataEntity>
    
   
   // @State private var formType: EventFormType?
        
    var body: some View {
        
            VStack (alignment: .center){
                
                ScrollView{
                    
                    CalendarViewLogic(interval: DateInterval(start: .distantPast, end: .distantFuture),
                                      cardModel: cardModel, dateSelected: $dateSelected,
                                      displayEvents: $displayEvents).padding()
                        .background{
                            
                            RoundedRectangle(cornerRadius: 40)
                                .fill(LinearGradient(gradient: Gradient(colors: [Color(ColorsSaved.white1),Color(ColorsSaved.white2)])
                                                     ,startPoint: .topLeading,
                                                     endPoint: .bottomTrailing))
                            
                        }
                    
                    
                }
            }
            .sheet(isPresented: $displayEvents) {
                
                //Here call card view
                GeneratedCardSheetView(currentCardCalendar: cardModel.currentCardCalendar!)
                
            }
            
        
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView().environmentObject(CardModel())
    }
}
