//
//  CoreDataCardModel.swift
//  TestApp2
//
//  Created by Michele Zurlo on 26/10/22.
//

import Foundation
import CoreData
import SwiftUI

class CoreDataCardModel: ObservableObject{
    
    
    let container = NSPersistentContainer(name: "CoreDataModel")
    
    var savedEmotion: Array<EmotionCoreDataEntity?> = Array(repeating: nil, count: 5)
    
    
    
    init(){
        container.loadPersistentStores{descri, error in
            if let error = error{
                print("Failed to load data \(error.localizedDescription)")
            }
        }
    }
    
    func saveDB(context: NSManagedObjectContext){
        
        do{
            try context.save()
            print("Data saved")
            
            
        }catch{
            print("WE COULD NOT SAVE DATA")
        }
    }
    
    func saveData(songOfTheDay: String,thoughtOfTheDay: String , context: NSManagedObjectContext){
        
        let card = CardCoreDataEntity(context: context)
        
       // let emotion: [EmotionCoreDataEntity] = EmotionCoreDataEntity(context: context)
        card.id = UUID()
        card.cardDate = Date.getCurrentDate()
        card.songOfTheDay = songOfTheDay
        card.thoughtOfTheDay = thoughtOfTheDay
        
        
        
        saveDB(context: context)
      
    }
    
    func addEmotion(emotion: Emotion){
        
        if(emotion.color == calmEmotion.color ||
           emotion.color == quiteCalmEmotion.color ||
           emotion.color == NormalColorCalmEnergizedEmotion.color ||
           emotion.color == quiteEnergizedEmotion.color ||
           emotion.color == energizedEmotion.color){
            
           savedEmotion[0]?.size = Float(emotion.size!)
            
        }
        
        if(emotion.color == insecureEmotion.color ||
           emotion.color == quiteInsecureEmotion.color ||
           emotion.color == InsecureSelfConfidentNormalEmotion.color ||
           emotion.color == quiteSelfConfidentEmotion.color ||
           emotion.color == selfConfidentEmotion.color){
            
            savedEmotion[2]?.size = Float(emotion.size!)
            
        }
        
        
        if(emotion.color == relaxedEmotion.color ||
           emotion.color == quiteRelaxedEmotion.color ||
           emotion.color == RelaxedStressedNormalEmotion.color ||
           emotion.color == quiteStressedEmotion.color ||
           emotion.color == stressedEmotion.color){
            
            savedEmotion[3]?.size = Float(emotion.size!)
            
        }
        
        if(emotion.color == distractedEmotion.color || emotion.color == quiteDistractedEmotion.color || emotion.color == distractedFocusedNormalEmotion.color || emotion.color == quiteFocusedEmotion.color || emotion.color == focusedEmotion.color)
        {
            savedEmotion[4]?.size = Float(emotion.size!)
        }
        
        
        //Manual Testing
        print("Calm - Energized Selected : \(String(describing: savedEmotion[0]?.size))")
        print("Insecure - SelfConfident Selected : \(String(describing: savedEmotion[2]?.size))")
        print("Relaxed - Stressed Selected : \(String(describing: savedEmotion[3]?.size))")
        print("Distracted - Focused Selected : \(String(describing: savedEmotion[4]?.size))")
        print("\n")
        
        
    }
    
    
    func saveEmotions() -> Bool{
        
        print(savedEmotion)
        if(savedEmotion[0] != nil && savedEmotion[2] != nil && savedEmotion[3] != nil && savedEmotion[4] != nil){
            
            //Salva informazioni in qualcosa (Db locale,File,Array)
        print(savedEmotion)
            
            return true
        }
        else
        {
            print("Devono essere selezionate tutte le emozioni")
            return false
            
        }
    }
    
}
