import UIKit
import RealmSwift
class ToDoListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //MARK: Variable

    var realm: Realm!

    var list: Results<RealmFile>{

        get {return realm.objects(RealmFile.self)}}
    
    //MARK: TableView

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        realm = try! Realm()
    }
    
    @IBAction func pluseButton(_ sender: Any) {
        let alertVc = UIAlertController(title: "Добавить текс", message: "Введите название текста", preferredStyle: .alert)
        alertVc.addTextField { (UITextField) in}
        let cancel = UIAlertAction(title: "Отменить", style: .destructive){_ in}
        alertVc.addAction(cancel)
        let add = UIAlertAction(title: "Добавить", style: .default){_ in
            let addText = (alertVc.textFields?.first)! as UITextField
           let newList = RealmFile()
            newList.name = addText.text!
            newList.acessory = false
            try! self.realm.write({
                self.realm.add(newList)
            })
            self.tableView.insertRows(at: [IndexPath.init(row: self.list.count-1, section: 0)], with: .automatic)
            }
        alertVc.addAction(add)
        present(alertVc, animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = list[indexPath.row]
        try! realm.write({
            item.acessory = !item.acessory
        })
        tableView.reloadRows(at: [indexPath], with: .automatic)
        }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
        }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
        }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        let item = list[indexPath.row]
        cell.textLabel?.text = item.name
        cell.accessoryType = item.acessory == true ? .checkmark: .none
        return cell
        }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            let item = list[indexPath.row]
            try! realm.write({
                self.realm.delete(item)
            })
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
