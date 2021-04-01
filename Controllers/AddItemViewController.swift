//
//  AddItemViewController.swift
//  CheckLists
//
//  Created by Sophie Jacquot  on 01/04/2021.
//

import UIKit

class AddItemViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBOutlet weak var tableViewCellText: UITextField!
    
    @IBAction func textFieldWrittenText(_ sender: UITextField) {
        print(self.tableViewCellText.text!)
    }
    

    @IBAction func didTapDoneButton(_ sender: UIBarButtonItem) {
        print(tableViewCellText.text!)
        dismiss(animated: true, completion: nil)
    }
}
