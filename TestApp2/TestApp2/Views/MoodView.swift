//
//  MoodView.swift
//  TestApp2
//
//  Created by Michele Zurlo on 21/10/22.
//

import SwiftUI
import Charts

struct ValuePerCategory {
    var dayNumber: String
    var moodCategory: String
    var color: Color
}

struct MoodView: View {
    
    let userEmotion: [ValuePerCategory] = [
        .init(dayNumber: "1", moodCategory: "Calm/Energized",color: calmEmotion.color),
        .init(dayNumber: "1", moodCategory: "Cheerful/Sensitive",color: cheerfulEmotion.color),
        .init(dayNumber: "1", moodCategory: "Insecure/SelfConfident",color: quiteSelfConfidentEmotion.color),
        .init(dayNumber: "1", moodCategory: "Relaxed/Stressed",color: quiteStressedEmotion.color),
        .init(dayNumber: "1", moodCategory: "Distracted/Focused",color: focusedEmotion.color), //Day 1
        .init(dayNumber: "2", moodCategory: "Calm/Energized",color: energizedEmotion.color),
        .init(dayNumber: "2", moodCategory: "Cheerful/Sensitive",color: NormalColorCheerfulSensitiveEmotion.color),
        .init(dayNumber: "2", moodCategory: "Insecure/SelfConfident",color: InsecureSelfConfidentNormalEmotion.color),
        .init(dayNumber: "2", moodCategory: "Relaxed/Stressed",color: relaxedEmotion.color),
        .init(dayNumber: "2", moodCategory: "Distracted/Focused",color: quiteFocusedEmotion.color),//Day2
        .init(dayNumber: "3", moodCategory: "Calm/Energized",color: calmEmotion.color),
        .init(dayNumber: "3", moodCategory: "Cheerful/Sensitive",color: quiteCheerfulEmotion.color),
        .init(dayNumber: "3", moodCategory: "Insecure/SelfConfident",color: quiteSelfConfidentEmotion.color),
        .init(dayNumber: "3", moodCategory: "Relaxed/Stressed",color: quiteStressedEmotion.color),
        .init(dayNumber: "3", moodCategory: "Distracted/Focused",color: focusedEmotion.color),//Day3
        .init(dayNumber: "4", moodCategory: "Calm/Energized",color: calmEmotion.color),
        .init(dayNumber: "4", moodCategory: "Cheerful/Sensitive",color: quiteSensitiveEmotion.color),
        .init(dayNumber: "4", moodCategory: "Insecure/SelfConfident",color: quiteSelfConfidentEmotion.color),
        .init(dayNumber: "4", moodCategory: "Relaxed/Stressed",color: relaxedEmotion.color),
        .init(dayNumber: "4", moodCategory: "Distracted/Focused",color: distractedEmotion.color),//Day4
        .init(dayNumber: "5", moodCategory: "Calm/Energized",color: quiteEnergizedEmotion.color),
        .init(dayNumber: "5", moodCategory: "Cheerful/Sensitive",color: cheerfulEmotion.color),
        .init(dayNumber: "5", moodCategory: "Insecure/SelfConfident",color: insecureEmotion.color),
        .init(dayNumber: "5", moodCategory: "Relaxed/Stressed",color: relaxedEmotion.color),
        .init(dayNumber: "5", moodCategory: "Distracted/Focused",color: focusedEmotion.color),//Day5
        .init(dayNumber: "6", moodCategory: "Calm/Energized",color: calmEmotion.color),
        .init(dayNumber: "6", moodCategory: "Cheerful/Sensitive",color: sensitiveEmotion.color),
        .init(dayNumber: "6", moodCategory: "Insecure/SelfConfident",color: selfConfidentEmotion.color),
        .init(dayNumber: "6", moodCategory: "Relaxed/Stressed",color: relaxedEmotion.color),
        .init(dayNumber: "6", moodCategory: "Distracted/Focused",color: distractedEmotion.color),//Day6
        
            .init(dayNumber: "7", moodCategory: "Calm/Energized",color: quiteCalmEmotion.color),
            .init(dayNumber: "7", moodCategory: "Cheerful/Sensitive",color: NormalColorCheerfulSensitiveEmotion.color),
            .init(dayNumber: "7", moodCategory: "Insecure/SelfConfident",color: selfConfidentEmotion.color),
            .init(dayNumber: "7", moodCategory: "Relaxed/Stressed",color: RelaxedStressedNormalEmotion.color),
            .init(dayNumber: "7", moodCategory: "Distracted/Focused",color: distractedFocusedNormalEmotion.color),
        
    ]
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.id, order: .reverse)]) var cardData: FetchedResults<CardCoreDataEntity>
    @FetchRequest(sortDescriptors: [SortDescriptor(\.id, order: .reverse)]) var cardEmotionData: FetchedResults<EmotionCoreDataEntity>
    
    @State private var image: Data = .init(count: 0)
    
    var emptyImage = UIImage(systemName: "camera")
    
    @EnvironmentObject var cardModel: CardModel
    
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @State private var dateSelected: DateComponents?
    @State private var displayEvents = false
    
  
    var body: some View {
        
        
        VStack {
            
             Button(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/) {
             
             
             
             cardModel.deleteDataOfDB(context: managedObjectContext)
             
             }
            
            /*
             
             List(cardData) { item in
             
             HStack{
             
             Text(item.songOfTheDay!)
             Spacer()
             Text(item.thoughtOfTheDay!)
             Spacer()
             
             Text("\(item.cardDate)")
             
             Spacer()
             
             //self.image = item.cardImage
             Image(uiImage: UIImage(data: (item.imageOfTheCard ) )!)
             .resizable()
             .scaledToFit()
             
             // UIImage(data: item.image)
             
             }
             
             }
             
             
             List(cardEmotionData) { item in
             
             HStack{
             
             // Text("\(item.size)")
             Spacer()
             
             }
             
             }
             
             
             }*/
        
           
            Chart(userEmotion, id: \.dayNumber) { currentUserEmotion in
                PointMark(
                    x: .value("Category", currentUserEmotion.dayNumber),
                    y: .value("Value", currentUserEmotion.moodCategory)
                ).foregroundStyle(currentUserEmotion.color)
                    .symbolSize(150)
            }.padding()
        }
        .background{
            
            RoundedRectangle(cornerRadius: 30)
                         .fill(LinearGradient(gradient: Gradient(colors: [Color(ColorsSaved.white1),Color(ColorsSaved.white2)])
                                              ,startPoint: .topLeading,
                                              endPoint: .bottomTrailing))
                         .background(.ultraThinMaterial,  in: RoundedRectangle(cornerRadius: 30))
            
        }
        .padding(.top)
        .padding(.bottom,400).padding(.leading,30).padding(.trailing,30)
             
       
    }
    }

struct MoodView_Previews: PreviewProvider {
    static var previews: some View {
        MoodView().environmentObject(CardModel())
    }
}
