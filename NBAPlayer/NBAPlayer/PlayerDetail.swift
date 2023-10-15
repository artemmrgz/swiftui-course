//
//  PlayerDetail.swift
//  NBAPlayer
//
//  Created by Artem Marhaza on 15/10/2023.
//

import SwiftUI

struct PlayerDetail: View {
    
    var player: Player

    var body: some View {
        VStack {
            Image(player.team.imageName).resizable().aspectRatio(contentMode: .fit)
            Image(player.imageName).clipShape(Circle()).background(Circle().foregroundColor(.white)).overlay(Circle().stroke(Color.white, lineWidth: 4)).offset(x: 0, y: -90).padding(.bottom, -70).shadow(radius: 15)
            Text(player.name).font(.system(size: 40)).fontWeight(.heavy)
            StatText(statName: "Age", statValue: "\(player.age)")
            StatText(statName: "Height", statValue: player.height)
            StatText(statName: "Weight", statValue: "\(player.weight)lbs")
            Spacer()
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerDetail(player: players[0])
    }
}
