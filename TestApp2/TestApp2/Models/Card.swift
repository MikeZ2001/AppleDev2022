//
//  Card.swift
//  TestApp2
//
//  Created by Michele Zurlo on 23/10/22.
//

import SwiftUI

struct Card{
    
    var date: Date
    var image: Image
    var songOfTheDay: String
    var thoughtOfTheDay: String
    var emotions: Array<Emotion?>
   
    
    static var sample: [Card] {
        return [
            Card(date: Date(), image: Image(systemName: "camera"), songOfTheDay: "Ciao", thoughtOfTheDay: "Wow", emotions: [Emotion]()),
            Card(date: Date().diff(numDays: 5), image: Image(systemName: "camera"), songOfTheDay: "Ciacdzcdo", thoughtOfTheDay: "Wowdsvdf", emotions: [Emotion]()),

            Card(date: Date().diff(numDays: 2), image: Image(systemName: "camera"), songOfTheDay: "Ciao", thoughtOfTheDay: "Wow", emotions: [Emotion]())

        ]
    }
    
}
