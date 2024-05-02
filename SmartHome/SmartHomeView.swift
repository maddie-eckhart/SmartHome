//
//  SmartHomeView.swift
//  SmartHome
//
//  Created by Madeline Eckhart on 5/1/24.
//

import Foundation
import SwiftUI
import HomeKit

struct SmartHomeView: View {
    @State var path = NavigationPath()

    var body: some View {
        NavigationStack (path: $path) {
            VStack(spacing: 24) {

                NavigationLink(
                    destination: HomeView(model: SmartHomeModel()),
                    label: {
                        Text("HomeKit and Home Accessories")
                    }
                )
                
                NavigationLink(
                    destination: BluetoothView(),
                    label: {
                        Text("CoreBluetooth and BLEs")
                    }
                )
            }
        }
    }
}
