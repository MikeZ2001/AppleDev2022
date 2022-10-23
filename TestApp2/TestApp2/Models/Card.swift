//
//  Card.swift
//  TestApp2
//
//  Created by Michele Zurlo on 23/10/22.
//

import SwiftUI

enum Emotion{
    
        case Calm
        case Energized
}


struct Card{
    
    var date: Date
    var image: Image
    var songOfTheDay: String
    var thoughtOfTheDay: String
    var emotions: [Emotion]
    
}
