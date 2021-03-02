//
//  CategoryList.swift
//  Top40
//
//  Created by Pieter Bikkel on 26/02/2021.
//

import SwiftUI

struct CategoryList: View {
    @Binding var selection: Category
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(Category.allCases) { category in
                    VStack(alignment: .leading,spacing: 12){
                        Button(action : {
                            selection = category
                        }, label: {
                            Image(category.info.image).renderingMode(.original)
                                .resizable()
                                .frame(width: 240, height: 180)
                                .cornerRadius(10)
                        })
                        Text(category.info.name).fontWeight(.heavy)
                    }
                }
            }
        }
    }
}
