//
//  TimeIntervalFormater.swift
//  apnea
//
//  Created by matcybur on 25/04/2018.
//  Copyright © 2018 cybuhh. All rights reserved.
//

import Foundation

class TimeIntervalFormater {
    let dateFormater=DateComponentsFormatter()

    init() {
        dateFormater.unitsStyle = .abbreviated
        dateFormater.allowedUnits = [.minute, .second]
        dateFormater.zeroFormattingBehavior = [ .dropAll ]
    }
    
    static let sharedInstance = TimeIntervalFormater()

    func format(from interval: TimeInterval) -> String? {
        return dateFormater.string(from: interval)
    }
}
