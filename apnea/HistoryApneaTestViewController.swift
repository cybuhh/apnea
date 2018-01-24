//
//  HistoryApneaTestViewController.swift
//  apnea
//
//  Created by cybuhh on 21/01/2018.
//  Copyright © 2018 cybuhh. All rights reserved.
//

import UIKit

struct ApneaHistoryCell {
    let text: String
}

class ApneaHistoryViewModel {
    var rows: [ApneaHistoryCell]
    
    init() {
        let apneaHistoryDataStore = ApneaHistoryDataStore()
        rows = apneaHistoryDataStore.get().map {
            ApneaHistoryCell(text: "\($0)")
        }
    }
}

class HistoryApneaTestViewControllerDataSource: NSObject, UITableViewDataSource {
    let viewModel: ApneaHistoryViewModel
    
    init(viewModel: ApneaHistoryViewModel) {
        self.viewModel = viewModel
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryApneTestCell", for: indexPath)
        
        let menuItem = viewModel.rows[indexPath.row]
        cell.textLabel?.text = menuItem.text
        
        return cell
    }
}

class HistoryApneaTestViewControllerDelegate: NSObject, UITableViewDelegate {
    let viewModel: ApneaHistoryViewModel
    let didSelectCallback: (String) -> ()
    
    init(viewModel: ApneaHistoryViewModel, didSelectCallback: @escaping (String) -> ()) {
        self.viewModel = viewModel
        self.didSelectCallback = didSelectCallback
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let menuItem = viewModel.rows[indexPath.row]
        print(menuItem)
        //self.didSelectCallback(menuItem.segueName)
    }
}

class HistoryApneaTestViewController: UITableViewController {
    let viewModel = ApneaHistoryViewModel()
    var viewControllerDataSource: HistoryApneaTestViewControllerDataSource?
    var viewControllerDelegate: HistoryApneaTestViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllerDataSource = HistoryApneaTestViewControllerDataSource(viewModel: viewModel)
        viewControllerDelegate = HistoryApneaTestViewControllerDelegate(viewModel: viewModel, didSelectCallback: { [weak self] (segueName) in
            self?.performSegue(withIdentifier: segueName, sender: nil)
        })

        tableView.dataSource = viewControllerDataSource
        tableView.delegate = viewControllerDelegate

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.rows.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryApneTestCell", for: indexPath)

        let menuItem = viewModel.rows[indexPath.row]
        cell.textLabel?.text = menuItem.text

        return cell
    }
}
