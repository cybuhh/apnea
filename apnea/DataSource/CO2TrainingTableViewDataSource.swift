//
//  CO2TrainingViewControllerDataSource.swift
//  apnea
//
//  Created by matcybur on 27/02/2018.
//  Copyright © 2018 cybuhh. All rights reserved.
//

import Foundation
import UIKit

enum CO2TrainingActionTypes: String {
    case Respiration
    case Apnea
}

class CO2TrainingTableViewDataSource: NSObject, UITableViewDataSource {
    let viewModel: CO2TrainingViewModel
    
    init(viewModel: CO2TrainingViewModel) {
        self.viewModel = viewModel
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CO2TrainingCell", for: indexPath) as! CO2TrainingTableViewCell
        
        let tableItem = viewModel.rows[indexPath.row]
        cell.countLabel?.text = "\(tableItem.round)"
        cell.actionLabel?.text = indexPath.row%2 == 0 ? CO2TrainingActionTypes.Respiration.rawValue : CO2TrainingActionTypes.Apnea.rawValue
        cell.timeLabel?.text = TimeIntervalFormater.sharedInstance.format(from: tableItem.interval)
        
        return cell
    }
}
