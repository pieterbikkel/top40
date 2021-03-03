//
//  ListItem.swift
//  Top40
//
//  Created by Simon Schöpke on 02.03.21.
//

import SwiftUI
import AVFoundation

struct ListItem: View {
    private static var sharedPlayer: AVPlayer?
    private let player: AVPlayer
    let song: Top40
    @Binding var selection: Top40?
    
    private var isPlaying: Bool {
        return Optional(song) == selection
    }
    
    init(song: Top40, selection: Binding<Top40?>) {
        self.song = song
        self._selection = selection
        player = AVPlayer(url: URL(string: song.iTunesLink)!)
    }
    
    var body: some View {
        HStack {
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
                    .frame(width: UIScreen.width * 0.52, alignment: .leading)
                Text(song.artist)
                    .frame(width: UIScreen.width * 0.52, alignment: .leading)
            }
            .foregroundColor(Color("almostBlack"))
            .lineLimit(1)
            .multilineTextAlignment(.leading)
            
            Spacer()
            
            HStack {
                VStack {
                    HStack {
                        if (song.piek != "piek") {
                            Image(systemName: "rosette")
                                .frame(width: 20, alignment: .leading)
                            Text(song.piek)
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
                
                Button { togglePlay() } label: {
                    Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                        .foregroundColor(Color("almostBlack"))
                        .font(.title)
                        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 1, x: 0, y: 4)
                        .frame(width: 30)
                }
            }
        }
        .padding(.vertical, 10)
    }
    
    private func togglePlay() {
        isPlaying ? pause() : play()
    }
    
    private func play() {
        pause()
        selection = song
        ListItem.sharedPlayer = player
        ListItem.sharedPlayer?.play()
        NotificationCenter.default.addObserver(
            forName: .AVPlayerItemDidPlayToEndTime,
            object: ListItem.sharedPlayer?.currentItem,
            queue: .current,
            using: didEndPlaying)
    }
    
    private func pause() {
        NotificationCenter
            .default
            .removeObserver(ListItem.sharedPlayer?.currentItem as Any)
        ListItem.sharedPlayer?.seek(to: CMTime.zero)
        ListItem.sharedPlayer?.pause()
        selection = nil
    }
    
    private func didEndPlaying(notification: Notification) {
        pause()
    }
}

