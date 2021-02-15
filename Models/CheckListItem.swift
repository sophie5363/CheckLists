//
//  CheckListItem.swift
//  CheckLists
//
//  Created by Sophie Jacquot  on 15/02/2021.
//

import Foundation

class CheckListItem {
    var text: String
//    let checked: Bool
    
    let checked: Bool = {
        
            var checkedStatus = false
            
            return checkedStatus
        }()
    
    init(text: String){
        self.text = text

    }
    
    
    //fonction permettant de toggle checkmark ou pas checkmark sur une ligne de la liste
//    override func tableView(_ tableView: UITableView, didSelectRowAt: indexPath: IndexPath){
//
//        if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCellAccessoryType.checkmark {
//            tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCellAccessoryType.none
//        } else {
//            tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCellAccessoryType.checkmark
//        }
//    }
    
    
    
}
