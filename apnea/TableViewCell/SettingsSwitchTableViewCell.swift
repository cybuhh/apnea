//
//  SettingsStepperTableViewCell
//  apnea
//
//  Created by matcybur on 24/04/2018.
//  Copyright © 2018 cybuhh. All rights reserved.
//

import UIKit

class SettingsSwitchTableViewCell: UITableViewCell {
  @IBOutlet weak var typeLabel: UILabel!
  @IBOutlet weak var valueLabel: UITimeLabel!
  @IBOutlet weak var valueSwitch: UISettingsSwitch!
  
  @IBAction func switchValueChanged(_ sender: UISettingsSwitch) {
    DispatchQueue.global(qos: .background).async(execute: currySwitchValue(value: sender.isOn, storeKey: sender.storeKey!))
    valueSwitch.cbFn?(sender.isOn)
    valueLabel.text = (sender.isOn) ? "on" : "off";
  }
    
  func currySwitchValue(value: Bool, storeKey: SettingsDataStore.StoreKeys) -> (() -> ()) {
    return {
      /* temporary shit */
      let dataStore = SettingsDataStore()
      dataStore.set(forType: storeKey, newValue: value)
      print("New value \(value) stored in \(storeKey)")
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
}
