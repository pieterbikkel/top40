//
//  PlayButton.swift
//  Top40
//
//  Created by Simon Schöpke on 04.03.21.
//

import SwiftUI

struct PlayButton: View {
    @Binding var isPlaying: Bool
    
    var body: some View {
        Button { isPlaying.toggle() } label: {
            Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                .foregroundColor(Color("almostBlack"))
                .font(.title)
                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 1, x: 0, y: 4)
                .frame(width: 30)
        }
    }
}

struct PlayButton_Previews: PreviewProvider {
    static var previews: some View {
        PlayButton(isPlaying: .constant(false))
    }
}
