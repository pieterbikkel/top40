//
//  Top40News.swift
//  Top40
//
//  Created by Pieter Bikkel on 25/02/2021.
//

import Foundation

struct Top40News: Identifiable {
    var id = UUID()
    var imageURL: String
    var date: String
    var articleURL: String
}
    
//func convertDataNews(innerHTML: String) throws {
//    let doc = try SwiftSoup.parse(innerHTML)
//    let top40Doc: Element = try doc.select("div.nolimit").first()!
//    let articleURLsList: Elements = try top40Doc.select("a.news-heading-title")
//    let articleIMGURLsList: Elements = try top40Doc.select("div.background")
//    let dates = try top40Doc.select("span.heading-category").array()
//    var articleURLs : [String] = []
//    var articleIMGURLs : [String] = []
//    for element: Element in articleURLsList.array(){
//        articleURLs.append(try element.select("a").attr("href"))
//    }
//    for element: Element in articleIMGURLsList.array(){
//        let test = try element.select("div").attr("style")
//        let result = String(test.dropFirst(23))
//        let result2 = String(result.dropLast(3))
//        articleIMGURLs.append(result2)
//    }
//    
//    var articles = [Top40News]()
//    for i in 0..<articleURLs.count {
//        let articleURL = articleURLs[i]
//        let date = try dates[i].text()
//        let image = articleIMGURLs[i]
//        let article = Top40News(imageURL: image, date: date, articleURL: articleURL)
//        articles.append(article)
//    }
//    DispatchQueue.main.async { [weak self] in
//        self?.top40News = articles
//    }
//}
