//
//  Maps.swift
//  VALORANT API
//
//  Created by Iker Perea Trejo on 26/8/23.
//

import Foundation

struct MapsResponse: Decodable {
    let status: Int32
    let data: [Maps]
}

struct Maps: Decodable, Identifiable {
    let uuid: String
    let displayName: String?
    let narrativeDescription: String?
    let tacticalDescription: String?
    let coordinates: String?
    let displayIcon: String?
    let listViewIcon: String?
    let splash: String
    let assetPath: String
    let mapUrl: String
    let xMultiplier: Double
    let yMultiplier: Double
    let xScalarToAdd: Double
    let yScalarToAdd: Double
    let callouts: [Callouts]?
    var id: String {uuid}
}

struct Callouts: Decodable {
    let regionName: String
    let superRegionName: String
 //   let location: [Location]?
}

//struct Location: Decodable {
//    let x: Double
//    let y: Double
//}
