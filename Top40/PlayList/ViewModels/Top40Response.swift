//
//  getData.swift
//  Top40
//
//  Created by Pieter Bikkel on 18/02/2021.
//

import Foundation
import SwiftUI
import SwiftSoup

class Top40Response: ObservableObject {
    @Published var list: [Top40] = []
    
    public func getHTML(url: URL) {
        DispatchQueue.global(qos: .userInitiated).async {
            guard let html = try? String(contentsOf: url) else { return }
            try? self.convertData(innerHTML: html)
        }
    }
    
    func convertData(innerHTML: String) throws {
        fatalError("convertData has not been implemented")
    }
}
