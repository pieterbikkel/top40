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
    //@ObservedObject var currentList = CurrentCategory()
    //let top40NewsURL = "https://www.top40.nl/nieuws/nieuws"
    //https://www.top40.nl/global-top40
    //https://www.top40.nl/top40
    
    @Published var list: [Top40] = []
    //@Published var top40News: [Top40News] = []
    
    public func getHTML(url: String) {
        let url = URL(string: url)!
        let task = URLSession.shared.dataTask(with: url) { (data, res, err) in
            guard let data = data else {
                print("data is nil!!")
                return
            }
            
            guard let allHTML: String = String(data: data, encoding: .utf8) else {
                print("cannot cast data into a string")
                return
            }
            
            try? self.convertData(innerHTML: allHTML)
        }
        
        task.resume()
    }
    
    func convertData(innerHTML: String) throws {
        fatalError("convertData has not been implemented")
    }
    
}
