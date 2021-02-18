//
//  ButtonViewControlller.swift
//  Lesson 11
//
//  Created by Левон on 19.10.2020.
//

import UIKit
@IBDesignable
class ButtonViewControlller: UIView {
    
    @IBInspectable var frameWidth: CGFloat = 100{
        didSet{layoutIfNeeded()}
    }
    @IBInspectable var frameHeight: CGFloat = 50{
        didSet{layoutIfNeeded()}
    }
        @IBInspectable  var borderWidth: CGFloat = 100{
        didSet{rectangle.layer.borderWidth = borderWidth}
    }
        @IBInspectable  var shadowColor: UIColor = .black{
        didSet{rectangle.layer.shadowColor = shadowColor.cgColor}
    }
    @IBInspectable  var shadowOffset: CGSize = CGSize(width: 0, height: 0){
        didSet{rectangle.layer.shadowOffset = shadowOffset}
    }
    @IBInspectable  var shadowOpacity: CGFloat = 0{
        didSet{rectangle.layer.shadowOpacity = Float(shadowOpacity)}
    }
    @IBInspectable var cornerRadius: CGFloat = 0{
        didSet{rectangle.layer.cornerRadius = cornerRadius}
    }
    @IBInspectable var shadowRadius: CGFloat = 0{
        didSet{rectangle.layer.shadowRadius = shadowRadius}
    }
    @IBInspectable var ChangeColor: UIColor = .blue{
        didSet {layoutIfNeeded()}
    }
    var label = UILabel()
    private let rectangle = UIView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let h = frame.size.height
        rectangle.frame = CGRect(x: 70, y: h/2, width: frameWidth, height: frameHeight)
        rectangle.backgroundColor = ChangeColor
        
        addSubview(rectangle)
    }
}
