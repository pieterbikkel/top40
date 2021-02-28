//
//  CurrentCategory.swift
//  Top40
//
//  Created by Pieter Bikkel on 28/02/2021.
//

import Foundation

struct Category: Identifiable {
    let id = UUID()
    let image: String
    let name: String
    let url: String
}

class CurrentCategory: ObservableObject {
    
    let top40List = Top40List()
    let tipparade = Tipparade()
    let global = Global()
    let airplay = Airplay()
    let streaming = Streaming()
    let sterren = Sterren()
    
    @Published private var _currentListName = "Top 40" //"https://www.top40.nl/top40"
    @Published private var _currentListURL = "https://www.top40.nl/top40"
    
    var currentListName: String {
        get { return _currentListName }
        set { _currentListName = newValue }
    }
    
    var currentListURL: String {
        get { return _currentListURL }
        set {
            _currentListURL = newValue
            switch _currentListName {
            case "Top 40":
                top40List.getHTML(url: _currentListURL)
            case "Tipparade":
                tipparade.getHTML(url: _currentListURL)
            case "Global Top 40":
                global.getHTML(url: _currentListURL)
            case "Airplay Top 40":
                airplay.getHTML(url: _currentListURL)
            case "Streaming Top 40":
                streaming.getHTML(url: _currentListURL)
            case "Sterren NL Top 25":
                sterren.getHTML(url: _currentListURL)
            default:
                top40List.getHTML(url: _currentListURL)
            }
        }
    }
}
