//
//  TimeLabel.swift
//  apnea
//
//  Created by matcybur on 24/04/2018.
//  Copyright © 2018 cybuhh. All rights reserved.
//

import UIKit

class UITimeLabel: UILabel {
    let dateFormater=DateComponentsFormatter()

    override init(frame: CGRect) {
        super.init(frame: frame)
        dateFormater.unitsStyle = .full
        dateFormater.allowedUnits = [.minute, .second]
        dateFormater.zeroFormattingBehavior = [ .dropAll ]
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setInterval(to interval: TimeInterval) {
        self.text = dateFormater.string(from: interval)
    }
}
