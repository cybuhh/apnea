//
//  HistoryTrainingViewController.swift
//  apnea
//
//  Created by cybuhh on 21/01/2018.
//  Copyright © 2018 cybuhh. All rights reserved.
//

import UIKit

class HistoryCO2TrainingViewController: UITableViewController  {
    let viewModel = HistoryCO2TrainingViewModel()
    var viewControllerDataSource: HistoryCO2TrainingViewControllerDataSource?
    var viewControllerDelegate: HistoryCO2TrainingViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllerDataSource = HistoryCO2TrainingViewControllerDataSource(viewModel: viewModel)
        viewControllerDelegate = HistoryCO2TrainingViewControllerDelegate(viewModel: viewModel, didSelectCallback: { [weak self] (segueName) in
            self?.performSegue(withIdentifier: segueName, sender: nil)
        })
        
        tableView.dataSource = viewControllerDataSource
        tableView.delegate = viewControllerDelegate
    }
}

