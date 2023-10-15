//
//  PlayerList.swift
//  NBAPlayer
//
//  Created by Artem Marhaza on 15/10/2023.
//

import SwiftUI

struct PlayerList: View {
    var body: some View {
        NavigationView {
            List(players) {
                player in
                NavigationLink(destination: PlayerDetail(player: player)) {
                    PlayerRow(player: player).frame(height: 60)
                }
            }.navigationTitle(Text("NBA Finals Players"))
        }
    }
}

struct PlayerList_Previews: PreviewProvider {
    static var previews: some View {
        PlayerList()
    }
}
