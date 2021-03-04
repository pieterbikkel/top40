//
//  DescriptionView.swift
//  Top40
//
//  Created by Simon Schöpke on 04.03.21.
//

import SwiftUI

struct DescriptionView: View {
    let title: String
    let subtitle: String
    
    var body: some View {
        VStack {
            Text(title)
                .fontWeight(.bold)
                .frame(width: UIScreen.width * 0.52, alignment: .leading)
            Text(subtitle)
                .frame(width: UIScreen.width * 0.52, alignment: .leading)
        }
        .foregroundColor(Color("almostBlack"))
        .lineLimit(1)
        .multilineTextAlignment(.leading)
    }
}

struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionView(title: "Drivers License", subtitle: "Olivia Rodrigo")
    }
}
