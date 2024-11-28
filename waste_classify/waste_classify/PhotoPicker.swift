//
//  PhotoPicker.swift
//  waste_classify
//
//  Created by Mily Mendez on 11/27/24.
//

import SwiftUI
import PhotosUI

@MainActor
final class PhotoPickerViewModel: ObservableObject {
    @Published private(set) var selectedImage: UIImage? = nil
    @Published var imageSelection: PhotosPickerItem? = nil {
        didSet {
            setImage(from: imageSelection)
        }
    }
    private func setImage(from selection: PhotosPickerItem?) {
        guard let selection else {return}
        Task {
            if let data = try? await selection.loadTransferable(type: Data.self) {
                if let uiImage = UIImage(data: data) {
                    selectedImage = uiImage
                    return
                }
            }
        }
    }
    
}

struct PhotoPicker: View {
    @StateObject private var viewModel = PhotoPickerViewModel()
    var body: some View {
        VStack(spacing:40) {
            if let image = viewModel.selectedImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width:200, height:200)
                    .cornerRadius(20)
                    
            }
            PhotosPicker(selection: $viewModel.imageSelection) {
                Text("Pick your photo to classify")
                    .foregroundColor(.blue)
                
            }
        }
    }
}

#Preview {
    PhotoPicker()
}
