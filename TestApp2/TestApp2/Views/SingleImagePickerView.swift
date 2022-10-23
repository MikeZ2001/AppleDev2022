//
//  SingleImagePickerView.swift
//  TestApp2
//
//  Created by Michele Zurlo on 23/10/22.
//

import SwiftUI
import PhotosUI

struct SingleImagePickerView: View {
    
    @StateObject var imagePickerViewModel = ImagePickerViewModel()
    
    var body: some View {
        VStack{
        
            UserPhotoOfTheDay(imageState: imagePickerViewModel.imageState)
                .overlay(alignment: .bottomTrailing){
                    PhotosPicker(selection: $imagePickerViewModel.imageSelection,
                                 matching: .any(of: [.images]),
                                 photoLibrary: .shared()){
                        Image(systemName: "plus")
                            .frame(width: 50, height: 50)
                            .foregroundColor(.white)
                            .background(Color.gray)
                            .clipShape(Circle())
                        
                    }.buttonStyle(.borderless)
                }
            }
            
            
        }
    }

struct UserPhotoOfTheDay: View{
    let imageState: ImagePickerViewModel.ImageState
    
    var body: some View{
        UserImageStates(imageState: imageState)
            .frame(width: 200,height: 220)
            .clipShape(Rectangle())
            .background {
                Rectangle().fill(
                LinearGradient(
                    colors: [.yellow, .orange],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
                
            }
    }
}

struct UserImageStates: View{
    
    let imageState: ImagePickerViewModel.ImageState
    
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
        //case .failure:
           // Image(systemName: "exclamationmark.triangle.fill")
             //   .font(.system(size:40))
               // .foregroundColor(.white)
        }
    }
    
}


struct SingleImagePickerView_Previews: PreviewProvider {
    static var previews: some View {
        SingleImagePickerView()
    }
}
