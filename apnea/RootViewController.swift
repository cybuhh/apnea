//
//  MenuViewController.swift
//  apnea
//
//  Created by cybuhh on 16/01/2018.
//  Copyright © 2018 cybuhh. All rights reserved.
//

import UIKit

class RootViewModel {
    let rows = [
        MenuItem(text: "Apnea Test", segueName: "ApneaTest"),
        MenuItem(text: "History", segueName: "History"),
        MenuItem(text: "Settings", segueName: "Settings")
    ]
}

class RootViewController: UITableViewController {
    let viewModel = RootViewModel()
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.rows.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RootMenuCell", for: indexPath)
        
        let menuItem = viewModel.rows[indexPath.row]
        cell.textLabel?.text = menuItem.text

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let menuItem = viewModel.rows[indexPath.row]
        print(menuItem.segueName)
        self.performSegue(withIdentifier: menuItem.segueName, sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? ApneaTestViewController {
            controller.title = "fo"
        }
    }

}
