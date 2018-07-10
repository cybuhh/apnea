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
  
  // let dateFormatter = DateFormatter()
  
  func updateChartWithData() {
    var lineChartEntries = [ChartDataEntry]()
    var barChartEntries = [BarChartDataEntry]()
    for i in 0..<viewModel.rows.count {
      lineChartEntries.append(ChartDataEntry(x: Double(i), y: Double(viewModel.rows[i].interval)))
      barChartEntries.append(BarChartDataEntry(x: Double(i), y: Double(viewModel.rows[i].interval)))
    }
    let lineChartDataSet = LineChartDataSet(values: lineChartEntries, label: "foo")
    lineChartDataSet.axisDependency = .left
    lineChartDataSet.setColor(UIColor(red: 51/255, green: 181/255, blue: 229/255, alpha: 1))
    lineChartDataSet.setCircleColor(.white)
    lineChartDataSet.lineWidth = 2
    lineChartDataSet.circleRadius = 3
    lineChartDataSet.fillAlpha = 65/255
    lineChartDataSet.fillColor = UIColor(red: 51/255, green: 181/255, blue: 229/255, alpha: 1)
    lineChartDataSet.highlightColor = UIColor(red: 244/255, green: 117/255, blue: 117/255, alpha: 1)
    lineChartDataSet.drawCircleHoleEnabled = false
    
    let lineChartData = LineChartData(dataSet: lineChartDataSet)

    let barChartDataSet = BarChartDataSet(values: barChartEntries, label: "Units Sold")
    let barChartData = BarChartData(dataSet: barChartDataSet)

    chartView.data = lineChartData
    chartView.noDataText = "no data"
    chartView.chartDescription?.text = "foo bar chart"
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    viewControllerDataSource = HistoryApneaTestViewControllerDataSource(viewModel: viewModel)
    viewControllerDelegate = HistoryApneaTestViewControllerDelegate(viewModel: viewModel, didSelectCallback: { [weak self] (segueName) in
      self?.performSegue(withIdentifier: segueName, sender: nil)
    })
    
    tableView.dataSource = viewControllerDataSource
    tableView.delegate = viewControllerDelegate
    
    /*dateFormatter.dateFormat = "yyyy-MM-dd"
    dateFormatter.isLenient = true*/
    updateChartWithData()
  }
}
