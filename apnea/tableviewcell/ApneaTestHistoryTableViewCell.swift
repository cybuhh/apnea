//
//  ApneaTestHistoryTableViewCell.swift
//  apnea
//
//  Created by matcybur on 24/01/2018.
//  Copyright © 2018 cybuhh. All rights reserved.
//

import UIKit

class ApneaTestHistoryTableViewCell: UITableViewCell {

    @IBOutlet weak var intervalLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
