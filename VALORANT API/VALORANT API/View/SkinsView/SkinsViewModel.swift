//
//  Network.swift
//  VALORANT API
//
//  Created by Iker Perea Trejo on 24/8/23.
//

import Foundation
import SwiftUI

class SkinsViewModel: ObservableObject {
    @Published var skins: [Skin] = []
    
    func getSkins() {
        let languageParam = URLQueryItem(name: "language", value: "es-ES")
        guard let url = URL(string: "https://valorant-api.com/v1/weapons/skins")?.appending(queryItems: [languageParam]) else { fatalError("Bad URL") }
        let urlRequest = URLRequest(url: url)
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error:", error)
                return
            }
            guard let data = data else { return } // Make sure there's data
            do {
                let decodedData = try JSONDecoder().decode(SkinResponse.self, from: data)
                DispatchQueue.main.async {
                    self.skins = decodedData.data
                }
            } catch let error {
                print("Error Decoding:", error)
            }
        }
        dataTask.resume()
    }
  
}
