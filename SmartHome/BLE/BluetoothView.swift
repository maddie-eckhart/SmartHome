//
//  BluetoothView.swift
//  SmartHome
//
//  Created by Madeline Eckhart on 5/1/24.
//

import Foundation
import SwiftUI

struct BluetoothView: View {
    @StateObject var bluetoothManager = BluetoothManager()

    var body: some View {
        VStack {
            Text("Bluetooth is \(bluetoothManager.isBluetoothEnabled ? "enabled" : "disabled")")
                .padding()
            
            List(bluetoothManager.discoveredPeripherals, id: \.identifier) { peripheral in
                Text(peripheral.name ?? "Unknown")
            }
        }
    }
}
