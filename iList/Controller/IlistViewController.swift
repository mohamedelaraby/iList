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

    
    //Setup the required initialization. when the view inilized from the storyboard.s
    required init?(coder aDecoder: NSCoder) {
        
        //Init the IList data source instances.
        todosList = ToDoList()
        super.init(coder: aDecoder)
    }
    
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todosList.todos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell =  tableView.dequeueReusableCell(withIdentifier: "CheckListItem", for: indexPath)
        
        //Find the label sing tag property.
        if let label = cell.viewWithTag(1000) as? UILabel {
            
            label.text = todosList.todos[indexPath.row].text
            
        }
        //Display new data into the cell.
        configureCheckMark(for: cell, at: indexPath)
        
        return cell
}
    
    
//Setup the delegation method which interacting with the user touching the cell or the checkmark.
    
   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
    if let cell = tableView.cellForRow(at: indexPath) {
        
            configureCheckMark(for: cell, at: indexPath)
            //Deselect the row after the user tapping on the cell.
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
       
    }
    
    
    //For display new data in the cell because of the recycled cell still hold the old data.
    
    func configureCheckMark(for cell: UITableViewCell, at indexPath: IndexPath) {
       
         let isChecked = todosList.todos[indexPath.row].checkItems
        
                if isChecked {
                    cell.accessoryType = .none
                } else {
                    cell.accessoryType = .checkmark
                }
        
        todosList.todos[indexPath.row].checkItems = !isChecked
    }
        
}




