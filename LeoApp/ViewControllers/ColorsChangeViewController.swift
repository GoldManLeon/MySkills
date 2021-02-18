//
//  ColorsChangeViewController.swift
//  LeoApp
//
//  Created by Левон on 09.12.2020.
//

import UIKit

class ColorsChangeViewController: UIViewController {

    //MARK: Variable
    
    var color = UIColor()
    var FrendVc: ColorsContainerViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: IBAction
    
    @IBAction func greenButton(_ sender: Any) {
        FrendVc?.view.backgroundColor = UIColor.green
    }
    @IBAction func blueButton(_ sender: Any) {
        FrendVc?.view.backgroundColor = UIColor.blue
    }
    @IBAction func redButton(_ sender: Any) {
        FrendVc?.view.backgroundColor = UIColor.red
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ColorsContainerViewController, segue.identifier == "cell"{
            vc.delegate = self
            FrendVc = vc
        }
    }
}
    extension ColorsChangeViewController: ChangeColorDelegate{
        func changeColor(_ color: UIColor) {
            self.color = color
            view.backgroundColor = color
        }
    }






