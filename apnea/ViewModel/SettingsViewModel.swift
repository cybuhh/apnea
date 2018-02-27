//
//  SettingsViewModel.swift
//  apnea
//
//  Created by matcybur on 27/02/2018.
//  Copyright © 2018 cybuhh. All rights reserved.
//

import Foundation

struct SettingsSectionItem {
    let text: String
    let rows: [MenuItem]
}

struct SettingsViewModel {
    let rows = [SettingsSectionItem(text: "Current Max Breath Hold", rows: [
        MenuItem(text: "Time", segueName: "test")
        ])]
}
