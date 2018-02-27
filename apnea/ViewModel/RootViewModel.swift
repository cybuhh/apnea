//
//  RootViewModel.swift
//  apnea
//
//  Created by matcybur on 27/02/2018.
//  Copyright © 2018 cybuhh. All rights reserved.
//

import Foundation

class RootViewModel {
    let rows = [
        MenuItem(text: "Apnea Test".localized(), segueName: "ApneaTest"),
        MenuItem(text: "CO / O2 Training".localized(), segueName: "CO2Training"),
        MenuItem(text: "History".localized(), segueName: "History"),
        MenuItem(text: "Settings".localized(), segueName: "Settings")
    ]
}
