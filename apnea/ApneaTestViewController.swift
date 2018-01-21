//
//  ApneaTestViewController.swift
//  apnea
//
//  Created by cybuhh on 16/01/2018.
//  Copyright © 2018 cybuhh. All rights reserved.
//

import UIKit
import MZTimerLabel

class ApneaTestViewController: UIViewController {
    var stopwatch: MZTimerLabel!
    var defaults: UserDefaults!
    
    @IBOutlet weak var stoptimerLabel: UILabel!
    
    @IBAction func startButtonClicked(_ sender: UIButton) {
        stopwatch.start()
    }
    @IBAction func stopButtonClicked(_ sender: UIButton) {
        stopwatch.pause()
    }
    
    @IBAction func resetButtonClicked(_ sender: UIButton) {
        stopwatch.reset()
    }
    
    @IBAction func saveButtonClicked(_ sender: UIButton) {
        let timeCounted = Int(stopwatch.getTimeCounted())
        let history = defaults.array(forKey: "history-apnea") ?? []
        defaults.set(history + [timeCounted], forKey: "history-apnea");
        print("rows: \(defaults.array(forKey: "history-apnea")!.count)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaults = UserDefaults(suiteName: "history")
        stopwatch = MZTimerLabel(label: stoptimerLabel)
    }
    
    
}

