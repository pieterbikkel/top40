//
//  StatisticsView.swift
//  Top40
//
//  Created by Simon Schöpke on 04.03.21.
//

import SwiftUI

struct StatisticsView: View {
    let piek: String
    let weeks: String
    
    var body: some View {
        HStack {
            VStack {
                HStack {
                    if (piek != "piek") {
                        Image(systemName: "rosette")
                            .frame(width: 20, alignment: .leading)
                        Text(piek)
                    }
                }
                .frame(width: 50, alignment: .leading)
                
                HStack {
                    Image(systemName: "calendar")
                        .frame(width: 20, alignment: .leading)
                    Text(weeks)
                }
                .frame(width: 50, alignment: .leading)
            }
            .multilineTextAlignment(.leading)
        }
    }
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView(piek: "piek", weeks: "3")
    }
}
