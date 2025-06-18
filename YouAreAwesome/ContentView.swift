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
    @State private var lastImageNumber = -1
    @State private var lastMessageNumber = -1


    
    var body: some View {
        VStack {
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .multilineTextAlignment(.center)
                .frame(height: 120)
                .minimumScaleFactor(0.5)
                .animation(.easeIn(duration: 0.2), value: message)
                
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
                .animation(.easeInOut(duration: 0.2), value: imageName)

            Spacer()
            
            Button("Show Messsage") {
                var messageNumber = 0
                var imageNumber = 0
                let messages : [String] = ["You are Awesome!", "You are Great!","You are Amazing", "You Rock", "God's got you", "Exceptional is your middle name!"]
                
                repeat {
                    messageNumber = Int.random(in: 0...messages.count-1 )
               
                } while messageNumber == lastMessageNumber
                lastMessageNumber = messageNumber
                
                repeat {
                    imageNumber = Int.random(in: 0...9)
                } while imageNumber == lastImageNumber
                lastImageNumber = imageNumber
            
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
