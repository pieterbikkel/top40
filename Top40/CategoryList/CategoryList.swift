//
//  CurrentCategory.swift
//  Top40
//
//  Created by Pieter Bikkel on 28/02/2021.
//

import Foundation


struct CategoryInfo: Identifiable {
    let id = UUID()
    let image: String
    let name: String
    let url: String
}

enum Category: CaseIterable, Identifiable {
    case top40List, tipparade, global, airplay, streaming, sterren
    
    var rawValue: CategoryInfo {
        switch self {
        case .top40List: return CategoryInfo(image: "top40", name: "Top 40", url: "https://www.top40.nl/top40")
        case .tipparade: return CategoryInfo(image: "tipparade", name: "Tipparade", url: "https://www.top40.nl/tipparade")
        case .global: return CategoryInfo(image: "global", name: "Global Top 40", url: "https://www.top40.nl/global-top40")
        case .airplay: return CategoryInfo(image: "airplay", name: "Airplay Top 40", url: "https://www.top40.nl/airplay-top40")
        case .streaming: return CategoryInfo(image: "streaming", name: "Streaming Top 40", url: "https://www.top40.nl/streaming-top40")
        case .sterren: return CategoryInfo(image: "sterren", name: "Sterren NL Top 25", url: "https://www.top40.nl/sterren-nl-top25")
        }
    }
    
    var id: UUID {
        self.rawValue.id
    }
}

//class CurrentCategory: ObservableObject {
//
//    let top40List = Top40List()
//    let tipparade = Tipparade()
//    let global = Global()
//    let airplay = Airplay()
//    let streaming = Streaming()
//    let sterren = Sterren()
//
//    @Published private var _currentListName = "Top 40" //"https://www.top40.nl/top40"
//    @Published private var _currentListURL = "https://www.top40.nl/top40"
//
//    var currentListName: String {
//        get { _currentListName }
//        set { _currentListName = newValue }
//    }
//
//    var currentListURL: String {
//        get { _currentListURL }
//        set {
//            _currentListURL = newValue
//            switch _currentListName {
//            case "Top 40":
//                top40List.getHTML(url: _currentListURL)
//            case "Tipparade":
//                tipparade.getHTML(url: _currentListURL)
//            case "Global Top 40":
//                global.getHTML(url: _currentListURL)
//            case "Airplay Top 40":
//                airplay.getHTML(url: _currentListURL)
//            case "Streaming Top 40":
//                streaming.getHTML(url: _currentListURL)
//            case "Sterren NL Top 25":
//                sterren.getHTML(url: _currentListURL)
//            default:
//                top40List.getHTML(url: _currentListURL)
//            }
//        }
//    }
//}
