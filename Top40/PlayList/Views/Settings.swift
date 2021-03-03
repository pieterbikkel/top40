//
//  Settings.swift
//  Top40
//
//  Created by Pieter Bikkel on 02/03/2021.
//

import SwiftUI

struct Settings: View {
    var body: some View {
        ZStack {
            VStack {
                Text("Instellingen")
                    .foregroundColor(Color("almostBlack"))
                    .font(.title)
                    .fontWeight(.bold)
                    .offset(y: -60)
                Spacer()
            }
            VStack {
                SettingView(name: "Support de app")
                SettingView(name: "Kies app icoon")
                SettingView(name: "Feedback")
                SettingView(name: "Over deze app")
            }.padding(.vertical, 0)
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
