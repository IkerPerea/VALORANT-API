//
//  VALORANT_APIApp.swift
//  VALORANT API
//
//  Created by Iker Perea Trejo on 24/8/23.
//

import SwiftUI

@main
struct VALORANT_APIApp: App {
    var skinsVM = SkinsViewModel()
    var playerTitleVM = PlayerTitleViewModel()
    var mapsVM = MapsViewModel()
    var agentsVM = AgentsViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(skinsVM)
                .environmentObject(playerTitleVM)
                .environmentObject(mapsVM)
                .environmentObject(agentsVM)
        }
    }
}
