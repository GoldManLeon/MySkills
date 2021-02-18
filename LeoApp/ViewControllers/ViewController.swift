//
//  ViewController.swift
//  LeoApp
//
//  Created by Левон on 12.11.2020.
//

import UIKit
class ViewController: UIViewController {
    var name = ""
    
    @IBOutlet weak var buttonWeather: UIButton!
    
   
    
    func setup(button: UIButton){
        button.layer.cornerRadius = 30
        button.layer.borderWidth = 2
        button.isHidden = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? WeatherViewController, segue.identifier == "cell"{
            vc.delegate = self
        }
    }
    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = true
        view.clipsToBounds = false
        view.layer.cornerRadius = 40
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        view.backgroundColor = .systemBlue
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setup(button: buttonWeather)
    }
    private func configureUI(){
        view.addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            containerView.topAnchor.constraint(equalTo: view.topAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
}
extension ViewController: WeatherViewControllerdelegate{
    func setName(name: String) {
        self.name = name
    }
}
