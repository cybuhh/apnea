//
//  RootViewControllerDelegate.swift
//  apnea
//
//  Created by matcybur on 27/02/2018.
//  Copyright © 2018 cybuhh. All rights reserved.
//

import Foundation
import UIKit

class RootViewControllerDelegate: NSObject, UITableViewDelegate {
    let viewModel: RootViewModel
    let didSelectCallback: (String) -> ()
    
    init(viewModel: RootViewModel, didSelectCallback: @escaping (String) -> ()) {
        self.viewModel = viewModel
        self.didSelectCallback = didSelectCallback
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let menuItem = viewModel.rows[indexPath.row]
        self.didSelectCallback(menuItem.segueName)
    }
}
