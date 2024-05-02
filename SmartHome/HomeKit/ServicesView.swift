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
        
        VStack(alignment: .leading, spacing: 8) {
            Text("Services")
                .font(.title2)
                .padding(.bottom, 24)
            ForEach(model.services, id: \.uniqueIdentifier) { service in
                NavigationLink(
                    destination:
                        CharacteristicsView(
                            model: model,
                            serviceId: service.uniqueIdentifier,
                            accessoryId: accessoryId,
                            homeId: homeId
                        ),
                    label: {
                        ListButton(
                            name: service.localizedDescription,
                            backgroundColor: .yellow
                        )
                    }
                )
                .buttonStyle(PlainButtonStyle())
            }
            
            Spacer()
        }
        .padding(.horizontal, 24)
        .onAppear() {
            model.findServices(accessoryId: accessoryId, homeId: homeId)
        }
    }
}
