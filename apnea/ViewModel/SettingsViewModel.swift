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
  var type: UISettingsType? = UISettingsType.value
  var value: Int?
  var storeKey: SettingsDataStore.StoreKeys

  init(text: String, type: UISettingsType, value: Int, storeKey: SettingsDataStore.StoreKeys) {
    self.text = text
    self.value = value
    self.type = type
    self.storeKey = storeKey
  }
  
  init(text: String, value: Int, storeKey: SettingsDataStore.StoreKeys) {
    self.text = text
    self.value = value
    self.storeKey = storeKey
  }
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
                                     type: UISettingsType.interval,
                                     value: dataStore.get(forType: SettingsDataStore.StoreKeys.MaxTime),
                                     storeKey: SettingsDataStore.StoreKeys.MaxTime)
                ]
            ),
            SettingsSectionItem(
                text: "CO2/O2 Table",
                rows: [
                    SettingsMenuItem(text: "Rounds",
                                     type: UISettingsType.value,
                                     value: dataStore.get(forType: SettingsDataStore.StoreKeys.Rounds),
                                     storeKey: SettingsDataStore.StoreKeys.Rounds),
                    SettingsMenuItem(text: "Respiration start time",
                                     type: UISettingsType.interval,
                                     value: dataStore.get(forType: SettingsDataStore.StoreKeys.RespirationStart),
                                     storeKey: SettingsDataStore.StoreKeys.RespirationStart),
                    SettingsMenuItem(text: "Respiration decrese time",
                                     type: UISettingsType.interval,
                                     value: dataStore.get(forType: SettingsDataStore.StoreKeys.DecraseTime),
                                     storeKey: SettingsDataStore.StoreKeys.DecraseTime)
                ]
            )
        ]
    }
}

