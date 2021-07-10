//
//  Checklist.swift
//  CheckLists
//
//  Created by Sophie Jacquot  on 10/07/2021.
//

import Foundation

class Checklist {
    
    public var name: String
    public var items: [CheckListItem]
    
    init (name: String, items: [CheckListItem]?) {
        self.name = name
        self.items = items ?? []
    }
    
    
}
