//
//  ViewController.swift
//  CheckLists
//
//  Created by Sophie Jacquot  on 15/02/2021.
//

import UIKit

//let navVC = segue.destination as! UINavigationController
//           let destVC = navVC.topViewController as! ItemDetailViewController
  //         destVC.delegate = self
           
    //       let indexPath = tableView.indexPath(for: sender as! UITableViewCell)!
      //     destVC.itemToEdit = list.items[indexPath.row]


class ChecklistViewController: UITableViewController, Codable {
    
    //MARK: - PROPRIETES

    var tableauDeChecklistItems = [CheckListItem]()
    
    var delegate: ItemDetailViewControllerDelegate?
    
    var checkListCurrentlyEdited : CheckListItem?
    
    var documentDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
            let documentsDirectory = paths[0]
            return documentsDirectory
    }
    
    var dataFileUrl: URL {
        let fm = FileManager.default
        let urls = fm.urls(for: .documentDirectory, in: .userDomainMask)
        if let url = urls.first {
            var fileURL = url.appendingPathComponent("CheckLists")
            fileURL = fileURL.appendingPathExtension("json")
            return fileURL
        }
//        return url
    }
    
    required init?(coder: NSCoder) {
        //do sthg
    }
    
    
    
    
    //MARK: - LIFECYCLE FUNCTIONS
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let item1 = CheckListItem(text: "manger")
        let item2 = CheckListItem(text: "étudier")
        let item3 = CheckListItem(text: "travailler", checked: true)
        tableauDeChecklistItems.append(item1)
        tableauDeChecklistItems.append(item2)
        tableauDeChecklistItems.append(item3)
        
        
    }
    
    override func awakeFromNib() {
        // do sthg
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let nav = segue.destination as! UINavigationController
        let dest = nav.topViewController as! ItemDetailViewController
                if segue.identifier == "addItem" {
                    dest.delegate = self
                } else if segue.identifier == "editItem" {
                    checkListCurrentlyEdited = (sender as! CheckListItemCell).myItem
                    dest.itemToEdit = (sender as! CheckListItemCell).myItem
                    dest.delegate = self

                }
    }
    
    //MARK: IBACTIONS
    
    @IBAction func addDummyTodo(_ sender: UIBarButtonItem) {
        let itemDummy = CheckListItem(text: "Dummy")
        tableauDeChecklistItems.append(itemDummy)
        tableView.insertRows(at: [IndexPath(row: tableauDeChecklistItems.count-1, section: 0)], with: .automatic)
    }

}



extension ChecklistViewController {
    
    //Fonction qui permet de désélectionner une ligne sélectionnée
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
//        let item = tableauDeChecklistItems[indexPath.row]
//        item.toggleChecked()
        
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
}


//MARK: - HELPERS

func saveChecklistItems() {
    
}

func loadCheckListItems() {
    
}

func loadCheckListItems() {
    
}


extension ChecklistViewController {

                //MARK: - TABLEVIEW SETTINGS
    
    //Fonction qui détermine le nombre de lignes dans la liste
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tableauDeChecklistItems.count
    }
    
    
    //Fonction qui paramètre une cellule de la liste
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        
        configureCheckmark(for: cell, withItem: tableauDeChecklistItems[indexPath.row])
        
        configureText(for: cell, withItem: tableauDeChecklistItems[indexPath.row])
        
        (cell as! CheckListItemCell).myItem = tableauDeChecklistItems[indexPath.row]
        
        return cell
        
    }
    
   
    func configureCheckmark(for cell: UITableViewCell, withItem item: CheckListItem){

        if item.checked {
//            cell.accessoryType = .checkmark
            (cell as! CheckListItemCell).labelCheckMark.isHidden = false
            

        }   else {
            
            (cell as! CheckListItemCell).labelCheckMark.isHidden = true

        }
        
    }
    
    
    func configureText(for cell: UITableViewCell, withItem item: CheckListItem){
        cell.textLabel?.text = item.text
    }
    
    // Override to support conditional editing of the table view.
        override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
        {
            return true
        }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
      if editingStyle == .delete {

        self.tableauDeChecklistItems.remove(at: indexPath.row)
        self.tableView.deleteRows(at: [indexPath], with: .automatic)
      }
    }
    
}

extension ChecklistViewController: ItemDetailViewControllerDelegate {
    func ItemDetailViewControllerDidCancel(_ controller: ItemDetailViewController) {
        dismiss(animated: true, completion: nil)
        
    }
    
    func ItemDetailViewController(_ controller: ItemDetailViewController, didFinishAddingItem item: CheckListItem) {
        self.tableauDeChecklistItems.append(item)
        dismiss(animated: true, completion: nil)
        self.tableView.reloadData()
        
    }
    
    
    func ItemDetailViewController(_ controller: ItemDetailViewController, didFinishEditingItem item: CheckListItem){
        
        let itemRow = tableauDeChecklistItems.firstIndex { (val) -> Bool in
                    val === checkListCurrentlyEdited
                }
        tableauDeChecklistItems[itemRow!] = item
        dismiss(animated: true, completion: nil)
        self.tableView.reloadData()
    }
    
}



