//
//  HistoryTrainingViewController.swift
//  apnea
//
//  Created by cybuhh on 21/01/2018.
//  Copyright © 2018 cybuhh. All rights reserved.
//

import UIKit
import JTAppleCalendar

class HistoryCO2TrainingViewController: UIViewController  {
    //let viewModel = HistoryCO2TrainingViewModel()
    //var viewControllerDataSource: HistoryCO2TrainingViewControllerDataSource?
    //var viewControllerDelegate: HistoryCO2TrainingViewControllerDelegate?
  
  @IBOutlet weak var calendarView: JTAppleCalendarView!
  let formatter = DateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()
        calendarView.calendarDelegate = self
        calendarView.calendarDataSource = self
        //viewControllerDataSource = HistoryCO2TrainingViewControllerDataSource(viewModel: viewModel)
        //viewControllerDelegate = HistoryCO2TrainingViewControllerDelegate(viewModel: viewModel, didSelectCallback: { [weak self] (segueName) in
        //    self?.performSegue(withIdentifier: segueName, sender: nil)
        //})
        
        //tableView.dataSource = viewControllerDataSource
        //tableView.delegate = viewControllerDelegate
    }
}

extension HistoryCO2TrainingViewController: JTAppleCalendarViewDelegate, JTAppleCalendarViewDataSource {
  func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
    let myCustomCell = cell as! HistoryCalendarCellCollectionViewCell

    // Setup Cell text
    myCustomCell.dateLabel.text = cellState.text
    
    // Setup text color
    if cellState.dateBelongsTo == .thisMonth {
      myCustomCell.dateLabel.textColor = UIColor.black
    } else {
      myCustomCell.dateLabel.textColor = UIColor.gray
    }
  }
  
  func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
    let cell = calendar.dequeueReusableCell(withReuseIdentifier: "HistoryCalendarCell", for: indexPath) as! HistoryCalendarCellCollectionViewCell
    cell.dateLabel.text = cellState.text
    // self.calendar(calendar, willDisplay: cell, forItemAt: date, cellState: cellState, indexPath: indexPath)
    return cell
  }
  
  func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
    formatter.dateFormat = "yyyy MM dd"
    formatter.timeZone = Calendar.current.timeZone
    formatter.locale = Calendar.current.locale
    
    let startDate = formatter.date(from: "2018 06 01")!
    let endDate = formatter.date(from: "2018 06 30")!

    let parameters = ConfigurationParameters(startDate: startDate, endDate: endDate)
    return parameters
  }
  
  
}
