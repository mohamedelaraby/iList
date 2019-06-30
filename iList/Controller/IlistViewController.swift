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

 
    //Ilist Data source instances.
    var row0Item: IListDataSource
    var row1Item: IListDataSource
    var row2Item: IListDataSource
    var row3Item: IListDataSource
    var row4Item: IListDataSource
    var row5Item: IListDataSource

    
    //Setup the required initialization. when the view inilized from the storyboard.s
    required init?(coder aDecoder: NSCoder) {
        
        //Init the IList data source instances.
        row0Item = IListDataSource()
        row0Item.text = " Take a jog"
        
        row1Item = IListDataSource()
         row1Item.text = " Watch a movie"
        
        row2Item = IListDataSource()
        row2Item.text = "Code an app"
        
        row3Item = IListDataSource()
        row3Item.text = "Walk the Dog"
        
        row4Item = IListDataSource()
        row4Item.text = "Study the design pattern"
        
        row5Item = IListDataSource()
        row5Item.text = " Sleep"
    
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
                label.text = row1Item.text
            }  else if indexPath.row % 3 == 0 {
                label.text = row2Item.text
            }  else if indexPath.row % 2 == 0 {
                label.text = row3Item.text
            }  else if indexPath.row % 1 == 0 {
                label.text = row4Item.text
            }
            else {
                label.text = row5Item.text
            }
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
       
            if indexPath.row == 0 {
                if row0Item.checkItems {
                    cell.accessoryType = .none
                } else {
                    cell.accessoryType = .checkmark
                }
                
                row0Item.checkItems = !row0Item.checkItems
                
            } else if indexPath.row % 4 == 0 {
            
                if row1Item.checkItems {
                    cell.accessoryType = .none
                } else {
                    cell.accessoryType = .checkmark
                }
                
                row1Item.checkItems = !row1Item.checkItems
                
            } else if indexPath.row % 3 == 0 {
                
                    if row2Item.checkItems {
                        cell.accessoryType = .none
                    } else {
                        cell.accessoryType = .checkmark
                    }
                    
                    row2Item.checkItems = !row2Item.checkItems
                    
                } else if indexPath.row % 2 == 0 {
            
                    if row3Item.checkItems {
                        cell.accessoryType = .none
                    } else {
                        cell.accessoryType = .checkmark
                    }
                    
                    row3Item.checkItems = !row3Item.checkItems
                    
                } else if indexPath.row % 1 == 0 {
                
                    if row4Item.checkItems {
                        cell.accessoryType = .none
                    } else {
                        cell.accessoryType = .checkmark
                    }
                    
                    row4Item.checkItems = !row4Item.checkItems
               }
       }
}



