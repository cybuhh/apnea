//
//  CO2TrainingViewController
//  apnea
//
//  Created by cybuhh on 18/02/2018.
//  Copyright © 2018 cybuhh. All rights reserved.
//

import UIKit

class CO2TrainingViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    let viewModel = CO2TrainingViewModel()

    var co2TrainingTableViewDataSource: CO2TrainingTableViewDataSource?

    override func viewDidLoad() {
        super.viewDidLoad()
        co2TrainingTableViewDataSource = CO2TrainingTableViewDataSource(viewModel: viewModel)
        tableView.dataSource = co2TrainingTableViewDataSource
    }
}
