//
//  MapsViewModel.swift
//  VALORANT API
//
//  Created by Iker Perea Trejo on 26/8/23.
//

import Foundation

class MapsViewModel: ObservableObject {
    @Published var maps: [Maps] = []

    func getMaps() {
        let languageParam = URLQueryItem(name: "language", value: "es-ES")
        guard let url = URL(string: "https://valorant-api.com/v1/maps")?.appending(queryItems: [languageParam]) else { fatalError("Bad URL") }
        let urlRequest = URLRequest(url: url)
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error:", error)
                return
            }
            guard let data = data else { return } // Make sure there's data
            do {
                let decodedData = try JSONDecoder().decode(MapsResponse.self, from: data)
                DispatchQueue.main.async {
                    self.maps = decodedData.data
                }
            } catch let error {
                print("Error Decoding:", error)
            }
        }
        dataTask.resume()
    }
}
