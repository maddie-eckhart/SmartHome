//
//  ServicesView.swift
//  SmartHome
//
//  Created by Madeline Eckhart on 4/28/24.
//

import SwiftUI
import HomeKit

struct ServicesView: View {
    
    @ObservedObject var model: SmartHomeModel

    var accessoryId: UUID
    var homeId: UUID
    
    var body: some View {
        
        List {
            Section(header: HStack {
                Text("\(model.accessories.first(where: {$0.uniqueIdentifier == accessoryId})?.name ?? "No Accessory Name Found") Services")
            }) {
                ForEach(model.services, id: \.uniqueIdentifier) { service in
                    NavigationLink(value: service) {
                        Text("\(service.localizedDescription)")
                    }.navigationDestination(for: HMService.self) {
                        CharacteristicsView(model: model, serviceId: $0.uniqueIdentifier, accessoryId: accessoryId, homeId: homeId)
                    }
                }
            }
        }.onAppear() {
            model.findServices(accessoryId: accessoryId, homeId: homeId)
        }
    }
}
