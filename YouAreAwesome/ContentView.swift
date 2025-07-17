//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Raemur Bedward on 2025-05-29.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    @State private  var message = ""
    @State private  var imageName = ""
    @State private var lastImageNumber = -1
    @State private var lastMessageNumber = -1
    @State private var audioPlayer: AVAudioPlayer! //implicitly unwrapping an optional
    @State private var lastSoundNumber = -1
    let numberOfImages = 10
    let numberofSounds = 6
    
    
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
               var soundName = ""
                let messages : [String] = ["You are Awesome!", "You are Great!","You are Amazing", "You Rock", "God's got you", "Exceptional is your middle name!"]

                lastMessageNumber = nonRepeatingRandom(lastNumber: lastMessageNumber, upperBonds: messages.count-1)
               
                
                lastImageNumber = nonRepeatingRandom(lastNumber: lastImageNumber, upperBonds: numberOfImages-1)
            
                message = messages[lastMessageNumber]
                imageName = "image" + String(lastImageNumber)

                lastSoundNumber = nonRepeatingRandom(lastNumber: lastSoundNumber, upperBonds: numberofSounds-1)
                soundName = "sound\(lastSoundNumber)"
                
                guard let soundFile = NSDataAsset(name: soundName) else {
                    print("😡 Could not read file named \(soundName)")
                    return
                }
                do {
                    audioPlayer = try AVAudioPlayer(data: soundFile.data)
                    audioPlayer.play()
                    
                } catch {
                    print("😡 ERROR: \(error.localizedDescription) creating audioPlayer")
                }
              
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
            
        }
        .padding()
    }
    func nonRepeatingRandom(lastNumber: Int, upperBonds: Int) -> Int {
        var randomNumber: Int
        repeat {
            randomNumber = Int.random(in: 0...upperBonds)
        }while randomNumber == lastNumber
        
        return randomNumber
    }
}

#Preview {
    ContentView()
}
