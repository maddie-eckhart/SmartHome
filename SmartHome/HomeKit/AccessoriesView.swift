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
        VStack(alignment: .leading, spacing: 8) {
            Text("Accessories")
                .font(.title2)
                .padding(.bottom, 24)
            ForEach(model.accessories, id: \.uniqueIdentifier) { accessory in
                NavigationLink(
                    destination:
                        ServicesView(
                            model: model,
                            accessoryId: accessory.uniqueIdentifier,
                            homeId: homeId
                        ),
                    label: {
                        ListButton(
                            name: accessory.name,
                            backgroundColor: .orange
                        )
                    }
                )
                .buttonStyle(PlainButtonStyle())
            }

            Spacer()
        }
        .padding(.horizontal, 24)
        .onAppear() {
            model.findAccessories(homeId: homeId)
        }
    }
}
