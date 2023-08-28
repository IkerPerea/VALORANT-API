//
//  MapsView.swift
//  VALORANT API
//
//  Created by Iker Perea Trejo on 25/8/23.
//

import SwiftUI

struct MapsView: View {
    @EnvironmentObject var mapsVM: MapsViewModel
    var body: some View {
        NavigationView {
            List(mapsVM.maps) { map in
                Text(map.displayName ?? "Not found")
                    .listRowBackground(Color.indigo.blur(radius: 5))
                    .bold()
                AsyncImage(url: URL(string: map.listViewIcon ?? "" )) { image in
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
                        map.listViewIcon == nil ?
                        Color.clear
                            .onAppear {
                                mapsVM.getMaps()
                            } : nil
                    )
            }
            .navigationTitle("Maps")
            
        }.onAppear {
            mapsVM.getMaps()
        }
    }
}

struct MapsView_Previews: PreviewProvider {
    static var previews: some View {
        MapsView()
    }
}
