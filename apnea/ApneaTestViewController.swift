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
    
    private enum storeKeys: String {
        case historyApnea
    }
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
        let history = defaults.array(forKey: storeKeys.historyApnea.rawValue) ?? []
        defaults.set(history + [timeCounted], forKey: storeKeys.historyApnea.rawValue);
        print("rows: \(defaults.array(forKey: storeKeys.historyApnea.rawValue)!.count)")
        defaults.synchronize()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaults = UserDefaults(suiteName: "history")
        stopwatch = MZTimerLabel(label: stoptimerLabel)
    }
    
    
}

