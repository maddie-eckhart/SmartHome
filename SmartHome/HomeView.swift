//
//  ContentView.swift
//  SmartHome
//
//  Created by Madeline Eckhart on 4/25/24.
//

import SwiftUI
import HomeKit

struct HomeView: View {
    @ObservedObject var model: SmartHomeModel
    @State var path = NavigationPath()
        
        var body: some View {
            NavigationStack (path: $path) {
                List {
                    Section(header: HStack {
                        Text("My Homes")
                    }) {
                        ForEach(model.homes, id: \.uniqueIdentifier) { home in
                            NavigationLink(value: home) {
                                Text("\(home.name)")
                            }.navigationDestination(for: HMHome.self) {
                                AccessoriesView(homeId: $0.uniqueIdentifier, model: model)
                            }
                        }
                    }
                }
            }
        }
}

#Preview {
    HomeView(model: SmartHomeModel())
}
