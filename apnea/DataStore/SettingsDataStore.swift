
//
//  SettingsDataStore.swift
//  apnea
//
//  Created by cybuhh on 26/04/2018.
//  Copyright © 2018 cybuhh. All rights reserved.
//

import Foundation

/*enum SettingsType: String, Codable {
    case maxTime, rouds, repirationStart, decreaseTime
}*/

enum SettingsStoreKeys: String {
    case settingsMaxTime
    case settingsRounds
    case settingsRespirationStart
    case settingsDecraseTime
}

class SettingsDataStore {
    let encoder = JSONEncoder()
    let decoder = JSONDecoder()
    let userDefaults = UserDefaults.standard
        
    func set(forType type: SettingsStoreKeys, newValue value: Date) {
        userDefaults.set(value, forKey: type.rawValue);
        userDefaults.synchronize()
    }
    
    func get(forType type: SettingsStoreKeys) -> Int {
        return userDefaults.integer(forKey: type.rawValue)
    }
}
