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
import CoreData
import UIKit

class CardModel: ObservableObject{
    
    //Properties of the card
    var currentCard: Card?
    @Published var cardEmotion: Array<Emotion?> = Array(repeating: nil, count: 5)
    
    var savedEmotion: Array<Emotion?> = Array(repeating: nil, count: 5)
    
    
    //ViewModel for the PhotosUI
    enum ImageState {
        case empty
        case success(Image)
        //case loading(Progress)
        //case failure(Error)
    }
    @Published var imageState: ImageState = .empty
    
    @Published var image: Image = Image(systemName: "camera")
    @Published var imageSelection: PhotosPickerItem?{
        didSet{
            if let imageSelection{
                Task{
                    try await loadTransferable(from: imageSelection)
                }
            }
        }
    }
    
    
    //Function for the PhotosUI
    
    func loadTransferable(from imageSelection: PhotosPickerItem?) async throws{
        do{
            if let data = try await imageSelection?.loadTransferable(type: Data.self){
                if let uiImage = UIImage(data: data){
                    self.image = Image(uiImage: uiImage)
                    
                    //take information of the photo
                    imageState = .success(image)
                }
            }
        } catch{
            print(error.localizedDescription)
            
        }
    }
    
    
    //Function for the emotion sheet
    func saveCard(songOfTheDay: String,thoughtOfTheDay: String , context: NSManagedObjectContext){
        
        /*
        //Share action sheet
        let activityVC = UIActivityViewController(activityItems: [CardView().toPNG()], applicationActivities: nil)
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        
        windowScene?.keyWindow?.rootViewController?.present(activityVC, animated: true, completion: nil)
        
        //group all in one object card (image,emotion,card info)
         */
        
        currentCard = Card(date: Date.getCurrentDate(),image: image,songOfTheDay: songOfTheDay,thoughtOfTheDay: thoughtOfTheDay,emotions: savedEmotion)
        

        //DB save
        
        let cardDB = CardCoreDataEntity(context: context)
        
        cardDB.id = UUID()
        cardDB.cardDate = currentCard?.date
        cardDB.songOfTheDay = currentCard?.songOfTheDay
        cardDB.thoughtOfTheDay = currentCard?.thoughtOfTheDay
        
        saveDB(context: context)
        
        print("Current Card:   \(String(describing: currentCard))")
    }
    
    func saveDB(context: NSManagedObjectContext){
        
        do{
            try context.save()
            print("Data saved")
            
            
        }catch{
            print("WE COULD NOT SAVE DATA")
        }
    }
    
    
    func saveEmotions(context: NSManagedObjectContext) -> Bool{
        
        print(savedEmotion)
        if(savedEmotion[0] != nil && savedEmotion[2] != nil && savedEmotion[3] != nil && savedEmotion[4] != nil){
            
            //Salva informazioni in qualcosa (Db locale,File,Array)
            
            //Create emotion  DB Istance
            var i: Int = 0
            
            var emotionsDB: Array<EmotionCoreDataEntity?> = Array(repeating: nil, count: 5)
            
            for emotion in savedEmotion {
                
               // emotionsDB[2]?.size = Float(emotion.size!)
                
                i = i+1
            }
            //Save Emotion Array in DB
            
            
            saveDB(context: context)
            
        print(savedEmotion)
            
            return true
        }
        else
        {
            print("Devono essere selezionate tutte le emozioni")
            return false
            
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

extension Date {

 static func getCurrentDate() -> String {

        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = "dd/MM/yyyy"

        return dateFormatter.string(from: Date())

    }
}
    
