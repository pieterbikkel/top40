//
//  SongDetailView.swift
//  Top40
//
//  Created by Pieter Bikkel on 03/03/2021.
//

import SwiftUI

struct SongDetailView: View {
    
    var songLink: String
    var songData = SongData()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear() {
                songData.getHTML(url: URL(string: songLink)!)
            }
    }
}

struct SongDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SongDetailView(songLink: "https://www.top40.nl/olivia-rodrigo-1/drivers-license-1-36087")
    }
}
