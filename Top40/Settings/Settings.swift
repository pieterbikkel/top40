//
//  Settings.swift
//  Top40
//
//  Created by Pieter Bikkel on 02/03/2021.
//

import SwiftUI

struct Settings: View {
    
    init() {
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
    }
    
    var body: some View {
        VStack {
            Text("Instellingen")
                .foregroundColor(Color("almostBlack"))
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom)
            SettingView(name: "Support de app")
            SettingView(name: "Kies app icoon")
            SettingView(name: "Feedback")
            SettingView(name: "Over deze app")
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
