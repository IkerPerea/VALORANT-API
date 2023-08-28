//
//  Agent.swift
//  VALORANT API
//
//  Created by Iker Perea Trejo on 26/8/23.
//

import Foundation

struct AgentResponse: Decodable {
    let status: Int32
    let data: [Agents]?
}

struct Agents: Decodable, Identifiable {
    let uuid: String
    let displayName: String?
    let description: String?
    let developerName: String?
    let characterTags: [String]?
    let displayIcon: String?
    let displayIconSmall: String?
    let bustPortrait: String?
    let fullPortrait: String?
    let fullPortraitV2: String?
    let killfeedPortrait: String?
    let background: String?
    let backgroundGradientColors: [String]?
    let assetPath: String?
    let isFullPortraitRightFacing: Bool?
    let isPlayableCharacter: Bool?
    let isAvailableForTest: Bool?
    let isBaseContent: Bool?
    var id: String {uuid}
}
