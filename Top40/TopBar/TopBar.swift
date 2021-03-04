//
//  TopBar.swift
//  Top40
//
//  Created by Simon Schöpke on 04.03.21.
//

import SwiftUI

struct TopBar: View {
    var body: some View {
        ZStack {
            Text("TOP 40")
                .fontWeight(.heavy)
                .font(.largeTitle)
                .foregroundColor(.red)
            HStack {
                Spacer()
                NavigationLink(destination: Settings()) {
                    Image(systemName: "gearshape")
                        .foregroundColor(Color("almostBlack"))
                        .font(.system(size: 24, weight: .regular))
                }
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
    }
}

struct TopBar_Previews: PreviewProvider {
    static var previews: some View {
        TopBar()
    }
}
