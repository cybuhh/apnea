//
//  HistoryApneaTestViewController.swift
//  apnea
//
//  Created by cybuhh on 21/01/2018.
//  Copyright © 2018 cybuhh. All rights reserved.
//

import UIKit
import Charts

class HistoryApneaTestViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var chartView: BarChartView!
  
    let viewModel = HistoryApneaTestViewModel()
    var viewControllerDataSource: HistoryApneaTestViewControllerDataSource?
    var viewControllerDelegate: HistoryApneaTestViewControllerDelegate?

    let dateFormatter = DateFormatter()
  
    override func viewDidLoad() {
      super.viewDidLoad()
      viewControllerDataSource = HistoryApneaTestViewControllerDataSource(viewModel: viewModel)
      viewControllerDelegate = HistoryApneaTestViewControllerDelegate(viewModel: viewModel, didSelectCallback: { [weak self] (segueName) in
          self?.performSegue(withIdentifier: segueName, sender: nil)
      })

      tableView.dataSource = viewControllerDataSource
      tableView.delegate = viewControllerDelegate

      dateFormatter.dateFormat = "yyyy-MM-dd"
      dateFormatter.isLenient = true
      
      var chartEntry = [ChartDataEntry]()
      for i in 0..<viewModel.rows.count {
        // dateFormatter.string(from: viewModel.rows[i].date)
        let value = ChartDataEntry(x: Double(i), y: viewModel.rows[i].interval)
        chartEntry.append(value)
      }
      let chartLine = LineChartDataSet(values: chartEntry, label: "foo")
      let chartData = LineChartData()
      chartData.addDataSet(chartLine)
      chartView.data = chartData
    }
}
