//
//  SkinsView.swift
//  VALORANT API
//
//  Created by Iker Perea Trejo on 25/8/23.
//

import SwiftUI

struct SkinsView: View {
    @EnvironmentObject var viewModel: SkinsViewModel
    var body: some View {
        NavigationView {
            List(viewModel.skins) { skin in
                Text(skin.displayName)
                    .listRowBackground(Color.indigo.blur(radius: 5))
                    .bold()
                
                AsyncImage(url: URL(string: skin.displayIcon ?? "")) { image in
                    switch image {
                    case .success(let image):
                        image
                            .resizable()
                    case .failure(_):
                        ProgressView()
                    case .empty:
                        // Placeholder view or text while loading
                        // You can put a loading indicator here if needed
                        ProgressView()
                    @unknown default:
                        ProgressView()
                    }
                }
                .overlay(
                    skin.displayIcon == nil ?
                    Color.clear
                        .onAppear {
                            viewModel.getSkins()
                        } : nil
                )
                
                }
                .listStyle(.plain)
                .listRowSeparator(.hidden)
            }
            .navigationTitle("Skins")
            .onAppear {
                viewModel.getSkins()
            }
        }
    }


