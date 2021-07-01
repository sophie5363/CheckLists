//
//  AddItemViewController.swift
//  CheckLists
//
//  Created by Sophie Jacquot  on 01/04/2021.
//

import UIKit

protocol AddItemViewControllerDelegate : AnyObject {
    func addItemViewControllerDidCancel(_ controller: AddItemViewController)
    func addItemViewController(_ controller: AddItemViewController, didFinishAddingItem item: CheckListItem)
    func addItemViewController(_ controller: AddItemViewController, didFinishEditingItem item: CheckListItem)
}


class AddItemViewController: UITableViewController {


    //MARK: - PROPRIETES
    
    var itemToEdit : CheckListItem?

    var delegate : AddItemViewControllerDelegate?
   
    
    //MARK: - LIFECYCLE METHODS
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if itemToEdit != nil {
            self.title = "Edit Item"
            tableViewCellText.text = itemToEdit!.text
            doneButton.isEnabled = true
        }
        
}
    
    override func viewWillAppear(_ animated: Bool) {
        tableViewCellText.becomeFirstResponder()
    }
    
    //MARK: - IBOUTLETS
 
    
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var tableViewCellText: UITextField!
    
    //MARK: - IBACTIONS
    
    @IBAction func textFieldWrittenText(_ sender: UITextField) {
        print(self.tableViewCellText.text!)
        
    }
    
    
    @IBAction func done() {
        if itemToEdit != nil {
            itemToEdit?.text = tableViewCellText.text!
            delegate?.addItemViewController(self, didFinishEditingItem: itemToEdit!)
        }
        else {
            delegate?.addItemViewController(self, didFinishAddingItem: CheckListItem(text: tableViewCellText.text!, checked: false))
        }
    }
    
    
    @IBAction func cancel(_ sender: Any) {
        delegate?.addItemViewControllerDidCancel(self)
        
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
