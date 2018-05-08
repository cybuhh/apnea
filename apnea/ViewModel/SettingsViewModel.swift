//
//  SettingsViewModel.swift
//  apnea
//
//  Created by matcybur on 27/02/2018.
//  Copyright © 2018 cybuhh. All rights reserved.
//

import Foundation

struct SettingsMenuItem {
    var text: String
    var value: Int
    var storeKey: SettingsDataStore.StoreKeys
}

struct SettingsSectionItem {
    let text: String
    let rows: [SettingsMenuItem]
}

class SettingsViewModel {
    let dataStore = SettingsDataStore()
    var rows: Array<SettingsSectionItem>

    init() {
        rows = [
            SettingsSectionItem(
                text: "Current Max Breath Hold",
                rows: [
                    SettingsMenuItem(text: "Time",
                                     value: dataStore.get(forType: SettingsDataStore.StoreKeys.MaxTime),
                                     storeKey: SettingsDataStore.StoreKeys.MaxTime)
                ]
            ),
            SettingsSectionItem(
                text: "CO2/O2 Table",
                rows: [
                    SettingsMenuItem(text: "Rounds",
                                     value: dataStore.get(forType: SettingsDataStore.StoreKeys.Rounds),
                                     storeKey: SettingsDataStore.StoreKeys.Rounds),
                    SettingsMenuItem(text: "Respiration start time",
                                     value: dataStore.get(forType: SettingsDataStore.StoreKeys.RespirationStart),
                                     storeKey: SettingsDataStore.StoreKeys.RespirationStart),
                    SettingsMenuItem(text: "Respiration decrese time",
                                     value: dataStore.get(forType: SettingsDataStore.StoreKeys.DecraseTime),
                                     storeKey: SettingsDataStore.StoreKeys.DecraseTime)
                ]
            )
        ]
    }
}

