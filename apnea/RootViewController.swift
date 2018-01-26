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
    
class RootViewControllerDelegate: NSObject, UITableViewDelegate {
    let viewModel: RootViewModel
    let didSelectCallback: (String) -> ()
    
    init(viewModel: RootViewModel, didSelectCallback: @escaping (String) -> ()) {
        self.viewModel = viewModel
        self.didSelectCallback = didSelectCallback
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let menuItem = viewModel.rows[indexPath.row]
        print(menuItem.segueName)
        self.didSelectCallback(menuItem.segueName)
    }
}

class RootViewController: UITableViewController {
    let viewModel = RootViewModel()
    var rootViewControllerDelegate: RootViewControllerDelegate?
    var rootViewControllerDataSource: RootViewControllerDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rootViewControllerDelegate = RootViewControllerDelegate(viewModel: viewModel, didSelectCallback: { [weak self] (segueName) in
            self?.performSegue(withIdentifier: segueName, sender: nil)
        })
        rootViewControllerDataSource = RootViewControllerDataSource(viewModel: viewModel)
        tableView.delegate = rootViewControllerDelegate
        tableView.dataSource = rootViewControllerDataSource
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? ApneaTestViewController {
            controller.title = "fo"
        }
    }

}

