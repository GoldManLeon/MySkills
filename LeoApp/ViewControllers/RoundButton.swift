//
//  RoundButton.swift
//  LeoApp
//
//  Created by Левон on 20.11.2020.
//

import UIKit
@IBDesignable

class RoundButton: UIButton{
    
  @IBInspectable  var roundbutton: Bool = false{
        didSet{
            if roundbutton{
                layer.cornerRadius = frame.height / 2
            }
       }
    }
    override  func prepareForInterfaceBuilder() {
        if roundbutton{
            layer.cornerRadius = frame.height / 2
        }
    }
    
    
}
