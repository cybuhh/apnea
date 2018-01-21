//
//  HistoryTrainingTestViewController.swift
//  apnea
//
//  Created by cybuhh on 21/01/2018.
//  Copyright © 2018 cybuhh. All rights reserved.
//

import UIKit

struct TrainingHistoryCell {
    let text: String
}

class TrainingHistoryViewModel {
    let rows = [ApneaHistoryCell(text: "test TrainingHistoryViewModel")]
}

class HistoryTrainingtViewController: UITableViewController {
    let viewModel = TrainingHistoryViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.rows.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryTrainingTestCell", for: indexPath)
        
        let menuItem = viewModel.rows[indexPath.row]
        cell.textLabel?.text = menuItem.text
        
        return cell
    }
}

