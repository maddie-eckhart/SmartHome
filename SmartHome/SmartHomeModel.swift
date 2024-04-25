//
//  HomeStore.swift
//  SmartHome
//
//  Created by Madeline Eckhart on 4/27/24.
//

import Foundation
import HomeKit
import Combine

class SmartHomeModel: NSObject, ObservableObject, HMHomeManagerDelegate {
    
    @Published var homes: [HMHome] = []
    @Published var accessories: [HMAccessory] = []
    @Published var services: [HMService] = []
    @Published var characteristics: [HMCharacteristic] = []

    private var manager: HMHomeManager?

    override init() {
        super.init()

        guard manager != nil else {
            self.manager = .init()
            self.manager?.delegate = self
            return
        }
    }

    func homeManagerDidUpdateHomes(_ manager: HMHomeManager) {
        print("🥚: updated homes")
        if let homes = self.manager?.homes {
            self.homes = homes
        }
    }
    
    func findAccessories(homeId: UUID) {
        guard let devices = homes.first(where: {$0.uniqueIdentifier == homeId})?.accessories else {
            print("ERROR: No Accessory not found!")
            return
        }
        accessories = devices
    }
    
    func findServices(accessoryId: UUID, homeId: UUID){
        guard let accessoryServices = homes.first(where: {$0.uniqueIdentifier == homeId})?.accessories.first(where: {$0.uniqueIdentifier == accessoryId})?.services else {
            print("ERROR: No Services found!")
            return
        }
        services = accessoryServices
    }
    
    func findCharacteristics(serviceId: UUID, accessoryId: UUID, homeId: UUID){
        guard let serviceCharacteristics = homes.first(where: {$0.uniqueIdentifier == homeId})?.accessories.first(where: {$0.uniqueIdentifier == accessoryId})?.services.first(where: {$0.uniqueIdentifier == serviceId})?.characteristics else {
            print("ERROR: No Services found!")
            return
        }
        characteristics = serviceCharacteristics
    }
}
