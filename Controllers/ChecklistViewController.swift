//
//  ViewController.swift
//  CheckLists
//
//  Created by Sophie Jacquot  on 15/02/2021.
//

import UIKit


class ChecklistViewController: UITableViewController {
    
    //MARK: - PROPRIETES

    var tableauDeChecklistItems = [CheckListItem]()
    
    var delegate: AddItemViewControllerDelegate?
    
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
        
        return cell
        
    }
    
   
    func configureCheckmark(for cell: UITableViewCell, withItem item: CheckListItem){

        if item.checked {
            cell.accessoryType = .checkmark

        }   else {
            cell.accessoryType = .none
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

extension ChecklistViewController: AddItemViewControllerDelegate {
    func addItemViewControllerDidCancel(_ controller: AddItemViewController) {
        dismiss(animated: true, completion: nil)
        
    }
    
    func addItemViewController(_ controller: AddItemViewController, didFinishAddingItem item: CheckListItem) {
        dismiss(animated: true, completion: nil)
        
    }
    
}



