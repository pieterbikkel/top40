//
//  SettingView.swift
//  Top40
//
//  Created by Pieter Bikkel on 03/03/2021.
//

import SwiftUI

struct SettingView: View {
    var name: String
    
    var body: some View {
        NavigationLink(destination: SettingDetailView()) {
            VStack {
                Divider()
                HStack {
                    Text(name)
                        .fontWeight(.bold)
                        .foregroundColor(Color("almostBlack"))
                    Spacer()
                    Image(systemName: "chevron.right")
                        .font(Font.title2.weight(.bold))
                        .foregroundColor(Color("gray"))
                }
                .padding(.horizontal)
                .padding(.vertical, 8)
                Divider()
            }
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView(name: "Feedback")
    }
}
