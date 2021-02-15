//
//  ViewController.swift
//  CheckLists
//
//  Created by Sophie Jacquot  on 15/02/2021.
//

import UIKit

class ChecklistViewController: UITableViewController {
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath);
        cell.textLabel!.text = "texte de test"
        return cell
    
    
    }


}

