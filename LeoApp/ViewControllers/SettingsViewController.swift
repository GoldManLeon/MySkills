//
//  SettingsViewController.swift
//  LeoApp
//
//  Created by Левон on 09.12.2020.
//

import UIKit
struct SettingsOptions{
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)
}
class SettingsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(UITableView.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    var models = [SettingsOptions]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        title = "Settings"
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
     }
    
    func configure(){
        self.models = Array(0...100).compactMap({
            SettingsOptions(title: "Item \($0)", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemPink){
                
            }
        })
        
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        let cell  =  tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = model.title
        return cell
    }
  
}
