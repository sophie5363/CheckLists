//
//  CheckListItem.swift
//  CheckLists
//
//  Created by Sophie Jacquot  on 15/02/2021.
//

import Foundation

class CheckListItem {
    var text: String
    var checked: Bool
    
    init(text: String, checked: Bool = false){
        self.text = text
        self.checked = checked
    }
    
    func toggleChecked(){
        checked = !checked
    }
}
