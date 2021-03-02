//
//  ContentView.swift
//  Top40
//
//  Created by Pieter Bikkel on 18/02/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var currentCategory = Category.top40List
    
    var body: some View {
        ZStack {
            Text("TOP 40")
                .fontWeight(.heavy)
            
            HStack {
                Spacer()
                Button {
                    print("settings")
                } label: {
                    Image(systemName: "gearshape")
                        .foregroundColor(Color("almostBlack"))
                        .font(.system(size: 24, weight: .regular))
                }
            }
        }
        .padding(.horizontal)
        .multilineTextAlignment(.center)
        .font(.largeTitle)
        .padding(.vertical, 10)
        .foregroundColor(.red)
        
        NavigationView() {
            VStack {
                HStack {
                    Text("Categorieën")
                        .foregroundColor(Color("almostBlack"))
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                }.padding(.horizontal)
                
                CategoryList(selection: $currentCategory)
                    .padding()
                
                HStack {
                    Text(currentCategory.info.name)
                        .foregroundColor(Color("almostBlack"))
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                    Button {
                        print(currentCategory.info.url)
                    } label: {
                        Image(systemName: "ellipsis")
                            .foregroundColor(Color("almostBlack"))
                            .font(.title)
                    }
                }
                .padding(.horizontal, 20)
                
                PlayList(category: currentCategory)
            }
            .navigationBarHidden(true)
        }
    }
}
