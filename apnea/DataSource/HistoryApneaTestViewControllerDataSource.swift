//
//  HistoryApneaTestViewControllerDataSource.swift
//  apnea
//
//  Created by matcybur on 27/02/2018.
//  Copyright © 2018 cybuhh. All rights reserved.
//

import Foundation
import UIKit

class HistoryApneaTestViewControllerDataSource: NSObject, UITableViewDataSource {
    let viewModel: ApneaHistoryViewModel
    let dateFormater = DateComponentsFormatter()
    
    init(viewModel: ApneaHistoryViewModel) {
        self.viewModel = viewModel
        dateFormater.unitsStyle = .abbreviated
        dateFormater.allowedUnits = [.minute, .second]
        dateFormater.zeroFormattingBehavior = [ .dropAll ]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryApneTestCell", for: indexPath) as! ApneaTestHistoryTableViewCell
        
        let menuItem = viewModel.rows[indexPath.row]
        cell.dateLabel.text = DateFormatter.localizedString(
            from: menuItem.date,
            dateStyle: DateFormatter.Style.long,
            timeStyle: DateFormatter.Style.none)
        
        cell.intervalLabel.text = self.dateFormater.string(from: menuItem.interval)
        return cell
    }
}

