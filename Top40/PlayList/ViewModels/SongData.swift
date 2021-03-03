//
//  SongData.swift
//  Top40
//
//  Created by Pieter Bikkel on 04/03/2021.
//

import Foundation
import SwiftSoup

class SongData: Top40Response {
    
    override init() {
        super.init()
        getHTML(url: "https://www.top40.nl/olivia-rodrigo-1/drivers-license-1-36087")
    }
    
    override func convertData(innerHTML: String) throws {
        let doc = try SwiftSoup.parse(innerHTML)
        //print(doc)
        let top40Doc = try doc.select("body").first()!
        let artists = try doc.select("p.artist").array()
        let titles = try doc.select("h3.title").array()
        let iTunesDoc = try top40Doc.select("div.clearfix").attr("data-title-id", "data-m4a-path")
        var iTunesLinks = [String]()
        var positions = [String]()
        var amountOfweeks = [String]()
        var songLinks = [String]()
        for element in iTunesDoc.array() {
            iTunesLinks.append(try element.attr("data-m4a-path"))
            positions.append(try element.select("div.dot-icon").text())
            //amountOfweeks.append(try element.select("div.statcolumn").array()[1].text())
            songLinks.append(try element.select("a").attr("href"))
        }
        
        var songs = [Song]()
        
        for i in (0..<artists.count).prefix(25) {
            let title = try titles[i].text()
            let artist = try artists[i].text()
            let song = Song(title: title,
                            artist: artist,
                            piek: "",
                            position: "",
                            amountOfWeeks: "",
                            iTunesLink: "",
                            releaseDate: "",
                            Length: "",
                            componists: "",
                            producer: "",
                            mixage: "",
                            recordLabel: "",
                            albumArtLink: "",
                            artistBirthDate: "",
                            points: "",
                            artistCountry: "",
                            artistDescription: "",
                            songText: "",
                            catalogNumber: "",
                            highestPosUK: "",
                            highestPosUS: "")
            songs.append(song)
        }
        
        DispatchQueue.main.async { [weak self] in
            self?.song = songs
        }
    }
}

