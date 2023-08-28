//
//  PlayerTitleViewModel.swift
//  VALORANT API
//
//  Created by Iker Perea Trejo on 25/8/23.
//

import Foundation

class PlayerTitleViewModel: ObservableObject {
    @Published var playerTitle: [PlayerTitle] = []
    
    func getPlayerTitles() {
        let languageParam = URLQueryItem(name: "language", value: "es-ES")
        guard let url = URL(string: "https://valorant-api.com/v1/playertitles")?.appending(queryItems: [languageParam]) else { fatalError("Bad URL") }
        let urlRequest = URLRequest(url: url)
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error:", error)
                return
            }
            guard let data = data else { return } // Make sure there's data
            do {
                let decodedData = try JSONDecoder().decode(PlayerTitleResponse.self, from: data)
                DispatchQueue.main.async {
                    self.playerTitle = decodedData.data
                }
            } catch let error {
                print("Error Decoding:", error)
            }
        }
        dataTask.resume()
    }
  
}
