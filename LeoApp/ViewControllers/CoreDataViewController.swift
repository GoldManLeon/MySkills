//
//  CoreDataViewController.swift
//  LeoApp
//
//  Created by Левон on 02.12.2020.
//

import UIKit
import CoreData
class CoreDataViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var tasks: [Tasks] = []

    @IBOutlet weak var tableView: UITableView!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchREcuest: NSFetchRequest<Tasks> = Tasks.fetchRequest()
        do{
            tasks = try context.fetch(fetchREcuest)
        }catch let error as NSError{print(error.localizedDescription)}
    }

    //MARK: @IBAction

    @IBAction func button(sender: Any){

        let alertVc = UIAlertController(title: "Создайте что-нибудь", message: "Введите название текста", preferredStyle:.alert)
        alertVc.addTextField { (UITextField) in}

        let cancel = UIAlertAction(title: "Отменить", style: .destructive){_ in}
        alertVc.addAction(cancel)
        let add = UIAlertAction(title: "Добавить", style: .default){_ in

            let addText = (alertVc.textFields?.first)! as UITextField

            if let text = addText.text{
                self.saveTasks(with: text)
                self.tableView.reloadData()
            }
        }; alertVc.addAction(add); present(alertVc, animated: true, completion: nil)
    }

    func saveTasks(with title: String){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        guard let entity = NSEntityDescription.entity(forEntityName: "Tasks", in: context)else{return}

        let taskObjects = Tasks(entity: entity, insertInto: context)
        taskObjects.title = title
        do{
            try context.save()
            tasks.append(taskObjects)
        }catch let error as NSError{print(error.localizedDescription)}
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        let item = tasks[indexPath.row]
        cell.textLabel?.text = item.title
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete){
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            context.delete(tasks[indexPath.row])
            tasks.remove(at: indexPath.row)
          do{
          try context.save()
         }catch let error as NSError{print(error.localizedDescription)}
      }
   }
}
