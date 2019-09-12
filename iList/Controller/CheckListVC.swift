//
//  ViewController.swift
//  iList
//info: ilist view controller.
//
//  Created by: --> Muhammad Alaraby on 6/27/19.
//  Copyright © 2019 Winston. All rights reserved.
//

import UIKit

class CheckListVC: UITableViewController {

    //@todoList :- new ToDoList Object
    var todosList: ToDoList
    
    /*-------------------[ MARK:- Actions ]----------------------------------------*/

    // @addItem :- Add new todo item at the end of the table view
    @IBAction func addNewItem(_ sender: UIBarButtonItem) {
        let newRow = todosList.todos.count
        _ = todosList.newtTodo()
        let newIndexPath = [IndexPath(item: newRow, section: 0)]
        tableView.insertRows(at: newIndexPath, with: .automatic)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        //Init the IList data source instances.
        todosList = ToDoList()
        super.init(coder: aDecoder)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
       //Setup the navigation bar title.
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    

    /*--------------------[ MARK:- TableView data source ] --------------------------------------------------*/
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todosList.todos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // cell :- for reusable reason
        let cell =  tableView.dequeueReusableCell(withIdentifier: "CheckListItem", for: indexPath)

        //Get the iListCheckedItem.
        let item = todosList.todos[indexPath.row]
        
        //Update the text. && the check marks
        configurateText(for: cell, with: item)
        configureCheckMark(for: cell, with: item)
        
        return cell
}
    
    
    //Delete a todo item
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        todosList.todos.remove(at: indexPath.row)
        let indexPathes = [indexPath]
        tableView.deleteRows(at: indexPathes, with: .automatic)
    }
    
    /*---------------------------[ MARK:- TableView  delegation ] ----------------------------*/
//Setup the delegation method which interacting with the user touching the cell or the checkmark.
    
   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
    if let cell = tableView.cellForRow(at: indexPath) {
        
        let item = todosList.todos[indexPath.row]
        configureCheckMark(for: cell, with: item)
            //Deselect the row after the user tapping on the cell.
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
       
    }
    
    
     /*-------------------[ MARK:- Custom Methods ] --------------------------------*/
    //Update the text dynamically.
    func configurateText(for cell: UITableViewCell, with item: CheckListItem) {
        
        //Find the label using tag property.
        if let label = cell.viewWithTag(1000) as? UILabel {
            label.text = item.text
        }
    }
    
    //For display new data in the cell because of the recycled cell still hold the old data.
    func configureCheckMark(for cell: UITableViewCell, with item: CheckListItem) {
       
                if item.checkItem {
                    cell.accessoryType = .checkmark
                } else {
                    cell.accessoryType = .none
                }
        //Toggle the item checkmark
       item.toggleChecked()
    }
    
    
        
}




