//
//  Top40List.swift
//  Top40
//
//  Created by Pieter Bikkel on 25/02/2021.
//

import Foundation
import SwiftSoup
import SwiftUI

struct Top40: Identifiable {
    var id = UUID()
    var title: String
    var artist: String
    var piek: String
    var position: String
    var amountOfWeeks: String
    var iTunesLink: String
    var songLink: String
}

class Top40List: Top40Response {
    
    @Published var top40List: [Top40] = []
    
    func convertData(innerHTML: String) throws {
        let doc = try SwiftSoup.parse(innerHTML)
        let top40Doc: Element = try doc.select("div.chartList").first()!
        let artists = try doc.select("p.artist").array()
        let titles = try doc.select("h3.title").array()
        let iTunesDoc: Elements = try top40Doc.select("div.clearfix").attr("data-title-id", "data-m4a-path")
        var iTunesLinks: [String] = []
        var positions: [String] = []
        var amountOfweeks: [String] = []
        var pieks: [String] = []
        var songLinks: [String] = []
        for element: Element in iTunesDoc.array(){
            iTunesLinks.append(try element.attr("data-m4a-path"))
            positions.append(try element.select("div.dot-icon").text())
            amountOfweeks.append(try element.select("div.statcolumn").array()[1].text())
            pieks.append(try element.select("div.statcolumn").array()[4].text())
            songLinks.append(try element.select("a").attr("href"))
        }
        
        var songs = [Top40]()
        for i in 0..<artists.count {
            if i < 40 {
                let title = try titles[i].text()
                let artist = try artists[i].text()
                let iTunesLink = iTunesLinks[i+1]
                let position = positions[i+1]
                let amountOfweek = amountOfweeks[i+1]
                let piek = pieks[i+1]
                let songLink = songLinks[i+1]
                let song = Top40(title: title, artist: artist, piek: piek, position: position, amountOfWeeks: amountOfweek, iTunesLink: iTunesLink, songLink: songLink)
                songs.append(song)
            }
        }
        DispatchQueue.main.async { [weak self] in
            self?.top40List = songs
        }
    }
}
