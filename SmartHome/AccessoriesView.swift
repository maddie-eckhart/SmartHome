//
//  AccessoriesView.swift
//  SmartHome
//
//  Created by Madeline Eckhart on 4/28/24.
//

import SwiftUI
import HomeKit

struct AccessoriesView: View {
    
    var homeId: UUID
    @ObservedObject var model: SmartHomeModel

    var body: some View {
        List {
            Section(header: HStack {
                Text("My Accessories")
            }) {
                ForEach(model.accessories, id: \.uniqueIdentifier) { accessory in
                    NavigationLink(value: accessory) {
                        Text("\(accessory.name)")
                    }.navigationDestination(for: HMAccessory.self) {
                        ServicesView(model: model, accessoryId: $0.uniqueIdentifier, homeId: homeId)
                    }
                }
            }
        }
        .onAppear() {
            model.findAccessories(homeId: homeId)
        }
    }
}
