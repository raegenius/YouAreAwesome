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
    @State private var messageNumber = 0
    
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
                .multilineTextAlignment(.center)
            Spacer()
            
            Button("Show Messsage") {
                var messages : [String] = ["You are Awesome!", "You are Great!"]
                messages += ["You are Amazing", "You Rock", "God's got you", "Exceptional is your middle name!"]
                imageNumber += 1
                
                if imageNumber == 9 {
                    imageNumber = 0
                    
                }
                messageNumber += 1
                if messageNumber == messages.count {
                    messageNumber = 0
                    
                }
                message = messages[messageNumber]
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
