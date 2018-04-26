//
//  HistoryCO2TrainingViewControllerDataSource.swift
//  apnea
//
//  Created by cybuhh on 01/04/2018.
//  Copyright © 2018 cybuhh. All rights reserved.
//

import Foundation
import UIKit

class HistoryCO2TrainingViewControllerDataSource: NSObject, UITableViewDataSource {
    let viewModel: HistoryCO2TrainingViewModel
    
    init(viewModel: HistoryCO2TrainingViewModel) {
        self.viewModel = viewModel
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryCO2TrainingCell", for: indexPath) as! HistoryCO2TrainingTableViewCell
        
        let menuItem = viewModel.rows[indexPath.row]
        cell.dateLabel.text = DateFormatter.localizedString(
            from: menuItem.date,
            dateStyle: DateFormatter.Style.long,
            timeStyle: DateFormatter.Style.none)
        
        cell.typeLabel.text = menuItem.type.rawValue
        return cell
    }
}

