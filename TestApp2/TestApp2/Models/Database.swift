//
//  Database.swift
//  TestApp2
//
//  Created by Michele Zurlo on 24/10/22.
//

import SwiftUI
//BIgger 50
//Quite 40
//Normal 30


//Calm-Energized (Default Value)

var calmEmotion = Emotion(size: 50, color: Color("CalmColor"))
var quiteCalmEmotion = Emotion(size: 40, color: Color("QuiteCalmColor"))
var NormalColorCalmEnergizedEmotion = Emotion(size: 30, color: Color("CalmEnergizedNormalColor"))
var quiteEnergizedEmotion = Emotion(size: 40, color: Color("QuiteEnergizedColor"))
var energizedEmotion = Emotion(size: 50, color: Color("EnergizedColor"))





//Insecure - Self Confident (Default Values)
var insecureEmotion = Emotion(size: 50, color: Color("InsecureColor"))
var quiteInsecureEmotion = Emotion(size: 40, color: Color("QuiteInsecureColor"))
var InsecureSelfConfidentNormalEmotion = Emotion(size: 30, color: Color("InsecureSelfConfidentNormalColor"))
var quiteSelfConfidentEmotion = Emotion(size: 40, color: Color("QuiteSelfConfidentColor"))
var selfConfidentEmotion = Emotion(size: 50, color: Color("SelfConfidentColor"))


//Relaxed - Stressed (Default Values)

var relaxedEmotion = Emotion(size: 50, color: Color("RelaxedColor"))
var quiteRelaxedEmotion = Emotion(size: 40, color: Color("QuiteRelaxedColor"))
var RelaxedStressedNormalEmotion = Emotion(size: 30, color: Color("RelaxedStressedNormalColor"))
var quiteStressedEmotion = Emotion(size: 40, color: Color("QuiteStressedColor"))
var stressedEmotion = Emotion(size: 50, color: Color("StressedColor"))

//Distracted - Focused (Default values)
var quiteDistractedEmotion = Emotion(size: 40, color: Color("QuiteDistractedColor"))
var distractedEmotion = Emotion(size: 50, color: Color("DistractedColor"))
var distractedFocusedNormalEmotion = Emotion(size: 30, color: Color("DistractedFocusedNormalColor"))
var quiteFocusedEmotion = Emotion(size: 40, color: Color("QuiteFocusedColor"))
var focusedEmotion = Emotion(size: 50, color: Color("FocusedColor"))



var emotionGroup: [Emotion] = [quiteDistractedEmotion,distractedEmotion]
