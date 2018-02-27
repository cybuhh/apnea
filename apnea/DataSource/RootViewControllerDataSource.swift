//
//  RootViewControllerDataSource.swift
//  apnea
//
//  Created by matcybur on 27/02/2018.
//  Copyright © 2018 cybuhh. All rights reserved.
//

import Foundation
import UIKit

class RootViewControllerDataSource: NSObject, UITableViewDataSource {
    let viewModel: RootViewModel
    
    init(viewModel: RootViewModel) {
        self.viewModel = viewModel
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RootMenuCell", for: indexPath)
        
        let menuItem = viewModel.rows[indexPath.row]
        cell.textLabel?.text = menuItem.text
        
        return cell
    }
}

