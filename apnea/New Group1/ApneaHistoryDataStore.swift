//
//  ApneaHistoryDataStore.swift
//  apnea
//
//  Created by matcybur on 24/01/2018.
//  Copyright © 2018 cybuhh. All rights reserved.
//

import Foundation

struct ApneaHistoryEntry: Codable {
    var interval: TimeInterval
    var date: Date
}

class ApneaHistoryDataStore {
    let encoder = JSONEncoder()
    let decoder = JSONDecoder()
    let userDefaults = UserDefaults.standard
    
    private enum storeKeys: String {
        case historyApnea
    }
    
    func push(newInterval interval: TimeInterval, withDate date: Date) {
        var history = get()
        history.append(ApneaHistoryEntry(interval: interval, date: date))
        let jsonData = try! self.encoder.encode(history)
        userDefaults.set(jsonData, forKey: storeKeys.historyApnea.rawValue);
        userDefaults.synchronize()
    }
    
    func get() -> Array<ApneaHistoryEntry> {
        if let jsonData = userDefaults.data(forKey: storeKeys.historyApnea.rawValue) {
            return try! self.decoder.decode([ApneaHistoryEntry].self, from: jsonData)
        }
        return []
    }
}
