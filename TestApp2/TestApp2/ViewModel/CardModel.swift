//
//  CardModel.swift
//  TestApp2
//
//  Created by Michele [Zurlo] on 22/10/22.
//

import Foundation
import SwiftUI
import PhotosUI
import Photos
import CoreTransferable
import UIKit

class CardModel: ObservableObject{
    
    
    @Published var userEmotionArray = []
    
    //var relaxedStressedEmotion: Emotion = nil
    
    
    var savedEmotion: Array<Emotion?> = Array(repeating: nil, count: 5)
    var relaxedStressedEmotion: Emotion?
    
    func saveCard(){
        
        //Share action sheet
        let activityVC = UIActivityViewController(activityItems: [CardView().toPNG()], applicationActivities: nil)
           let scenes = UIApplication.shared.connectedScenes
           let windowScene = scenes.first as? UIWindowScene
            
           windowScene?.keyWindow?.rootViewController?.present(activityVC, animated: true, completion: nil)
        
        //groups all in one object card (image,emotion,card info)
    }
    
    //savePhoto
    
    //
    
    
    
    
    func createEmotion(emotion:Emotion){
        
        if(savedEmotion[0] != nil && savedEmotion[1] != nil && savedEmotion[2] != nil && savedEmotion[3] != nil && savedEmotion[4] != nil){
        
            //Salva informazioni in qualcosa (Db locale,File,Array)
            print(savedEmotion)
        }
        else
        {
            print("Devono essere selezionate tutte le emozioni")
        }
    }
    
    func addEmotion(emotion: Emotion){
        
        if(emotion.color == calmEmotion.color ||
               emotion.color == quiteCalmEmotion.color ||
               emotion.color == NormalColorCalmEnergizedEmotion.color ||
               emotion.color == quiteEnergizedEmotion.color ||
               emotion.color == energizedEmotion.color){
            
            savedEmotion[0] = emotion
          
        }
        
        if(emotion.color == insecureEmotion.color ||
               emotion.color == quiteInsecureEmotion.color ||
               emotion.color == InsecureSelfConfidentNormalEmotion.color ||
               emotion.color == quiteSelfConfidentEmotion.color ||
               emotion.color == selfConfidentEmotion.color){
            
            savedEmotion[2] = emotion
          
        }
        
        
        if(emotion.color == relaxedEmotion.color ||
               emotion.color == quiteRelaxedEmotion.color ||
               emotion.color == RelaxedStressedNormalEmotion.color ||
               emotion.color == quiteStressedEmotion.color ||
               emotion.color == stressedEmotion.color){
            
            savedEmotion[3] = emotion
          
        }
        
        if(emotion.color == distractedEmotion.color || emotion.color == quiteDistractedEmotion.color || emotion.color == distractedFocusedNormalEmotion.color || emotion.color == quiteFocusedEmotion.color || emotion.color == focusedEmotion.color)
        {
            savedEmotion[4] = emotion
        }
            
            
        //Manual Testing
        print("Calm - Energized Selected : \(String(describing: savedEmotion[0]?.color))")
        print("Insecure - SelfConfident Selected : \(String(describing: savedEmotion[2]?.color))")
        print("Relaxed - Stressed Selected : \(String(describing: savedEmotion[3]?.color))")
        print("Distracted - Focused Selected : \(String(describing: savedEmotion[4]?.color))")
        print("\n")
            
            
        }
        
        
        
        
    }

 
    

