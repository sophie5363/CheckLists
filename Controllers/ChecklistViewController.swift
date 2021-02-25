//
//  ViewController.swift
//  CheckLists
//
//  Created by Sophie Jacquot  on 15/02/2021.
//

import UIKit


class ChecklistViewController: UIViewController {
    
    @IBOutlet var myTableView : UITableView!
    
    var tableauDeChecklistItems = [CheckListItem]()
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.tableView.delegate = self
//        self.tableView.dataSource = self
        
        
        let item1 = CheckListItem(text: "manger")
        let item2 = CheckListItem(text: "étudier")
        let item3 = CheckListItem(text: "travailler")
        tableauDeChecklistItems.append(item1)
        tableauDeChecklistItems.append(item2)
        tableauDeChecklistItems.append(item3)
    }
    
}
    
    extension ChecklistViewController: UITableViewDelegate {
        
        //Fonction qui permet de désélectionner une ligne sélectionnée
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
//        toggleChecked()

    }
    
    
    extension ChecklistViewController: UITableViewDataSource {
        
        
        //Fonction qui détermine le nombre de lignes dans la liste
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
            return tableauDeChecklistItems.count
            
        }
        
        //Fonction qui paramètre une cellule de la liste
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
            
            cell.textLabel?.text = tableauDeChecklistItems[indexPath.row].text
     
            return cell

        }
        
        func configureCheckmark(for cell: UITableViewCell, withItem item: CheckListItem){

//            if CheckListItem.checked == true {
//                cell.AccessoryType == checkmark
//            }   else {
//
//            }

            }

        func configureText(for cell: UITableViewCell, withItem item: CheckListItem){

            
        
        
    }
    
    }




