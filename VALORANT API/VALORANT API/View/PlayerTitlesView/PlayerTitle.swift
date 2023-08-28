//
//  PlayerTitle.swift
//  VALORANT API
//
//  Created by Iker Perea Trejo on 25/8/23.
//

import Foundation

struct PlayerTitleResponse: Decodable {
    let status: Int32   
    let data: [PlayerTitle]
}
struct PlayerTitle: Decodable, Identifiable {
    let uuid: String
    let displayName: String?
    let titleText: String?
    let isHiddenIfNotOwned: Bool
    let assetPath: String?
    var id: String {uuid}
}
