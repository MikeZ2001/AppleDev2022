//
//  CalendarView.swift
//  TestApp2
//
//  Created by Michele Zurlo on 21/10/22.
//

import SwiftUI

struct CalendarView: UIViewRepresentable {
    let interval: DateInterval
    
    
    func makeUIView(context: Context) -> UICalendarView {
        let view = UICalendarView()
        view.calendar = Calendar(identifier: .gregorian)
        view.availableDateRange = interval
        return view 
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
}
    


struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView(interval: DateInterval(start: .distantPast, end: .distantFuture))
    }
}
