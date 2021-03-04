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
        NavigationView {
            VStack {
                TopBar()
                CategoryList(selection: $currentCategory)
                PlayList(category: currentCategory)
            }
            .navigationBarHidden(true)
            .navigationBarTitle("Home")
        }
    }
}
