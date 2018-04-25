//
//  SettingsTableViewCell.swift
//  apnea
//
//  Created by matcybur on 24/04/2018.
//  Copyright © 2018 cybuhh. All rights reserved.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var valueLabel: UITimeLabel!
    @IBOutlet weak var valueStepper: UIStepper!
    
    @IBAction func stepperValueChanged(_ sender: UIStepper, forEvent event: UIEvent) {
        valueLabel.setInterval(to: sender.value)
        DispatchQueue.global(qos: .background).async(execute: curryIntervalValue(interval: sender.value))
    }
    
    func curryIntervalValue(interval: Double) -> (() -> ()) {
        return {
            print("New value \(interval)")
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
