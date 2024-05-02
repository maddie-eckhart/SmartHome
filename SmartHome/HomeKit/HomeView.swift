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

    @StateObject var bluetoothManager = BluetoothManager()
    @State var path = NavigationPath()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("My Homes")
                .font(.title2)
                .padding(.vertical, 24)
            ForEach(model.homes, id: \.uniqueIdentifier) { home in
                NavigationLink(
                    destination:
                        AccessoriesView(
                            homeId: home.uniqueIdentifier,
                            model: model
                        ),
                    label: {
                        ListButton(
                            name: home.name,
                            backgroundColor: .green
                        )
                    }
                )
                .buttonStyle(PlainButtonStyle())
            }

            Spacer()
        }
        .padding(.horizontal, 24)
    }
}

#Preview {
    HomeView(model: SmartHomeModel())
}
