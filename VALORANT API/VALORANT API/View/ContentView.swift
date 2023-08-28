//
//  ContentView.swift
//  VALORANT API
//
//  Created by Iker Perea Trejo on 24/8/23.
//

import SwiftUI

enum TabbedItems: Int, CaseIterable{
    case skins = 0
    case agents = 1
    case maps = 2
    case playerTitles = 3
    
    var title: String{
        switch self {
        case .skins:
            return "Skins"
        case .agents:
            return "Agents"
        case .maps:
            return "Maps"
        case .playerTitles:
            return "Player Titles"
        }
    }
    
    var iconName: String{
        switch self {
        case .skins:
            return "paintpalette.fill"
        case .agents:
            return "figure.walk.diamond"
        case .maps:
            return "tree.circle.fill"
        case .playerTitles:
            return "text.bubble"
        }
    }
}

struct ContentView: View {
    
    @State var selectedTab = 0
    @EnvironmentObject var viewModel: SkinsViewModel
    var body: some View {
            ZStack(alignment: .bottom) {
                TabView(selection: $selectedTab) {
                    SkinsView()
                        .tag(0)
                    
                    AgentView()
                        .tag(1)
                    
                    MapsView()
                        .tag(2)
                    
                    PlayerTitlesView()
                        .tag(3)

                }
                ZStack{
                    HStack{
                        ForEach((TabbedItems.allCases), id: \.self) { item in
                            Button {
                                selectedTab = item.rawValue
                            } label: {
                                CustomTabItem(imageName: item.iconName, title: item.title, isActive: (selectedTab == item.rawValue))
                            }
                        }
                    }
                }
                .frame(height: 70)
                .background(.purple.opacity(1))
                .cornerRadius(35)
            }
        }
    }


extension ContentView {
    func CustomTabItem(imageName: String, title: String, isActive: Bool) -> some View{
        HStack(spacing: 10){
            Spacer()
            Image(imageName)
                .resizable()
                .renderingMode(.template)
                .foregroundColor(isActive ? .black : .orange)
                .frame(width: 20, height: 20)
            if isActive{
                Text(title)
                    .font(.system(size: 14))
                    .foregroundColor(isActive ? .black : .red)
            }
            Spacer()
        }
        .frame(width: isActive ? .infinity : 60, height: 60)
        .background(isActive ? .purple.opacity(1) : .clear)
        .cornerRadius(30)
    }
}
