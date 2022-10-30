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
    var currentCard: Card? = nil
    @Published var cardEmotion: Array<Emotion?> = Array(repeating: nil, count: 5)
    @FetchRequest(sortDescriptors: [SortDescriptor(\.id, order: .reverse)]) var cardData: FetchedResults<CardCoreDataEntity>
    
    //@Published var allCardData = [CardCoreDataEntity]()
    @Published var cardDataEntity = [Card]()
    
    var savedEmotion: Array<Emotion?> = Array(repeating: nil, count: 5)
  
    @Published var imageDB: Data = .init(count: 0)

    var currentCardCalendar: Card?
    
    var emotionsDB = [EmotionCoreDataEntity]()
   
    
    let container = NSPersistentContainer(name: "DBCoreData")
    
    init(){
        container.loadPersistentStores{descri, error in
            if let error = error{
                print("Failed to load data \(error.localizedDescription)")
            }
        }
        
      //  fetchCardData()
    }
    /*
    func fetchCardData(){
        
        cardDataEntity = Card.sample
        
        print(cardDataEntity)
       
    }
     */
    
    
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
                    self.imageDB = data
                    
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
         */
        
        //group all in one object card (image,emotion,card info)
        
         
        
        currentCard = Card(date: Date(),image: image,songOfTheDay: songOfTheDay,thoughtOfTheDay: thoughtOfTheDay,emotions: savedEmotion)
        

        //DB save
        
        let cardDB = CardCoreDataEntity(context: context)
        
        let emotionDB = EmotionCoreDataEntity(context: context)
        let emotionDB2 = EmotionCoreDataEntity(context: context)
        
        emotionDB.color = "InsecureColor"
        emotionDB2.color = "StressedColor"
        
     
        
  
         
        
        cardDB.id = UUID()
        cardDB.cardDate = currentCard!.date
        cardDB.songOfTheDay = currentCard?.songOfTheDay
        cardDB.thoughtOfTheDay = currentCard?.thoughtOfTheDay
        cardDB.imageOfTheCard = imageDB
        
        
        //cardDB.emotion.append(emotionDB)
        
       // cardDB.emotion.append(emotionDB2)
        
    
    
    
       // emotionsDB[0].id = UUID()
       // emotionsDB[0].size = CGFloat(savedEmotion[0]?.size)
        //emotionsDB[0].color = savedEmotion[0]?.color.description
        
        saveDB(context: context)
        
        print("Current Card:   \(String(describing: currentCard))")
        
        //print("Emotion DB Array:   \(emotionsDB)")
    }
    
    func saveDB(context: NSManagedObjectContext){
        
        do{
            try context.save()
            print("Data saved")
            
        }catch{
            print("WE COULD NOT SAVE DATA")
        }
    }
    
    
    func saveCurrentCardCalendar(card: Card){
        
        self.currentCardCalendar = card
        
        print("Card appena selezionata: \(String(describing: currentCardCalendar))")
        
    }
    
    func saveEmotions(context: NSManagedObjectContext) -> Bool{
        
        print(savedEmotion)
        if(savedEmotion[0] != nil && savedEmotion[2] != nil && savedEmotion[3] != nil && savedEmotion[4] != nil){
            
            //Salva informazioni in qualcosa (Db locale,File,Array)
             print("Saved emotion array:   \(savedEmotion)")
            
            //Create emotion  DB Istance
          
            //var savedEmotion: Array<Emotion?> = Array(repeating: nil, count: 5)
  
           // var emoDB: [EmotionCoreDataEntity] = []
            
            
           // saveDB(context: context)
            
            //print("Emotion DB Array:   \(emotionsDB)")
            
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
            
            
            
            //emotionsDB[0]?.id = UUID()
            // emotionsDB[0]?.size = emotion.size
            //emotionsDB[0]?.color = emotion.color.description
            
            
        }
        
        //Only for test , it should be cheerful sensitive
        if(emotion.color == insecureEmotion.color ||
           emotion.color == quiteInsecureEmotion.color ||
           emotion.color == InsecureSelfConfidentNormalEmotion.color ||
           emotion.color == quiteSelfConfidentEmotion.color ||
           emotion.color == selfConfidentEmotion.color){
            
            savedEmotion[1] = emotion
            
            // emotionsDB[1]?.id = UUID()
            //emotionsDB[1]?.size = emotion.size
            // emotionsDB[1]?.color = emotion.color.description
            
        }
        
        if(emotion.color == insecureEmotion.color ||
           emotion.color == quiteInsecureEmotion.color ||
           emotion.color == InsecureSelfConfidentNormalEmotion.color ||
           emotion.color == quiteSelfConfidentEmotion.color ||
           emotion.color == selfConfidentEmotion.color){
            
            savedEmotion[2] = emotion
            
            // emotionsDB[2]?.id = UUID()
            //  emotionsDB[2]?.size = emotion.size
            //emotionsDB[2]?.color = emotion.color.description
            
        }
        
        
        if(emotion.color == relaxedEmotion.color ||
           emotion.color == quiteRelaxedEmotion.color ||
           emotion.color == RelaxedStressedNormalEmotion.color ||
           emotion.color == quiteStressedEmotion.color ||
           emotion.color == stressedEmotion.color){
            
            savedEmotion[3] = emotion
            
            // emotionsDB[3]?.id = UUID()
            // emotionsDB[3]?.size = emotion.size
            // emotionsDB[3]?.color = emotion.color.description
            
        }
        
        if(emotion.color == distractedEmotion.color || emotion.color == quiteDistractedEmotion.color || emotion.color == distractedFocusedNormalEmotion.color || emotion.color == quiteFocusedEmotion.color || emotion.color == focusedEmotion.color)
        {
            savedEmotion[4] = emotion
            
            // emotionsDB[4]?.id = UUID()
            //  emotionsDB[4]?.size = emotion.size
            //  emotionsDB[4]?.color = emotion.color.description
        }
        
        
        //Manual Testing
        print("Calm - Energized Selected : \(String(describing: savedEmotion[0]?.color))")
        print("Insecure - SelfConfident Selected : \(String(describing: savedEmotion[2]?.color))")
        print("Relaxed - Stressed Selected : \(String(describing: savedEmotion[3]?.color))")
        print("Distracted - Focused Selected : \(String(describing: savedEmotion[4]?.color))")
        print("\n")
        
        
        //print("Emotion DB Array:   \(emotionsDB)")
    }
    
   
    
}

