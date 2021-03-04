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
        VStack {
            categoryTitle
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(Category.allCases) { category in
                        VStack(alignment: .leading, spacing: 12) {
                            Button {
                                selection = category
                            } label: {
                                image(for: category)
                            }
                            Text(category.info.name).fontWeight(.heavy)
                        }
                    }
                }.padding(.horizontal)
            }
        }
    }
    
    var categoryTitle: some View {
        HStack {
            Text("Categorieën")
                .foregroundColor(Color("almostBlack"))
                .font(.title)
                .fontWeight(.bold)
            Spacer()
        }.padding(.horizontal)
    }
    
    func image(for category: Category) -> some View {
        Image(category.info.image).renderingMode(.original)
            .resizable()
            .aspectRatio(4 / 3, contentMode: .fill)
            .frame(height: 180)
            .cornerRadius(10)
    }
}
