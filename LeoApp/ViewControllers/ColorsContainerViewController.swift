//
//  ColorsContainerViewController.swift
//  LeoApp
//
//  Created by Левон on 09.12.2020.
//

import UIKit

//MARK: Delegate

protocol ChangeColorDelegate{
    func changeColor(_ color: UIColor)
}

class ColorsContainerViewController: UIViewController {

//MARK: Variable

    var delegate: ChangeColorDelegate?

    //MARK: IBAction
    
    @IBAction func greenContainerButton(_ sender: Any) {
        delegate?.changeColor(UIColor.green)
    }
    @IBAction func blueContainerButton(_ sender: Any) {
        delegate?.changeColor(UIColor.blue)
    }
    @IBAction func redContainerButton(_ sender: Any) {
        delegate?.changeColor(UIColor.red)
    }
}
