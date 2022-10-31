//
//  SingleImagePickerView.swift
//  TestApp2
//
//  Created by Michele Zurlo on 23/10/22.
//

import SwiftUI
import PhotosUI

struct SingleImagePickerView: View {
    
    //@EnvironmentObject var cardModel: CardModel
    @StateObject var cardModel: CardModel
    
    var body: some View {
        VStack{
        
            UserPhotoOfTheDay(imageState: cardModel.imageState)
                .overlay(alignment: .bottomTrailing){
                    PhotosPicker(selection: $cardModel.imageSelection,
                                 matching: .any(of: [.images]),
                                 photoLibrary: .shared()){
                        Image(systemName: "plus")
                            .frame(width: 40, height: 40)
                            .foregroundColor(.white)
                            .background(Color.gray)
                            .clipShape(Circle())
                        
                    }.buttonStyle(.borderless)
                }
            }
            
            
        }
    }

struct UserPhotoOfTheDay: View{
    let imageState: CardModel.ImageState
    
    var body: some View{
        UserImageStates(imageState: imageState)
            .frame(width: 151,height: 201)
            .clipShape(Rectangle())
            .background {
                
                Rectangle().fill(
                    LinearGradient(
                                       colors: [.yellow, .orange],
                                       startPoint: .top,
                                       endPoint: .bottom
                                   )
                    //Color(red: 1, green: 1, blue: 1).opacity(0.42)
            )
                .cornerRadius(14)
                
            }
    }
}

struct UserImageStates: View{
    
    let imageState: CardModel.ImageState
    
    var body: some View{
        switch imageState {
        case .success(let image):
            image.resizable().scaledToFill()
       // case .loading:
         //   ProgressView()
        case .empty:
            Image(systemName: "camera")
                .font(.system(size:40))
                .foregroundColor(.white)
   
        }
    }
    
}


struct SingleImagePickerView_Previews: PreviewProvider {
    static var previews: some View {
        SingleImagePickerView(cardModel: CardModel()).environmentObject(CardModel())
    }
}
