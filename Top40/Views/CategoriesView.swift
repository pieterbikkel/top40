//
//  NieuwsView.swift
//  Top40
//
//  Created by Pieter Bikkel on 26/02/2021.
//

import SwiftUI

struct CategoriesView: View {
    
    @ObservedObject var categoryClass: CurrentCategory
    
    let categories = [Category(image: "top40", name: "Top 40", url: "https://www.top40.nl/top40"),
                      Category(image: "tipparade", name: "Tipparade", url: "https://www.top40.nl/tipparade"),
                      Category(image: "global", name: "Global Top 40", url: "https://www.top40.nl/global-top40"),
                      Category(image: "airplay", name: "Airplay Top 40", url: "https://www.top40.nl/airplay-top40"),
                      Category(image: "streaming", name: "Streaming Top 40", url: "https://www.top40.nl/streaming-top40"),
                      Category(image: "sterren", name: "Sterren NL Top 25", url: "https://www.top40.nl/sterren-nl-top25"), ]
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20){
                ForEach(categories) {category in
                    VStack(alignment: .leading,spacing: 12){
                        Button(action : {
                            categoryClass.currentListName = category.name
                            categoryClass.currentListURL = category.url
                        }, label: {
                            Image(category.image).renderingMode(.original)
                                .resizable()
                                .frame(width: 240, height: 180)
                                .cornerRadius(10)
                        })
                        Text(category.name).fontWeight(.heavy)
                    }
                }
            }
            
        }
    }
}


struct Rounded : Shape {
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft,.topRight], cornerRadii: CGSize(width: 40, height: 40))
        return Path(path.cgPath)
    }
}
