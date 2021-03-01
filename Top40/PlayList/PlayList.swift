//
//  PlayList.swift
//  Top40
//
//  Created by Simon Schöpke on 01.03.21.
//

import SwiftUI
import AVFoundation

struct PlayList: View {
    @ObservedObject private var top40: Top40Response
    private let player = AVPlayer()
    
    init(category: Category) {
        switch category {
        case .top40List: top40 = Top40List()
//        case .tipparade: top40 =
//        case .global: top40 =
//        case .airplay: top40 =
//        case .streaming: top40 =
//        case .sterren: top40 =
        
        default: top40 = Top40List()
        }
    }
    
    var body: some View {
        List(top40.list, id: \.position) { song in
            ListItemView(player: player, song: song)
        }
        .listStyle(PlainListStyle())
    }
}

//struct PlayList_Previews: PreviewProvider {
//    static var previews: some View {
//        PlayList()
//    }
//}
