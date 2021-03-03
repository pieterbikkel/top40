//
//  Settings.swift
//  Top40
//
//  Created by Pieter Bikkel on 02/03/2021.
//

import SwiftUI

struct Settings: View {
    
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [
            .font : UIFont.systemFont(ofSize: 20, weight: .bold),
            NSAttributedString.Key.foregroundColor : UIColor(Color("almostBlack"))
        ]
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().tintColor = .systemRed
    }
    
    var body: some View {
        VStack {
            SettingView(name: "Support de app")
            SettingView(name: "Kies app icoon")
            SettingView(name: "Feedback")
            SettingView(name: "Over deze app")
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarTitle("Instellingen")
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
