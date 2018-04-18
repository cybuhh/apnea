//
//  HistoryApneaTestViewController.swift
//  apnea
//
//  Created by cybuhh on 21/01/2018.
//  Copyright © 2018 cybuhh. All rights reserved.
//

import UIKit

class HistoryApneaTestViewController: UITableViewController {
    let viewModel = HistoryApneaTestViewModel()
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
    }
}
