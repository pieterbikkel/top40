//
//  NieuwsView.swift
//  Top40
//
//  Created by Pieter Bikkel on 26/02/2021.
//

import SwiftUI
import WebKit

struct Category: Identifiable {
    let id = UUID()
    let image: String
    let name: String
    let url: String
}

class CurrentCategory: ObservableObject {
    @Published private var currentList = "Top 40"
    
    func getCurrentList() -> String {
        return currentList
    }
    
    func setCurrentList(input: String) {
        currentList = input
    }
    
}

struct CategoriesView: View {
    
    var categoryClass = CurrentCategory()
    
    let categories = [Category(image: "top40", name: "Top 40", url: ""),
                      Category(image: "tipparade", name: "Tipparade", url: ""),
                      Category(image: "global", name: "Global Top 40", url: ""),
                      Category(image: "airplay", name: "Airplay Top 40", url: ""),
                      Category(image: "streaming", name: "Streaming Top 40", url: ""),
                      Category(image: "sterren", name: "Sterren NL Top 25", url: ""), ]
    
    @State var show = false
    var webView: WKWebView!
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20){
                ForEach(categories) {category in
                    VStack(alignment: .leading,spacing: 12){
                        Button(action : {
                            categoryClass.setCurrentList(input: category.name)
                            print(categoryClass.getCurrentList())
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
