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

class ApneaHistoryDataStore: UserDefaults {
    var encoder: JSONEncoder!
    var decoder: JSONDecoder!

    private enum storeKeys: String {
        case historyApnea
    }
    
    convenience init() {
        self.init(suiteName: "history")!
        self.encoder = JSONEncoder()
        self.decoder = JSONDecoder()
    }
    
    func push(newInterval interval: TimeInterval, withDate date: Date) {
        var history = self.get()
        history.append(ApneaHistoryEntry(interval: interval, date: date))
        let jsonData = try! self.encoder.encode(history)
        self.set(jsonData, forKey: storeKeys.historyApnea.rawValue);
        self.synchronize()
    }
    
    func get() -> Array<ApneaHistoryEntry> {
        if let jsonData = self.data(forKey: storeKeys.historyApnea.rawValue) {
            return try! self.decoder.decode([ApneaHistoryEntry].self, from: jsonData)
        }
        return []
    }
}
