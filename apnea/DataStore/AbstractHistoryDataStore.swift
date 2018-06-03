//
//  AbstractHistorydataStore.swift
//  apnea
//
//  Created by matcybur on 08/05/2018.
//  Copyright © 2018 cybuhh. All rights reserved.
//

import Foundation

class AbstractHistoryDataStore {
  let encoder = JSONEncoder()
  let decoder = JSONDecoder()
  let userDefaults = UserDefaults.standard
}
