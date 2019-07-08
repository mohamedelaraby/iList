//
//  ViewController.swift
//  iList
//info: ilist view controller.
//
//  Created by: --> Muhammad Alaraby on 6/27/19.
//  Copyright © 2019 Winston. All rights reserved.
//

import UIKit

class IlistViewController: UITableViewController {

//    todo list array.
    var todosList: ToDoList

    @IBAction func addItem(_ sender: UIBarButtonItem) {
        
        print("Added item")
    }
    
    //Setup the required initialization. when the view inilized from the storyboard.s
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
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todosList.todos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell =  tableView.dequeueReusableCell(withIdentifier: "CheckListItem", for: indexPath)

        //Get the iListCheckedItem.
        let item = todosList.todos[indexPath.row]
        //Update the text.
        configurateText(for: cell, with: item)
        
        //Display new data into the cell.
        configureCheckMark(for: cell, with: item)
        
        return cell
}
    
    
//Setup the delegation method which interacting with the user touching the cell or the checkmark.
    
   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
    if let cell = tableView.cellForRow(at: indexPath) {
        
        let item = todosList.todos[indexPath.row]
        configureCheckMark(for: cell, with: item)
            //Deselect the row after the user tapping on the cell.
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
       
    }
    
    
    
    //Update the text dynamically.
    func configurateText(for cell: UITableViewCell, with item: IListDataSource) {
        
        //Find the label sing tag property.
        if let label = cell.viewWithTag(1000) as? UILabel {
            label.text = item.text
        }
    }
    //For display new data in the cell because of the recycled cell still hold the old data.
    
    func configureCheckMark(for cell: UITableViewCell, with item: IListDataSource) {
       
                if item.checkItems {
                    cell.accessoryType = .none
                } else {
                    cell.accessoryType = .checkmark
                }
        //Access the checkItem property from the todo model.
        item.toggleChecked()
    }
        
}




