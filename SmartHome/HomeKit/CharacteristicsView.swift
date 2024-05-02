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
        VStack(alignment: .leading, spacing: 8) {
            Text("\(model.services.first(where: {$0.uniqueIdentifier == serviceId})?.name ?? "No Service Name Found") Characteristics")
                .font(.title2)
                .padding(.bottom, 24)
            ForEach(model.characteristics, id: \.uniqueIdentifier) { characteristic in
                
                NavigationLink(
                    destination:
                        Text(characteristic.metadata?.description ?? "No metadata found").padding(.horizontal, 24),
                    label: {
                        ListButton(
                            name: characteristic.localizedDescription,
                            backgroundColor: .teal
                        )
                    }
                )
                .buttonStyle(PlainButtonStyle())
            }
            
            Spacer()
        }
        .padding(.horizontal, 24)
        .onAppear() {
            model.findCharacteristics(serviceId: serviceId, accessoryId: accessoryId, homeId: homeId)
        }
    }
}
