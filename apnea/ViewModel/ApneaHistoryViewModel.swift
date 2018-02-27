//
//  ApneaHistoryViewModel.swift
//  apnea
//
//  Created by matcybur on 27/02/2018.
//  Copyright © 2018 cybuhh. All rights reserved.
//

import Foundation

class ApneaHistoryViewModel {
    var rows: [ApneaHistoryEntry]
    
    init() {
        let apneaHistoryDataStore = ApneaHistoryDataStore()
        rows = apneaHistoryDataStore.get().map {
            ApneaHistoryEntry(interval: $0.interval, date: $0.date)
        }
    }
}

