//
//  getData.swift
//  Top40
//
//  Created by Pieter Bikkel on 18/02/2021.
//

import Foundation
import SwiftUI
import SwiftSoup

struct Song {
    var title: String
    var artist: String
    var piek: Int
    var position: Int
    var amountOfWeeks: Int
    var iTunesLink: String
    var releaseDate: String
    var Length: String
    var componists: String
    var producer: String
    var mixage: String
    var recordLabel: String
    var albumArtLink: String
    var artistBirthDate: String
    var points: Int
    var artistCountry: String
    var artistDescription: String
    var songText: String
    var catalogNumber: String
    var highestPosUK: Int
    var highestPosUS: Int
}

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

struct Top40News: Identifiable {
    var id = UUID()
    var imageURL: String
    var date: String
    var articleURL: String
}

class Top40Response: ObservableObject {
    
    let top40NewsURL = "https://www.top40.nl/nieuws/nieuws"
    let top40ListURL = "https://www.top40.nl/top40"
    @Published var top40List: [Top40] = []
    @Published var top40News: [Top40News] = []
    @AppStorage("list") var system: Int = 0 {
        didSet {
            getHTML(top40URL: top40ListURL)
            print("coolio gangsgers")
        }
    }
    
    init() {
        getHTML(top40URL: top40NewsURL)
        getHTML(top40URL: top40ListURL)
    }
    
    public func getHTML(top40URL: String) {
        let url = URL(string: top40URL)!
        let task = URLSession.shared.dataTask(with: url) { (data, res, err) in
            guard let data = data else {
                print("data is nil!!")
                return
            }
            guard let allHTML: String = String(data: data, encoding: String.Encoding.utf8) else {
                print("cannot cast data into a string")
                return
            }
            do {
                switch top40URL {
                case "https://www.top40.nl/top40":
                    try self.convertData(innerHTML: allHTML)
                case "https://www.top40.nl/nieuws/nieuws":
                    try self.convertDataNews(innerHTML: allHTML)
                default: return
                }
                
            } catch {}
            
        }
        task.resume()
        
    }
    
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
    
    func convertDataNews(innerHTML: String) throws {
        let doc = try SwiftSoup.parse(innerHTML)
        let top40Doc: Element = try doc.select("div.nolimit").first()!
        let articleURLsList: Elements = try top40Doc.select("a.news-heading-title")
        let articleIMGURLsList: Elements = try top40Doc.select("div.background")
        let dates = try top40Doc.select("span.heading-category").array()
        var articleURLs : [String] = []
        var articleIMGURLs : [String] = []
        for element: Element in articleURLsList.array(){
            articleURLs.append(try element.select("a").attr("href"))
        }
        for element: Element in articleIMGURLsList.array(){
            let test = try element.select("div").attr("style")
            let result = String(test.dropFirst(23))
            let result2 = String(result.dropLast(3))
            articleIMGURLs.append(result2)
        }
        
        var articles = [Top40News]()
        for i in 0..<articleURLs.count {
            let articleURL = articleURLs[i]
            let date = try dates[i].text()
            let image = articleIMGURLs[i]
            let article = Top40News(imageURL: image, date: date, articleURL: articleURL)
            articles.append(article)
        }
        DispatchQueue.main.async { [weak self] in
            self?.top40News = articles
        }
    }
}
