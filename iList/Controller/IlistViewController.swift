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

 
    //Interacting with the model.
    var row0Item: IListDataSource
    
    //Setup the required initialization. when the view inilized from the storyboard.s
    required init?(coder aDecoder: NSCoder) {
   row0Item = IListDataSource()
        row0Item.text = " Take  a jog"
       super.init(coder: aDecoder)
    }
    
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell =  tableView.dequeueReusableCell(withIdentifier: "CheckListItem", for: indexPath)
        
        //Find the label sing tag property.
        if let label = cell.viewWithTag(1000) as? UILabel {
            
            //Check for the row of the cell.
          if indexPath.row  == 0 {
                label.text = row0Item.text
            } else if  indexPath.row % 4 == 0 {
                label.text = " Watch a movie"
            }  else if indexPath.row % 3 == 0 {
                label.text = "Code an app"
            }  else if indexPath.row % 2 == 0 {
                label.text = "Walk the Dog"
            }  else if indexPath.row % 1 == 0 {
                label.text = "Study the design pattern"
            }
            else {
                label.text = " Sleep"
            }
        }
        
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
    
    func configureCheckMark(for cell: UITableViewCell, at indexPath: IndexPath) {
       
        if indexPath.row == 0 {
            if row0Item.checkItems {
                cell.accessoryType = .none
            } else {
                cell.accessoryType = .checkmark
            }
            
            row0Item.checkItems = !row0Item.checkItems
            
        } else {
            if cell.accessoryType == .none {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
    }
        
   }

}
