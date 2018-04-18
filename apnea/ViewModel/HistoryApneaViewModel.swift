//
//  ApneaHistoryViewModel.swift
//  apnea
//
//  Created by matcybur on 27/02/2018.
//  Copyright © 2018 cybuhh. All rights reserved.
//

import Foundation

struct HistoryApneaTestEntry: Codable {
    var interval: TimeInterval
    var date: Date
}

class HistoryApneaTestViewModel {
    var rows: [HistoryApneaTestEntry]
    
    init() {
        let historyApneaTestDataStore = HistoryApneaTestDataStore()
        rows = historyApneaTestDataStore.get().map {
            HistoryApneaTestEntry(interval: $0.interval, date: $0.date)
        }
    }
}

