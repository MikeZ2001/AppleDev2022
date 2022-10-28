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
    //@EnvironmentObject var eventStore: EventStore
    @State private var dateSelected: DateComponents?
    @State private var displayEvents = false
   // @State private var formType: EventFormType?
    
    var body: some View {
  
        CalendarViewLogic(interval: DateInterval(start: .distantPast, end: .distantFuture),
                     dateSelected: $dateSelected,
                     displayEvents: $displayEvents).padding()
        .sheet(isPresented: $displayEvents) {
            
            //Here call card view
            GeneratedCardSheetView()
            
        }
        
        
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
