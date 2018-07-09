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
      var calendar = Calendar.current
      calendar.locale = Locale(identifier: "en")
      dateFormater.calendar = calendar
      
      dateFormater.unitsStyle = .abbreviated
      dateFormater.allowedUnits = [.minute, .second]
      dateFormater.zeroFormattingBehavior = [ .dropAll ]
    }
    
    static let sharedInstance = TimeIntervalFormater()

  func format(from interval: TimeInterval, style unitsStyle: DateComponentsFormatter.UnitsStyle! = .abbreviated) -> String? {
    dateFormater.unitsStyle = unitsStyle
    return dateFormater.string(from: interval)
  }
}
