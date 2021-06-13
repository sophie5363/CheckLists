//
//  AddItemViewController.swift
//  CheckLists
//
//  Created by Sophie Jacquot  on 01/04/2021.
//

import UIKit

protocol AddItemViewControllerDelegate: class {
    func AddItemViewControllerDidCancel(_ controller: AddItemViewController)
    func AddItemViewControllerDone(_ controller: AddItemViewController, _ item: String)
}


class AddItemViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableViewCellText.becomeFirstResponder()
    }
    
    //MARK: - IBOutlets
    
    
    
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var tableViewCellText: UITextField!
    
    //MARK: - IBActions
    
    @IBAction func textFieldWrittenText(_ sender: UITextField) {
        print(self.tableViewCellText.text!)
    }
    
    
    @IBAction func done() {
        
        print(tableViewCellText.text!)
        dismiss(animated: true, completion: nil)
    }

}


extension AddItemViewController : UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let oldText = textField.text!
        let newString = oldText.replacingCharacters(in: Range(range, in: oldText)!, with: string)
        doneButton.isEnabled = newString.count > 0
        return true
    }
}
