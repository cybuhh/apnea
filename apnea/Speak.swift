//
//  SpeakInterval.swift
//  apnea
//
//  Created by matcybur on 20/07/2018.
//  Copyright © 2018 cybuhh. All rights reserved.
//

import Foundation
import AVFoundation

class Speak {
  let synthesizer=AVSpeechSynthesizer()
  
  init() {
  }
  
  static let sharedInstance = Speak()
  
  func interval(_ interval: TimeInterval) {
    let utterance = AVSpeechUtterance(string:
      TimeIntervalFormater.sharedInstance.format(
        from: interval,
        style: DateComponentsFormatter.UnitsStyle.full)!)
    utterance.rate = 0.4
    utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
    
    synthesizer.speak(utterance)
  }

}
