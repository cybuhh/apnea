//
//  ViewController.swift
//  apnea
//
//  Created by matcybur on 20/07/2018.
//  Copyright © 2018 cybuhh. All rights reserved.
//

import UIKit

func changeUIColors(usingSchema colorSchema: ColorSchema, forView view: UIView) {
  view.backgroundColor = colorSchema.background
  view.tintColor = colorSchema.text
  /*UILabel.appearance().backgroundColor = colorSchema.background
   UILabel.appearance().tintColor = colorSchema.text
   UISwitch.appearance().backgroundColor = colorSchema.background
   UISwitch.appearance().tintColor = colorSchema.text
   UIStepper.appearance().backgroundColor = colorSchema.background
   UIStepper.appearance().tintColor = colorSchema.text*/
}

struct AssociatedKeys {
  static var colorSchema: ColorSchema = ColorTheme.light
}

func objc_getAssociatedObject<T>(_ object: Any!, _ key: UnsafeRawPointer!, defaultValue: T) -> T {
  guard let value = objc_getAssociatedObject(object, key) as? T else {
    return defaultValue
  }
  return value
}

extension UIViewController {
  private(set) var colorSchema: ColorSchema {
    get {
      return objc_getAssociatedObject(self, &AssociatedKeys.colorSchema, defaultValue: ColorTheme.light)
    }
    set(newValue) {
      objc_setAssociatedObject(self, &AssociatedKeys.colorSchema, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
      changeUIColors(usingSchema: newValue, forView: view)
    }
  }
  
  func changeColorSchema (_ darkMode: Bool) -> Void {
    colorSchema = (darkMode) ? ColorTheme.dark : ColorTheme.light
  }
}

/*class ViewController: UIViewController {
  var colorSchema = ColorTheme.light {
    didSet {
      changeUIColors(usingSchema: colorSchema, forView: view)
    }
  }
  
  override func viewDidLoad() {
    changeUIColors(usingSchema: colorSchema, forView: view)
  }
}*/


/*class TableViewController: UITableViewController {
  var colorSchema = ColorTheme.light {
    didSet {
      changeUIColors(usingSchema: colorSchema, forView: view)
    }
  }
 
  override open func viewDidLoad() {
    changeUIColors(usingSchema: colorSchema, forView: view)
  }
}*/
