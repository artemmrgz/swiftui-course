//
//  StatText.swift
//  NBAPlayer
//
//  Created by Artem Marhaza on 15/10/2023.
//

import SwiftUI

struct StatText: View {
    
    var statName: String
    var statValue: String
    
    var body: some View {
        HStack {
            Text(statName + ":").font(.system(size: 45)).fontWeight(.bold).padding(.leading, 30)
            Text(statValue).font(.system(size: 45)).fontWeight(.light).padding(.trailing, 30)
            Spacer()
        }.minimumScaleFactor(0.6)
    }
}

struct StatText_Previews: PreviewProvider {
    static var previews: some View {
        StatText(statName: "Age", statValue: "31")
    }
}
