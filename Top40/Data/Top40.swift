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

class Top40Response: ObservableObject {
    
    //@ObservedObject var currentList = CurrentCategory()
    //let top40NewsURL = "https://www.top40.nl/nieuws/nieuws"
    //https://www.top40.nl/global-top40
    //https://www.top40.nl/top40
    @Published var list: [Top40] = []
    //@Published var top40News: [Top40News] = []
    
//    init() {
//        getHTML(top40URL: top40NewsURL)
//        getHTML(top40URL: currentList.currentListURL)
//    }
//
    public func getHTML(url: String) {
        let url = URL(string: url)!
        let task = URLSession.shared.dataTask(with: url) { (data, res, err) in
            guard let data = data else {
                print("data is nil!!")
                return
            }
            guard let allHTML: String = String(data: data, encoding: String.Encoding.utf8) else {
                print("cannot cast data into a string")
                return
            }
            convertData(innerHTML: allHTML)
            
        }
        task.resume()
    }
    
    
}
