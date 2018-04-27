
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

class SettingsDataStore {
    let encoder = JSONEncoder()
    let decoder = JSONDecoder()
    let userDefaults = UserDefaults.standard
        
    enum storeKeys: String {
        case settingsMaxTime
        case settingsRounds
        case settingsRespirationStart
        case settingsDecraseTime
    }
    
    func set(forType type: storeKeys, newValue value: Int) {
        userDefaults.set(value, forKey: type.rawValue);
        userDefaults.synchronize()
    }
    
    func get(forType type: storeKeys) -> Int {
        return userDefaults.integer(forKey: type.rawValue)
    }
}
