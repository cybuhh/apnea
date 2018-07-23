//
//  UISettingsSwitch.swift
//  apnea
//
//  Created by matcybur on 20/07/2018.
//  Copyright © 2018 cybuhh. All rights reserved.
//

import UIKit
import Foundation

class UISettingsSwitch: UISwitch {
  var storeKey: SettingsDataStore.StoreKeys?
  var type: UISettingsType?
  var cbFn: ((_: Bool) -> (Void))?
}
