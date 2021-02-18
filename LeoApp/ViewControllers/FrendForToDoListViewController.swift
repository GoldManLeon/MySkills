//
//  FrendForToDoListViewController.swift
//  LeoApp
//
//  Created by Левон on 24.11.2020.
//

import UIKit

class FrendForToDoListViewController: UIViewController {

   //MARK: Variable
    
    @IBOutlet weak var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func addItem(_ sender: Any) {
        
        if textField.text != ""{
            list.append(textField.text!)
            textField.text = ""
        }
        
    }
    

}
