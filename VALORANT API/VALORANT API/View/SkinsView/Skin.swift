//
//  Skin.swift
//  VALORANT API
//
//  Created by Iker Perea Trejo on 24/8/23.
//

import Foundation

struct SkinResponse: Decodable {
    let status: Int
    let data: [Skin]
}

struct Skin: Decodable, Identifiable {
    let uuid: String
    let displayName: String
    let themeUuid: String
    let contentTierUuid: String?
    let displayIcon: String?
    let wallpaper: String?
    let assetPath: String
    let chromas: [Chroma]
    let levels: [Level]
    
    var id: String {uuid}
}

struct Chroma: Decodable {
    let uuid: String
    let displayName: String
    let displayIcon: String?
    let fullRender: String
    let swatch: String?
    let streamedVideo: String?
    let assetPath: String
}

struct Level: Decodable {
    let uuid: String
    let displayName: String
    let levelItem: String?
    let displayIcon: String?
    let streamedVideo: String?
    let assetPath: String
    
    private enum CodingKeys: String, CodingKey {
           case uuid, displayName, levelItem, displayIcon, streamedVideo, assetPath
       }
       
       init(from decoder: Decoder) throws {
           let container = try decoder.container(keyedBy: CodingKeys.self)
           uuid = try container.decode(String.self, forKey: .uuid)
           displayName = try container.decode(String.self, forKey: .displayName)
           levelItem = try container.decodeIfPresent(String.self, forKey: .levelItem)
           displayIcon = try container.decodeIfPresent(String.self, forKey: .displayIcon)
           streamedVideo = try container.decodeIfPresent(String.self, forKey: .streamedVideo)
           assetPath = try container.decode(String.self, forKey: .assetPath)
       }
}
