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
    var value: TimeInterval
}

struct SettingsSectionItem {
    let text: String
    let rows: [SettingsMenuItem]
}

struct SettingsViewModel {
    let rows = [
        SettingsSectionItem(
            text: "Current Max Breath Hold",
            rows: [
                SettingsMenuItem(text: "Time", value: SettingsDataStore.get(SettingsStoreKeys.settingsMaxTime))
            ]
        ),
        SettingsSectionItem(
            text: "CO2/O2 Table",
            rows: [
                SettingsMenuItem(text: "Rounds", value: SettingsDataStore.get(SettingsStoreKeys.settingsRounds)),
                SettingsMenuItem(text: "Respiration start time", value: SettingsDataStore.get(SettingsStoreKeys.settingsRespirationStart)),
                SettingsMenuItem(text: "Respiration decrese time", value: SettingsDataStore.get(SettingsStoreKeys.settingsDecraseTime))
            ]
        )
    ]
}

