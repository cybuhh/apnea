//
//  ColorSchema.swift
//  apnea
//
//  Created by matcybur on 26/01/2018.
//  Copyright © 2018 cybuhh. All rights reserved.
//

import Foundation
import UIKit

struct ColorSchema {
  var background: UIColor
  var text: UIColor
}

class ColorTheme {
  static let light = ColorSchema(background: .white, text: .black)
  static let dark = ColorSchema(background: .black, text: .white)
}
