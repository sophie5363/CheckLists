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
}


class AddItemViewController: UITableViewController, AddItemViewControllerDelegate {
    func addItemViewController(_ controller: AddItemViewController, didFinishAddingItem item: CheckListItem) {
        
    }
    
    func addItemViewControllerDidCancel(_ controller: AddItemViewController) {
        
    }
    
    
    
    //MARK: - VARIABLES

   
    
    //MARK: - LIFECYCLE METHODS
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        let controller = ChecklistViewController()
        controller.delegate = self
        print(tableViewCellText.text!)
//        dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ouvertureAddItemVC" {
            let dest = segue.destination as! ChecklistViewController
            dest.delegate = self
        }
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
