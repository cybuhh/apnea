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
    var storeKey: SettingsDataStore.storeKeys
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
                    SettingsMenuItem(text: "Time", value: dataStore.get(forType: SettingsDataStore.storeKeys.settingsMaxTime), storeKey: SettingsDataStore.storeKeys.settingsMaxTime)
                ]
            ),
            SettingsSectionItem(
                text: "CO2/O2 Table",
                rows: [
                    SettingsMenuItem(text: "Rounds", value: dataStore.get(forType: SettingsDataStore.storeKeys.settingsRounds), storeKey: SettingsDataStore.storeKeys.settingsRounds),
                    SettingsMenuItem(text: "Respiration start time", value: dataStore.get(forType: SettingsDataStore.storeKeys.settingsRespirationStart), storeKey: SettingsDataStore.storeKeys.settingsRespirationStart),
                    SettingsMenuItem(text: "Respiration decrese time", value: dataStore.get(forType: SettingsDataStore.storeKeys.settingsDecraseTime), storeKey: SettingsDataStore.storeKeys.settingsDecraseTime)
                ]
            )
        ]
    }
}

