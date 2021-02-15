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
        
        //Fonction qui détermine le texte d'une cellule de la liste
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
            
//          Trouver le moyen de récupérer le texte dans le tableau à 2D
//            let cellText = self.tableauDeChecklistItems[indexPath.row]
//            cell.textLabel!.text = cellText
            
            
            cell.textLabel!.text = "texte de test"
            
//            cell.textLabel!.text = tableauDeChecklistItems[indexPath.row]
            
            return cell

        }
        
//        func configureCheckmark(for cell: UITableViewCell, withItem item: CheckListItem){
//
//            if CheckListItem.checked == true {
//                cell.AccessoryType == checkmark
//            }   else {
//
//            }
//
//            }
//
//        func configureText(for cell: UITableViewCell, withItem item: CheckListItem){
//
//
//                cell.textLabel!.text = ChecklistItem[]
//
//            }
        
        
    }
    
    




