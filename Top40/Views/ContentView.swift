//
//  ContentView.swift
//  Top40
//
//  Created by Pieter Bikkel on 18/02/2021.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
//    @State var player = AVPlayer()
    
//    @ObservedObject private var categoryClass = CurrentCategory()
    
    @State private var currentCategory = Category.top40List
    
    var body: some View {
        HStack{
            Text("TOP 40")
                .fontWeight(.heavy)
            Button {
                print("settings")
            } label: {
                Image(systemName: "gearshape")
                    .foregroundColor(Color("almostBlack"))
                    .font(.system(size: 24, weight: .regular))
            }

        }.padding(.horizontal)
        .multilineTextAlignment(.center)
        .font(.largeTitle)
        .padding(.vertical, 10)
        .foregroundColor(.red)
        
        NavigationView() {
            VStack {
                HStack {
                    Text("Categorieën")
                        .foregroundColor(Color("almostBlack"))
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                }.padding(.horizontal)
                
                CategoriesView($currentCategory)
                    .padding()
                
                HStack {
                    
                    Text(currentCategory.rawValue.name)
                        .foregroundColor(Color("almostBlack"))
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                    
                    Button {
                        print(currentCategory.rawValue.url)
                    } label: {
                        Image(systemName: "ellipsis")
                            .foregroundColor(Color("almostBlack"))
                            .font(.title)
                    }
                }
                .padding(.horizontal, 20)
                
                PlayList(category: currentCategory)
                
                .padding(0)
            }
            .navigationBarHidden(true)
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

struct ListItemView: View {
    
    @State var isPlaying = false
    @State var playingID = "0"
    @State var player: AVPlayer
    var song: Top40
    var defaultOption = ""
    
    var body: some View {
        HStack() {
            ZStack {
                Circle()
                    .foregroundColor(.red)
                    .frame(width: 40, height: 40)
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 1, x: 0, y: 4)
                Text(song.position)
                    .foregroundColor(.white)
                    .font(.system(size: 20))
                    .fontWeight(.bold)
            }
            VStack {
                Text(song.title)
                    .fontWeight(.bold)
                    .frame(width: UIScreen.screenWidth * 0.52, alignment: .leading)
                Text(song.artist)
                    .frame(width: UIScreen.screenWidth * 0.52, alignment: .leading)
            }
            .foregroundColor(Color("almostBlack"))
            .lineLimit(1)
            .multilineTextAlignment(.leading)
            VStack {
                HStack {
                    if (song.piek != "piek") {
                        Image(systemName: "rosette")
                            .frame(width: 20, alignment: .leading)
                        Text(song.piek)
                    } else {
                        
                    }
                }
                .frame(width: 50, alignment: .leading)
                HStack {
                    Image(systemName: "calendar")
                        .frame(width: 20, alignment: .leading)
                    Text(song.amountOfWeeks)
                }
                .frame(width: 50, alignment: .leading)
            }
            .multilineTextAlignment(.leading)
            Button {
                playMusic()
            } label: {
                Image(systemName: playingID == song.position && isPlaying ? "pause.fill" : "play.fill")
                    .foregroundColor(Color("almostBlack"))
                    .font(.title)
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 1, x: 0, y: 4)
                    .frame(width: 30)
            }
        }.padding(.vertical, 10)
    }
    
    func playMusic() {
        if playingID != song.position {
            player.pause()
            isPlaying.toggle()
            player = AVPlayer(playerItem: AVPlayerItem(url: URL(string: song.iTunesLink)!))
            playingID = song.position
            player.play()
        } else {
            playPause()
        }
    }
    
    func playPause() {
        isPlaying.toggle()
        if isPlaying {
            player.play()
        } else {
            player.pause()
        }
    }
}

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   //static let screenHeight = UIScreen.main.bounds.size.height
   //static let screenSize = UIScreen.main.bounds.size
}

extension AVPlayer {
    var isPlayingEX: Bool {
        return rate != 0 && error == nil
    }
}
