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
  
    
    func saveCard(){
        
        /*
        //Share action sheet
        let activityVC = UIActivityViewController(activityItems: [CardView().toPNG()], applicationActivities: nil)
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        
        windowScene?.keyWindow?.rootViewController?.present(activityVC, animated: true, completion: nil)
        
        //group all in one object card (image,emotion,card info)
         */
        
        currentCard = Card(date: "24/12/2020",image: image,songOfTheDay: "ascjkbnanc",thoughtOfTheDay: "dasdsf",emotions: savedEmotion)
        
        print("Current Card:   \(String(describing: currentCard))")
    }
    
    func createEmotion(){
        
        print(savedEmotion)
        if(savedEmotion[0] != nil && savedEmotion[2] != nil && savedEmotion[3] != nil && savedEmotion[4] != nil){
            
            //Salva informazioni in qualcosa (Db locale,File,Array)
            
            self.cardEmotion = savedEmotion
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
    
