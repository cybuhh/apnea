//
//  MenuViewController.swift
//  apnea
//
//  Created by cybuhh on 16/01/2018.
//  Copyright © 2018 cybuhh. All rights reserved.
//

import UIKit

extension String {
    func localized() -> String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
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

