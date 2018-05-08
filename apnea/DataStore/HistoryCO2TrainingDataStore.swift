//
//  HistoryCO2TrainingDataStore.swift
//  apnea
//
//  Created by matcybur on 24/01/2018.
//  Copyright © 2018 cybuhh. All rights reserved.
//

import Foundation

class HistoryCO2TrainingDataStore: AbstractHistoryDataStore {
    private enum storeKeys: String {
        case historyCO2Training
    }
    
    func push(traningType type: HistoryCO2TrainingType, withDate date: Date) {
        var history = get()
        history.append(HistoryCO2TrainingEntry(type: type, date: date))
        let jsonData = try! self.encoder.encode(history)
        userDefaults.set(jsonData, forKey: storeKeys.historyCO2Training.rawValue);
        userDefaults.synchronize()
    }
    
    func get() -> Array<HistoryCO2TrainingEntry> {
        if let jsonData = userDefaults.data(forKey: storeKeys.historyCO2Training.rawValue) {
            return try! self.decoder.decode([HistoryCO2TrainingEntry].self, from: jsonData)
        }
        return []
    }
}

