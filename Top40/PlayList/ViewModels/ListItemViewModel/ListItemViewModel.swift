//
//  ListItemViewModel.swift
//  Top40
//
//  Created by Simon Schöpke on 04.03.21.
//

import SwiftUI

class ListItemViewModel: ObservableObject {
    @Published private var listItem: ListItemModel
    
    init(song: Top40, selection: Binding<Top40?>) {
        self.listItem = ListItemModel(song: song, selection: selection)
    }
    
    var song: Top40 {
        return listItem.song
    }
    
    var isPlaying: Bool {
        get { return listItem.isPlaying }
        set { newValue ? play() : pause() }
    }
    
    private func play() {
        listItem.play()
        NotificationCenter
            .default
            .addObserver(
                forName: .AVPlayerItemDidPlayToEndTime,
                object: ListItemModel.sharedPlayer?.currentItem,
                queue: .current,
                using: didStopPlaying)
    }
    
    private func pause() {
        NotificationCenter
            .default
            .removeObserver(ListItemModel.sharedPlayer?.currentItem as Any)
        listItem.pause()
    }
    
    private func didStopPlaying(notification: Notification) {
        pause()
    }
}

