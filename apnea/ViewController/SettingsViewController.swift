//
//  SettingsViewController.swift
//  apnea
//
//  Created by cybuhh on 16/01/2018.
//  Copyright © 2018 cybuhh. All rights reserved.
//

import UIKit

class SettingsViewController: UITableViewController {
    let viewModel = SettingsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.rows[section].text
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.rows.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.rows[section].rows.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsMenuCell", for: indexPath) as! SettingsTableViewCell
        
        let menuItem = viewModel.rows[indexPath.section].rows[indexPath.row]
        cell.typeLabel?.text = menuItem.text
        cell.valueLabel?.setInterval(to: TimeInterval(menuItem.value))
        cell.valueStepper?.value = Double(menuItem.value)
        cell.valueStepper?.storeKey = menuItem.storeKey
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // let menuItem = viewModel.rows[indexPath.row]
        // print(menuItem.segueName)
        // self.performSegue(withIdentifier: menuItem.segueName, sender: self)
    }
}
