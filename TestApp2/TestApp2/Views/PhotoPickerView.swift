//
//  PhotoPickerView.swift
//  TestApp2
//
//  Created by Michele Zurlo on 22/10/22.
//

import SwiftUI
import PhotosUI

struct PhotoPickerView: View {
    
    @ObservedObject var cardModel: CardModel
    
    var body: some View {
        CircularPhotoImage(imageState: cardModel.imageState)
            .overlay(alignment: .bottomTrailing){
                PhotosPicker(selection: $cardModel.imageSelection,
                             matching: .any(of: [.images]),
                             photoLibrary: .shared()){
                    Image(systemName: "plus")
                        .frame(width: 60, height: 60)
                        .foregroundColor(.white)
                        .background(Color.gray)
                        .clipShape(Circle())
                    
                }.buttonStyle(.borderless)
            }
    }
}

struct CircularPhotoImage: View{
    let imageState: CardModel.ImageState
    
    var body: some View{
        ProfileImage(imageState: imageState)
            .frame(width: 200,height: 200)
            .clipShape(Circle())
            .background {
                Circle().fill(
                LinearGradient(
                    colors: [.yellow, .orange],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
                
            }
    }
}


struct ProfileImage: View{
    
    let imageState: CardModel.ImageState
    
    var body: some View{
        switch imageState {
        case .success(let image):
            image.resizable().scaledToFit()
        case .loading:
            ProgressView()
        case .empty:
            Image(systemName: "camera")
                .font(.system(size:40))
                .foregroundColor(.white)
        case .failure:
            Image(systemName: "exclamationmark.triangle.fill")
                .font(.system(size:40))
                .foregroundColor(.white)
        }
    }
    
}



struct PhotoPickerView_Previews: PreviewProvider {
    static var previews: some View {
        let cardModel: CardModel = CardModel()
        PhotoPickerView(cardModel: cardModel )
    }
}
