//
//  ContentView.swift
//  waste_classify
//
//  Created by Mily Mendez on 11/27/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Color.green
                .ignoresSafeArea()
                .overlay(
                    VStack {
                        // Image by bqlqn
                        Image("Image")
                            .resizable()
                            .frame(width: 100, height: 100)
                        Text("Welcome to WasteOrNot")
                            .font(.system(size: 50))
                            .foregroundColor(Color.white)
                        
                        NavigationLink(destination: PhotoPicker()) {
                            Text("Go to classify your images")
                                .padding(10)
                                .frame(width:200, height:100, alignment: .center).background(Color.blue)
                                .foregroundColor(Color.white)
                                .cornerRadius(50)
                        }
                    })
            //.padding()
        }
        
    }
}

#Preview {
    ContentView()
}
