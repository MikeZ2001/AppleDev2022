//
//  ImagePickerAndPhotoView.swift
//  TestApp2
//
//  Created by Michele Zurlo on 22/10/22.
//

import SwiftUI
import PhotosUI

struct ImagePickerAndPhotoView: View {
    
    @State var selectedItems: [PhotosPickerItem] = []
    @State var data: Data?
    
    var body: some View {
        /*
        ZStack (alignment: .bottomTrailing){
            Button (action: {
               
            }, label: {
                Image(systemName: "camera")
                    .resizable()
                    .frame(width: 120,height:120)
                    .clipShape(Circle())
        })
            
            Image(systemName: "plus")
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .background(Color.gray)
                .clipShape(Circle())
            
            
            
        
        }
         */
        
        VStack{
            
            if let data = data,let uiImage = UIImage(data: data){
                Image(uiImage: uiImage)
                    .resizable()
                
            }
            
            Spacer()
            PhotosPicker(
                selection: $selectedItems,
                maxSelectionCount: 1,
                matching: .images
               
            ) {
                
                Text("Pick a photo")
               
                Button {
                } label: {
                  Text("Pick a photo ")
                }
                .controlSize(.large)
                .buttonStyle(.bordered)
            }
                    
            }
        .onChange(of: selectedItems) { newValue in
                guard let item = selectedItems.first else{
                    return
                }
                item.loadTransferable(type: Data.self) { result in
                    switch result{
                    case .success(let data):
                        if let data = data {
                            self.data = data
                        } else{
                            print("data is nil")
                        }
                    case .failure(let failure):
                        fatalError("\(failure)")
                    }
                }
            }
        }

    }


struct ImagePickerAndPhotoView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePickerAndPhotoView()
    }
}

