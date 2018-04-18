//
//  TrainingHistoryViewModel.swift
//  apnea
//
//  Created by matcybur on 27/02/2018.
//  Copyright © 2018 cybuhh. All rights reserved.
//

import Foundation

enum HistoryCO2TrainingType: String, Codable {
    case co2, o2
}

struct HistoryCO2TrainingEntry: Codable {
    var type: HistoryCO2TrainingType
    var date: Date
}

class HistoryCO2TrainingViewModel {
    var rows: [HistoryCO2TrainingEntry]
    
    init() {
        let historyCO2TrainingDataStore = HistoryCO2TrainingDataStore()
        rows = historyCO2TrainingDataStore.get().map {
            HistoryCO2TrainingEntry(type: $0.type, date: $0.date)
        }
    }
}

