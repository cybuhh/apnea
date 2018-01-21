//
//  SettingsViewController.swift
//  apnea
//
//  Created by cybuhh on 16/01/2018.
//  Copyright © 2018 cybuhh. All rights reserved.
//

import UIKit

struct SettingsSectionItem {
    let text: String
    let rows: [MenuItem]
}

struct SettingsViewModel {
    let rows = [SettingsSectionItem(text: "Current Max Breath Hold", rows: [
        MenuItem(text: "Time", segueName: "test")
        ])]
}

class SettingsViewController: UITableViewController {
    let viewModel = SettingsViewModel()
    
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsMenuCell", for: indexPath)
        
        let menuItem = viewModel.rows[indexPath.section].rows[indexPath.row]
        cell.textLabel?.text = menuItem.text
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // let menuItem = viewModel.rows[indexPath.row]
        // print(menuItem.segueName)
        // self.performSegue(withIdentifier: menuItem.segueName, sender: self)
    }
}
