//
//  ListItem.swift
//  Top40
//
//  Created by Simon Schöpke on 02.03.21.
//

import SwiftUI
import AVFoundation

struct ListItem: View {
    @ObservedObject var item: ListItemViewModel
    
    init(song: Top40, selection: Binding<Top40?>) {
        self.item = ListItemViewModel(song: song, selection: selection)
    }
    
    var body: some View {
        HStack {
//            NavigationLink(destination: SongDetailView(songLink: item.song.songLink)) {
                
                RoundLabel(text: item.song.position)
                
                DescriptionView(title: item.song.title, subtitle: item.song.artist)
                
                Spacer()
                
                StatisticsView(piek: item.song.piek, weeks: item.song.amountOfWeeks)
//            }
            
            PlayButton(isPlaying: $item.isPlaying)
            
        }
        .padding(.vertical, 10)
    }
}


