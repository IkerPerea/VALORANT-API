//
//  PlayerTitlesView.swift
//  VALORANT API
//
//  Created by Iker Perea Trejo on 25/8/23.
//

import SwiftUI

struct PlayerTitlesView: View {
    @EnvironmentObject var playerVM: PlayerTitleViewModel
    var body: some View {
        NavigationView {
            List(playerVM.playerTitle) { title in
                Text(title.titleText ?? "Not found")
                    .listRowBackground(Color.indigo.blur(radius: 5))
                    .bold()

            }

        }.onAppear {
            playerVM.getPlayerTitles()
        }
    }
}

struct PlayerTitlesView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerTitlesView()
    }
}
