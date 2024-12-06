//
//  PhotoPicker.swift
//  waste_classify
//
//  Created by Mily Mendez on 11/27/24.
//

import SwiftUI
import PhotosUI
import CoreML
/*
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
*/


struct PhotoPicker: View {
    let photos = ["Metal", "Paper", "Water_Bottle", "Waste", "Cardboard"]
    @State private var currentIndex: Int = 0;
    let model = WasteClassifierML()
    @State private var classificationLabel: String = ""

   
    var body: some View {
        VStack {
            /*
             @StateObject private var viewModel = PhotoPickerViewModel()
             if let image = viewModel.selectedImage {
             Image(uiImage: image)
             .resizable()
             .scaledToFill()
             .frame(width:200, height:200)
             .cornerRadius(20)
             
             }
             */
            Image(photos[currentIndex])
                .resizable()
                .frame(width:200, height:200)
            VStack {
                HStack {
                    Button("Back") {
                        if self.currentIndex >= self.photos.count {
                            self.currentIndex = self.currentIndex - 1
                        } else {
                            self.currentIndex = 0
                        }
                    }
                    .padding()
                    .foregroundColor(Color.white)
                    .background(Color.blue)
                    
                    Button("Next") {
                        if self.currentIndex < self.photos.count - 1 {
                            self.currentIndex = self.currentIndex + 1
                        } else {
                            self.currentIndex = 0
                        }
                    }
                    .padding()
                    .foregroundColor(Color.white)
                    .background(Color.pink)
                    Button("Classify") {
                        // Code later
                    }
                    .padding()
                    .foregroundColor(Color.white)
                    .background(Color.green)
                    
                }
                
                Text("Classification result: ")
                    .padding()
                    .font(.body)
                
                /*
                 PhotosPicker(selection: $viewModel.imageSelection) {
                 Text("Pick your photo to classify")
                 .foregroundColor(.blue)
                 }
                 */
            }
            Spacer()
        }
    }
    private func classifyImage() {
        // Almost there
    }
}

#Preview {
    PhotoPicker()
}
