//
//  MenuViewController.swift
//  apnea
//
//  Created by cybuhh on 16/01/2018.
//  Copyright © 2018 cybuhh. All rights reserved.
//

import UIKit

class RootDataModel {
    
}

class SectionItem {
    let title: String
    let rows: [MenuItem]
}

class RootViewModel {
    var sectionItems: [SectionItem]?
    
    let dataModel= RootDataModel()
    
    func setup() {
        dataModel.fetchFromDatabase {
            sectionItems = ...
        }
        dataModel.fetchSomethingFromSoewgere {
            sectionItems = costam + ...
        }
    }
    
    let menuItems = [
        MenuItem(title: "Apnea Test", segueName: "ApneaTest"),
        MenuItem(title: "History", segueName: "History"),
        MenuItem(title: "Settings", segueName: "Settings")
    ]

}

class RootViewController: UITableViewController {
    let viewModel = RootViewModel
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath)
        
        let menuItem = menuItems[indexPath.row]
        cell.textLabel?.text = menuItem.title

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let menuItem = menuItems[indexPath.row]
        print(menuItem.segueName)
        self.performSegue(withIdentifier: menuItem.segueName, sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? ApneaTestViewController {
            controller.title = "fo"
        }
    }

}
