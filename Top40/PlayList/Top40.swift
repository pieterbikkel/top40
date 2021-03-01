//
//  Top40.swift
//  Top40
//
//  Created by Simon Schöpke on 01.03.21.
//

import Foundation

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
