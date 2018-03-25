//
//  ApneaTestViewController.swift
//  apnea
//
//  Created by cybuhh on 16/01/2018.
//  Copyright © 2018 cybuhh. All rights reserved.
//

import UIKit
import MZTimerLabel
import AVFoundation

class ApneaTestViewController: UIViewController {
    var stopwatch: MZTimerLabel!
    var apenaHistoryDataStore: ApneaHistoryDataStore!
    let dateFormater=DateComponentsFormatter()

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
        
        let newInterval = stopwatch.getTimeCounted()
        let utterance = AVSpeechUtterance(string: dateFormater.string(from: newInterval)!)
        utterance.rate = 0.4
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
    }
    
    @IBAction func resetButtonClicked(_ sender: UIButton) {
        stopwatch.reset()
        startButton.isHidden = false
        stopButton.isHidden = true
        saveButton.isHidden = true
        resetButton.isHidden = true
    }
    
    @IBAction func saveButtonClicked(_ sender: UIButton) {
        saveButton.isHidden = true
        apenaHistoryDataStore.push(newInterval: stopwatch.getTimeCounted(), withDate: Date())
        print("rows: \(apenaHistoryDataStore.get().count)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dateFormater.unitsStyle = .full
        dateFormater.allowedUnits = [.minute, .second]
        dateFormater.zeroFormattingBehavior = [ .dropAll ]

        apenaHistoryDataStore = ApneaHistoryDataStore()

        stopwatch = MZTimerLabel(label: stoptimerLabel)
        stopwatch.timeFormat = "mm:ss"

        startButton.isHidden = false
        stopButton.isHidden = true
        saveButton.isHidden = true
        resetButton.isHidden = true
    }
}

