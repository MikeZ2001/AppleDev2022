//
//  ImagePickerViewModel.swift
//  TestApp2
//
//  Created by Michele Zurlo on 23/10/22.
//

import SwiftUI
import PhotosUI

//We will use this class to pick a photo from our library transform it and assign it to an image to be displayed in the card

class Ciao: ObservableObject{
    
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
}
