//
//  NieuwsView.swift
//  Top40
//
//  Created by Pieter Bikkel on 26/02/2021.
//

import SwiftUI

struct CategoriesView: View {
    
    @Binding var selection: Category
    
    init(_ selection: Binding<Category>) {
        self._selection = selection
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20){
                ForEach(Category.allCases) { category in
                    VStack(alignment: .leading,spacing: 12){
                        Button(action : {
                            selection = category
                        }, label: {
                            Image(category.rawValue.image).renderingMode(.original)
                                .resizable()
                                .frame(width: 240, height: 180)
                                .cornerRadius(10)
                        })
                        Text(category.rawValue.name).fontWeight(.heavy)
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
