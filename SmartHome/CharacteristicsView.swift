//
//  CharacteristicsView.swift
//  SmartHome
//
//  Created by Madeline Eckhart on 4/28/24.
//

import SwiftUI
import HomeKit

struct CharacteristicsView: View {
    @ObservedObject var model: SmartHomeModel

    var serviceId: UUID
    var accessoryId: UUID
    var homeId: UUID

    var body: some View {
        List {
            Section(header: HStack {
                Text("\(model.services.first(where: {$0.uniqueIdentifier == serviceId})?.name ?? "No Service Name Found") Characteristics")
            }) {
                ForEach(model.characteristics, id: \.uniqueIdentifier) { characteristic in
                    NavigationLink(value: characteristic) {
                        Text("\(characteristic.localizedDescription)")
                    }.navigationDestination(for: HMCharacteristic.self) {
                        Text($0.metadata?.description ?? "No metadata found")
                    }
                }
            }
        }.onAppear() {
            model.findCharacteristics(serviceId: serviceId, accessoryId: accessoryId, homeId: homeId)
        }
    }
}
