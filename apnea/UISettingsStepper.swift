//
//  UISettingsStepper.swift
//  apnea
//
//  Created by matcybur on 27/04/2018.
//  Copyright © 2018 cybuhh. All rights reserved.
//

import UIKit

enum UISettingsType {
  case interval
  case value
  case option
}

class UISettingsStepper: UIStepper {
  var storeKey: SettingsDataStore.StoreKeys?
  var type: UISettingsType?
}
