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
        
        card.id = UUID()
        card.songOfTheDay = songOfTheDay
        card.thoughtOfTheDay = thoughtOfTheDay
        
        saveDB(context: context)
      
    }
    
}
