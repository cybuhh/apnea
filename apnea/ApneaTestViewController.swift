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

    private enum storeKeys: String {
        case historyApnea
    }
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    @IBOutlet weak var stoptimerLabel: UILabel!
    
    @IBAction func startButtonClicked(_ sender: UIButton) {
        stopwatch.start()
        startButton.isHidden = true
        stopButton.isHidden = false
        saveButton.isHidden = true
        resetButton.isHidden = true
    }
    @IBAction func stopButtonClicked(_ sender: UIButton) {
        stopwatch.pause()
        startButton.isHidden = true
        stopButton.isHidden = true
        saveButton.isHidden = false
        resetButton.isHidden = false
    }
    
    @IBAction func resetButtonClicked(_ sender: UIButton) {
        stopwatch.reset()
        startButton.isHidden = false
        stopButton.isHidden = true
        saveButton.isHidden = true
        resetButton.isHidden = true
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
        startButton.isHidden = false
        stopButton.isHidden = true
        saveButton.isHidden = true
        resetButton.isHidden = true
    }
    
    
}

