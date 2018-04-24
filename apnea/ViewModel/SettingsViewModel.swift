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
                SettingsMenuItem(text: "Time", value: TimeInterval(1))
            ]
        ),
        SettingsSectionItem(
            text: "CO2/O2 Table",
            rows: [
                SettingsMenuItem(text: "Rounds", value: TimeInterval(2)),
                SettingsMenuItem(text: "Respiration start time", value: TimeInterval(3)),
                SettingsMenuItem(text: "Respiration decrese time", value: TimeInterval(4))
            ]
        )
    ]
}

