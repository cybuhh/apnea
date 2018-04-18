//
//  HistoryCO2TrainingViewControllerDelegate.swift
//  apnea
//
//  Created by cybuhh on 01/04/2018.
//  Copyright © 2018 cybuhh. All rights reserved.
//

import Foundation
import UIKit

class HistoryCO2TrainingViewControllerDelegate: NSObject, UITableViewDelegate {
    let viewModel: HistoryCO2TrainingViewModel
    let didSelectCallback: (String) -> ()
    
    init(viewModel: HistoryCO2TrainingViewModel, didSelectCallback: @escaping (String) -> ()) {
        self.viewModel = viewModel
        self.didSelectCallback = didSelectCallback
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let menuItem = viewModel.rows[indexPath.row]
        print(menuItem)
    }
}


