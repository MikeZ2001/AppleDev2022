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
}

struct MoodView: View {
    
        let userEmotion: [ValuePerCategory] = [
            .init(dayNumber: "1", moodCategory: "Mood 1"),
            .init(dayNumber: "2", moodCategory: "Mood 2"),
            .init(dayNumber: "3", moodCategory: "Mood 3"),
            .init(dayNumber: "4", moodCategory: "Mood 4"),
            .init(dayNumber: "5", moodCategory: "Mood 5"),
            .init(dayNumber: "6", moodCategory: "Mood 5"),
            .init(dayNumber: "7", moodCategory: "Mood 5")
        ]
    
    var body: some View {
        
        VStack {
            Chart(userEmotion, id: \.dayNumber) { currentUserEmotion in
            PointMark(
            x: .value("Category", currentUserEmotion.dayNumber),
            y: .value("Value", currentUserEmotion.moodCategory)
            ).foregroundStyle(Color.black)
                    .symbolSize(150)
            }
        }.padding(.bottom,300).padding(.leading,60).padding(.trailing,60)
    }
}
struct MoodView_Previews: PreviewProvider {
    static var previews: some View {
        MoodView()
    }
}
