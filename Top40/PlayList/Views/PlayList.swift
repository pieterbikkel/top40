//
//  PlayList.swift
//  Top40
//
//  Created by Simon Schöpke on 01.03.21.
//

import SwiftUI
import AVFoundation

struct PlayList: View {
    @ObservedObject private var top40Response: Top40Response
    @State private var playingSong: Top40?
    
    init(category: Category) {
        switch category {
        case .top40List: top40Response = Top40List()
        case .tipparade: top40Response = Tipparade()
        case .global: top40Response = Global()
        case .airplay: top40Response = Airplay()
        case .streaming: top40Response = Streaming()
        case .sterren: top40Response = Sterren()
        }
    }
    
    var body: some View {
        List(top40Response.list, id: \.position) { song in
            ListItem(song: song, selection: $playingSong)
        }
        .listStyle(PlainListStyle())
    }
}
