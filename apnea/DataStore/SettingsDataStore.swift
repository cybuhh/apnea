
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

class SettingsDataStore: AbstractHistoryDataStore {
  enum StoreKeys: String {
        case MaxTime
        case Rounds
        case RespirationStart
        case DecraseTime
    }
    
    func set(forType type: StoreKeys, newValue value: Int) {
        userDefaults.set(value, forKey: type.rawValue)
        userDefaults.synchronize()
    }
    
    func get(forType type: StoreKeys) -> Int {
        return userDefaults.integer(forKey: type.rawValue)
    }
}
