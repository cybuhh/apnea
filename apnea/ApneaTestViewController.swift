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
        defaults.set(timeCounted, forKey: "test");
        print("stored time: \(defaults.integer(forKey: "test"))")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaults = UserDefaults(suiteName: "history")
        stopwatch = MZTimerLabel(label: stoptimerLabel)
    }
    
    
}

