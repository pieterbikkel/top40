//
//  RoundLabel.swift
//  Top40
//
//  Created by Simon Schöpke on 04.03.21.
//

import SwiftUI

struct RoundLabel: View {
    let text: String
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(.red)
                .frame(width: 40, height: 40)
                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 1, x: 0, y: 4)
            Text(text)
                .foregroundColor(.white)
                .font(.system(size: 20))
                .fontWeight(.bold)
        }
    }
}

struct RoundLabel_Previews: PreviewProvider {
    static var previews: some View {
        RoundLabel(text: "1")
    }
}
