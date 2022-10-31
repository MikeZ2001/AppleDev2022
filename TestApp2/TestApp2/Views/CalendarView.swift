//
//  CalendarView2.swift
//  TestApp2
//
//  Created by Michele Zurlo on 27/10/22.
//

import SwiftUI

struct CalendarView: View {
    
    //Calendar View
    @EnvironmentObject var cardModel: CardModel
    
    @State private var dateSelected: DateComponents?
    @State var displayEvents = false
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.id, order: .reverse)]) var cardFetchedResults: FetchedResults<CardCoreDataEntity>
    

    var body: some View {
        
            VStack{
                
                ScrollView{
                    
                        CalendarViewLogic(interval: DateInterval(start: .distantPast, end: .distantFuture),
                                          cardModel: cardModel, dateSelected: $dateSelected,
                                          displayEvents: $displayEvents)
                    
                       
                        .background{
                            
                            RoundedRectangle(cornerRadius: 40)
                                .fill(LinearGradient(gradient: Gradient(colors: [Color(ColorsSaved.white1),Color(ColorsSaved.white2)])
                                                     ,startPoint: .topLeading,
                                                     endPoint: .bottomTrailing))
                           
                        }
                       
                    
                    Spacer()
                    
                }.padding()
            }.padding()
            .fullScreenCover(isPresented: $displayEvents) {
                
                //Here call card view
                NavigationView{
                    GeneratedCardSheetView(currentCardCalendar: cardModel.currentCardCalendar!).environmentObject(cardModel)
                        .toolbar {
                            Button(action: {
                                
                                
                                displayEvents.toggle()
                                
                            }) {
                                Text("Done")
                                
                                
                            }
                            
                        }
                }
                
            }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
            .environmentObject(CardModel())
            .background(Image("AppBackground"))
            
    }
}
