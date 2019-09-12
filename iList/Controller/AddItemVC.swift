/*
 
 [ Author ] :- Muhammed Alaraby
 [  Date ] :- 9/12/19
 [ Info ] :- Add new Todo item
 
 */

import UIKit

class AddItemVC: UITableViewController {
    
/*---------[ MARK:- IBOutlets ]---------------------------*/
    @IBOutlet weak var AddItemTextField: UITextField!
    
    

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
        print("Content of the text field is \(AddItemTextField.text!)")
        
        navigationController?.popViewController(animated: true)
    }
    
    
    // [ Cancel ] :- Return to the home screen
    @IBAction func cancel(_ sender: Any) {
       navigationController?.popViewController(animated: true)
    }
    

}

extension AddItemVC: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
}
