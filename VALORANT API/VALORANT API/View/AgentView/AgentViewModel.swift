//
//  AgentViewModel.swift
//  VALORANT API
//
//  Created by Iker Perea Trejo on 26/8/23.
//

import Foundation

class AgentsViewModel: ObservableObject {
    @Published var agents: [Agents] = []

    func getAgents() {
        let languageParam = URLQueryItem(name: "language", value: "es-ES")
        let agentBugFixParam = URLQueryItem(name: "isPlayableCharacter", value: "true")

        guard let url = URL(string: "https://valorant-api.com/v1/agents")?.appending(queryItems: [languageParam, agentBugFixParam]) else { fatalError("Bad URL") }
        let urlRequest = URLRequest(url: url)
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error:", error)
                return
            }
            guard let data = data else { return } // Make sure there's data
            do {
                let decodedData = try JSONDecoder().decode(AgentResponse.self, from: data)
                DispatchQueue.main.async {
                    self.agents = decodedData.data ?? []
                }
            } catch let error {
                print("Error Decoding:", error)
            }
        }
        dataTask.resume()
    }
}
