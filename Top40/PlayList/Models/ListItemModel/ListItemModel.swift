//
//  ListItemModel.swift
//  Top40
//
//  Created by Simon Schöpke on 04.03.21.
//

import SwiftUI
import AVFoundation

struct ListItemModel {
    let song: Top40
    static var sharedPlayer: AVPlayer?
    private let player: AVPlayer
    @Binding private var selection: Top40?
    
    private var test = false
    
    var isPlaying: Bool {
        return Optional(song) == selection
    }
    
    init(song: Top40, selection: Binding<Top40?>) {
        self.song = song
        self._selection = selection
        self.player = AVPlayer(url: URL(string: song.iTunesLink)!)
    }
    
    mutating func play() {
        pause()
        selection = song
        ListItemModel.sharedPlayer = player
        ListItemModel.sharedPlayer?.play()
    }
    
    mutating func pause() {
        ListItemModel.sharedPlayer?.seek(to: CMTime.zero)
        ListItemModel.sharedPlayer?.pause()
        selection = nil
    }
}
