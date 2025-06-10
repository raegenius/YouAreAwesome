//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Raemur Bedward on 2025-05-29.
//

import SwiftUI

struct ContentView: View {
    @State private  var message = ""
    @State private  var imageName = ""
    @State private var imageNumber = 0
    var body: some View {
        VStack {
            Spacer()
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
            Spacer()
            
            Button("Show Messsage") {
                let message1 = "You are Awesome!"
                let message2 = "You are Great!"
                imageNumber += 1
                
                if imageNumber == 9 {
                    imageNumber = 0
                    
                }
                
                message = (message == message1 ? message2 : message1)
                imageName = "image" + String(imageNumber)
                
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
