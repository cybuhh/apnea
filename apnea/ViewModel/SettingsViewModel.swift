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
                SettingsMenuItem(text: "Time", value: 0)
            ]
        ),
        SettingsSectionItem(
            text: "CO2/O2 Table",
            rows: [
                SettingsMenuItem(text: "Rounds", value: 0),
                SettingsMenuItem(text: "Respiration start time", value: 0),
                SettingsMenuItem(text: "Respiration decrese time", value: 0)
            ]
        )
    ]
}

