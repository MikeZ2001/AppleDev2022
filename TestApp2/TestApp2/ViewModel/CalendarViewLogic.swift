//
//  CalendarView.swift
//  TestApp2
//
//  Created by Michele Zurlo on 21/10/22.
//

import SwiftUI


struct CalendarViewLogic: UIViewRepresentable {
    
    let interval: DateInterval
    @ObservedObject var cardModel: CardModel
    @Binding var dateSelected: DateComponents?
    @Binding var displayEvents: Bool
    @FetchRequest(sortDescriptors: [SortDescriptor(\.id, order: .reverse)]) var cardData: FetchedResults<CardCoreDataEntity>
    
    
    func makeUIView(context: Context) -> some UICalendarView {
        let view = UICalendarView()
        
       // var size = CGSize(width: 10, height: 10)
        
        //view.frame.size = size
        
       // view.delegate = context.coordinator as! any UICalendarViewDelegate
        view.calendar = Calendar(identifier: .gregorian)
        view.availableDateRange = interval
        let dateSelection = UICalendarSelectionSingleDate(delegate: context.coordinator)
        view.selectionBehavior = dateSelection
    
        
        return view
    }
    
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self, cardModel: _cardModel)
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    class Coordinator: NSObject,UICalendarSelectionSingleDateDelegate{
        
   
        var parent: CalendarViewLogic
        @ObservedObject var cardModel: CardModel
        

        init(parent: CalendarViewLogic,cardModel: ObservedObject<CardModel>) {
            self.parent = parent
            self._cardModel = cardModel
        }
      
        
        func dateSelection(_ selection: UICalendarSelectionSingleDate,
                           didSelectDate dateComponents: DateComponents?) {
            parent.dateSelected = dateComponents
          
            guard let dateComponents else { return }
        
        
            
            //let foundCard = cardModel.cardDataEntity.filter{$0.date.startOfDay == dateComponents.date?.startOfDay}
            
            print("Date components date:   ",Date().getDateToString(date: dateComponents.date!))
            
            for card in parent.cardData {
                
                print("\(Date().getDateToString(date: card.cardDate))")
                
                if(Date().getDateToString(date: card.cardDate).contains("\(Date().getDateToString(date: dateComponents.date!))")){
                    
                    parent.displayEvents = true
                    
                    var uiImage = UIImage(data: card.imageOfTheCard)
                    var image = Image(uiImage: uiImage!)
                   
                    var emotions = [Emotion]()
                    
                    
                    for emotion in card.emotion{
                        
                        var emotionEntity: Emotion = Emotion(size: 0, color: Color((emotion as AnyObject).color!))
                        emotions.append(emotionEntity)
                        print("\(emotionEntity)")
                    }
                     
                    
                   // let cardEmotion = card.emotion.allObjects as? [EmotionCoreDataEntity]
                    
                    
                    
                    //demo Behaviour for card emotions [inscureEmotion,stressedEmotion]
                    
                    
                   // var currentCard = Card(date: card.cardDate, image: image, songOfTheDay: card.songOfTheDay!, thoughtOfTheDay: card.thoughtOfTheDay!, emotions: [insecureEmotion,stressedEmotion,selfConfidentEmotion,calmEmotion,selfConfidentEmotion])
                    
                    var currentCard = Card(date: card.cardDate, image: image, songOfTheDay: card.songOfTheDay!, thoughtOfTheDay: card.thoughtOfTheDay!, emotions: emotions)
                    
                    print("Current Card Selected Calendar ::::\(currentCard)")
                    
                    cardModel.saveCurrentCardCalendar(card: currentCard)
                    
                    //parent.displayEvents.toggle()
                    
                    print("Oleee")
                }
                
                
            }
            
            //let foundCard = cardModel.cardData.filter{$0.cardDate.getCurrentDateFormatted().startOfDay == dateComponents.date?.startOfDay}
          /*
            if(!foundCard.isEmpty){
                parent.displayEvents.toggle()
            }else
            {
                print("No card found in that date")
            }
           */
            
           
        }
        
        func dateSelection(_ selection: UICalendarSelectionSingleDate,
                           canSelectDate dateComponents: DateComponents?) -> Bool {
            return true
        }
       
        
        
        
    }
    
}




    

