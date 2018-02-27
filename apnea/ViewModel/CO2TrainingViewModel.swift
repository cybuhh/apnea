//
//  TrainingViewModel.swift
//  apnea
//
//  Created by matcybur on 27/02/2018.
//  Copyright © 2018 cybuhh. All rights reserved.
//

import Foundation

struct CO2TrainingCell {
    let time: TimeInterval
}

class CO2TrainingViewModel {
    let rows = [11, 22, 33].map{
        CO2TrainingCell(time: $0)
    }
}
