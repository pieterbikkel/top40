//
//  Category.swift
//  Top40
//
//  Created by Pieter Bikkel on 28/02/2021.
//

import Foundation

struct CategoryInfo: Identifiable {
    let id = UUID()
    let image: String
    let name: String
    let url: URL
}

enum Category: CaseIterable, Identifiable {
    case top40List, tipparade, global, airplay, streaming, sterren
    
    var info: CategoryInfo {
        switch self {
        case .top40List:
            return CategoryInfo(
            image: "top40",
            name: "Top 40",
            url: "https://www.top40.nl/top40")
            
        case .tipparade:
            return CategoryInfo(
                image: "tipparade",
                name: "Tipparade",
                url: "https://www.top40.nl/tipparade")
            
        case .global:
            return CategoryInfo(
                image: "global",
                name: "Global Top 40",
                url: "https://www.top40.nl/global-top40")
            
        case .airplay:
            return CategoryInfo(
                image: "airplay",
                name: "Airplay Top 40",
                url: "https://www.top40.nl/airplay-top40")
            
        case .streaming:
            return CategoryInfo(
                image: "streaming",
                name: "Streaming Top 40",
                url: "https://www.top40.nl/streaming-top40")
            
        case .sterren:
            return CategoryInfo(
                image: "sterren",
                name: "Sterren NL Top 25",
                url: "https://www.top40.nl/sterren-nl-top25")
        }
    }
    
    var id: UUID {
        self.info.id
    }
}
