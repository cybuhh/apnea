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
  
  func getStepperCell(tableView: UITableView, indexPath: IndexPath, menuItem: SettingsMenuItem) -> SettingsStepperTableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCellStepper", for: indexPath) as! SettingsStepperTableViewCell

    if (menuItem.type == .interval) {
      cell.valueLabel?.setInterval(to: TimeInterval(menuItem.value))
    } else {
      cell.valueLabel?.text = "\(menuItem.value)"
    }
    cell.valueStepper?.value = Double(menuItem.value)
    
    cell.valueStepper?.type = menuItem.type
    cell.valueStepper?.storeKey = menuItem.storeKey
    cell.typeLabel?.text = menuItem.text
    return cell;
    
  }
  
  func getSwitchCell(tableView: UITableView, indexPath: IndexPath, menuItem: SettingsMenuItem) -> SettingsSwitchTableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCellSwitch", for: indexPath) as! SettingsSwitchTableViewCell

    cell.typeLabel?.text = menuItem.text
    cell.valueLabel?.text = (menuItem.value == 0 ? "off" : "on")
    cell.valueSwitch?.type = menuItem.type
    cell.valueSwitch?.storeKey = menuItem.storeKey
    cell.valueSwitch?.setOn(menuItem.value == 1, animated: true)
    cell.valueSwitch?.cbFn = changeColorSchema

    return cell;
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let menuItem:SettingsMenuItem = viewModel.rows[indexPath.section].rows[indexPath.row]
    
    let cell = menuItem.type == .option ?
      getSwitchCell(tableView: tableView, indexPath: indexPath, menuItem: menuItem) : getStepperCell(tableView: tableView, indexPath: indexPath, menuItem: menuItem)
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    // let menuItem = viewModel.rows[indexPath.row]
    // print(menuItem.segueName)
    // self.performSegue(withIdentifier: menuItem.segueName, sender: self)
  }
}
