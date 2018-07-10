//
//  CO2TrainingViewController
//  apnea
//
//  Created by cybuhh on 18/02/2018.
//  Copyright © 2018 cybuhh. All rights reserved.
//

import UIKit
import MZTimerLabel
import AVFoundation

class CO2TrainingViewController: UIViewController, MZTimerLabelDelegate {
  var spokenTime = 0
  var activeRow = 0
  var co2TrainingTableViewDataSource: CO2TrainingTableViewDataSource?
  var stopwatch: MZTimerLabel!
  var co2TrainingHistoryDataStore: HistoryCO2TrainingDataStore!
  var viewModel: CO2TrainingViewModel!
  let trainingType = HistoryCO2TrainingType.co2
  
  @IBOutlet weak var timerLabel: UILabel!
  @IBOutlet weak var tableView: UITableView!
  
  @IBOutlet weak var startButton: UIButton!
  @IBOutlet weak var stopButton: UIButton!
  @IBOutlet weak var nextButton: UIButton!
  @IBOutlet weak var resetButton: UIButton!
  
  @IBAction func startButtonClicked(_ sender: UIButton) {
    startButton.isHidden = true
    stopButton.isHidden = false
    nextButton.isHidden = false
    resetButton.isHidden = true
    setActiveRound()
    stopwatch.start()
    UIApplication.shared.isIdleTimerDisabled = true
  }
  @IBAction func stopButtonClicked(_ sender: UIButton) {
    startButton.isHidden = true
    stopButton.isHidden = true
    nextButton.isHidden = true
    resetButton.isHidden = false
    stopwatch.pause()
    UIApplication.shared.isIdleTimerDisabled = false
  }
  @IBAction func nextButtonClicked(_ sender: UIButton) {
    stopwatch.pause()
    setActiveRound(atRow: activeRow + 1)
    stopwatch.start()
  }
  @IBAction func resetButtonClicked(_ sender: UIButton) {
    startButton.isHidden = false
    stopButton.isHidden = true
    nextButton.isHidden = false
    resetButton.isHidden = true
    setActiveRound(atRow: 0)
  }
  
  func setActiveRound(atRow row: Int? = nil) {
    if row != nil {
      activeRow = row!
    }
    
    if (activeRow < viewModel.count()) {
      let indexPath = IndexPath(row: activeRow, section: 0)
      tableView.scrollToRow(at: indexPath, at: UITableViewScrollPosition.top, animated: true)
      tableView.selectRow(at: indexPath, animated: true, scrollPosition: UITableViewScrollPosition.top)
      if (activeRow == tableView.numberOfRows(inSection: 0) - 1) {
        nextButton.isHidden = true
      }
      
      let interval = viewModel.getInterval(forRound: activeRow)
      stopwatch.reset()
      stopwatch.setCountDownTime(interval)
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let settingsDataStore = SettingsDataStore()
    viewModel = CO2TrainingViewModel(
      rounds: settingsDataStore.get(forType: .rounds),
      forApneaTime: settingsDataStore.get(forType: .maxTime),
      startingFromRespirationTime: settingsDataStore.get(forType: .respirationStart),
      withRespirationDecreaseTime: settingsDataStore.get(forType: .decraseTime)
    )
    
    co2TrainingHistoryDataStore = HistoryCO2TrainingDataStore()
    
    stopwatch = MZTimerLabel(label: timerLabel, andTimerType: MZTimerLabelTypeTimer)
    stopwatch.timeFormat = "mm:ss"
    stopwatch.delegate = self
    
    co2TrainingTableViewDataSource = CO2TrainingTableViewDataSource(viewModel: viewModel)
    tableView.dataSource = co2TrainingTableViewDataSource
    
    startButton.isHidden = false
    stopButton.isHidden = true
    nextButton.isHidden = true
    resetButton.isHidden = true
    
    setActiveRound(atRow: 0)
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    UIApplication.shared.isIdleTimerDisabled = false
  }
  
  func timerLabel(_ timerLabel: MZTimerLabel, finshedCountDownTimerWithTime countTime: TimeInterval){
    stopwatch.pause()
    NSLog("finshedCountDownTimerWithTime")
    if activeRow + 1 < viewModel.count() {
      setActiveRound(atRow: activeRow + 1)
      stopwatch.start()
    } else {
      co2TrainingHistoryDataStore.push(traningType: trainingType, withDate: Date())
      NSLog("rows: \(co2TrainingHistoryDataStore.get().count)")
      startButton.isHidden = true
      stopButton.isHidden = true
      nextButton.isHidden = true
      resetButton.isHidden = false
    }
  }
  
  func timerLabel(_ timerLabel: MZTimerLabel, countingTo time: TimeInterval, timertype: MZTimerLabelType) {
    let currentTime = Int(time)
    if (spokenTime != currentTime) {
      spokenTime = currentTime
      if (spokenTime % 60 == 0 ||
        spokenTime < 120 && spokenTime % 30 == 0 ||
        (spokenTime < 60 && spokenTime > 30) && spokenTime % 15 == 0 ||
        spokenTime < 30 && spokenTime % 10 == 0) {
        let utterance = AVSpeechUtterance(string: TimeIntervalFormater.sharedInstance.format(from: time, style: .full)!)
        utterance.rate = 0.4
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
        
        NSLog("\(currentTime)")
      }
    }
  }
}
