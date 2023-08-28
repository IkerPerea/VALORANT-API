//
//  AgentView.swift
//  VALORANT API
//
//  Created by Iker Perea Trejo on 25/8/23.
//

import SwiftUI


struct AgentView: View {
    @EnvironmentObject var agentVM: AgentsViewModel

    var body: some View {
        NavigationView {
            List(agentVM.agents) { agent in
                    Text(agent.displayName ?? "Not found")
                        .listRowBackground(Color.indigo.blur(radius: 5))
                        .bold()
                AsyncImage(url: URL(string: agent.fullPortraitV2 ?? "")) { image in
                    switch image {
                    case .success(let image):
                        image
                            .resizable()
                    case .failure(_):
                        ProgressView()
                    case .empty:
                        // Placeholder view or text while loading
                        // You can put a loading indicator here if needed
                        EmptyView()
                    @unknown default:
                        EmptyView()
                    }
                }
                .frame(width: 800, height: 700, alignment: .center)
                .overlay(
                    agent.fullPortraitV2 == nil ?
                    Color.clear
                        .onAppear {
                            agentVM.getAgents()
                        } : nil
                )
                
            }
            .navigationTitle("Agents")
        }.onAppear {
            agentVM.getAgents()
        }

    }
}

