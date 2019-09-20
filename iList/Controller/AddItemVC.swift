/*
 
 [ Author ] :- Muhammed Alaraby
 [  Date ] :- 9/12/19
 [ Info ] :- Add new Todo item
 
 */

import UIKit

/*

 - [ AddItemViewControllerDelegate ] :- Manage add item process
 - [ addItemViewControllerDidCancel ] :- Check for cancel adding item
 - [ addItemViewController ] :- Check for finishing add item
*/
protocol AddItemViewControllerDelegate: class {
    func addItemViewControllerDidCancel ( _ controller: AddItemVC)
    func addItemViewController(_ controller: AddItemVC, didFinishAdding item: CheckListItem)
}


class AddItemVC: UITableViewController {
    
    // [ delegate ] :- Make this class the delegate of this protocol
    weak var delegate: AddItemViewControllerDelegate?
    
    
/*---------[ MARK:- IBOutlets ]---------------------------*/
    @IBOutlet weak var AddItemTextField: UITextField!
    @IBOutlet weak var cancelBarButton: UIBarButtonItem!
    @IBOutlet weak var addBarButton: UIBarButtonItem!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Disable the large title
        navigationItem.largeTitleDisplayMode = .never
    }

    
    
    override func viewWillAppear(_ animated: Bool) {
        AddItemTextField.becomeFirstResponder()
    }
    
    
    
/*---------[ MARK:- TAbleView Methods ]---------------------------*/
    
    // Diable  the selected row highlighted
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    
    

/*----------[ MARK:- Custom actions ]----------------*/
    
    // [ done ] :- Finishing add new item
    @IBAction func done(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        let item = CheckListItem()
        if let textFieldText = AddItemTextField.text {
            item.text  = textFieldText
            item.checkItem = false
            delegate?.addItemViewController(self, didFinishAdding: item)
        }
    }
    
    
    // [ Cancel ] :- Return to the home screen
    @IBAction func cancel(_ sender: Any) {
       navigationController?.popViewController(animated: true)
        delegate?.addItemViewControllerDidCancel(self)
    }
    

}

extension AddItemVC: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
}
