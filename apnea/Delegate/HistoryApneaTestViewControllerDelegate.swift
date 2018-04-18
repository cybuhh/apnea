//
//  HistoryApneaTestViewControllerDelegate.swif.swift
//  apnea
//
//  Created by cybuhh on 01/04/2018.
//  Copyright © 2018 cybuhh. All rights reserved.
//

import Foundation
import UIKit

class HistoryApneaTestViewControllerDelegate: NSObject, UITableViewDelegate {
    let viewModel: HistoryApneaTestViewModel
    let didSelectCallback: (String) -> ()
    
    init(viewModel: HistoryApneaTestViewModel, didSelectCallback: @escaping (String) -> ()) {
        self.viewModel = viewModel
        self.didSelectCallback = didSelectCallback
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let menuItem = viewModel.rows[indexPath.row]
        print(menuItem)
    }
}

