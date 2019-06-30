//
//  TodoList.swift
//  iList

//Info:: Contain all of the Ilist checklist items.

//
//  Created by Winston on 6/30/19.
//  Copyright © 2019 Winston. All rights reserved.
//

import Foundation

class ToDoList {

    //That is hopd up all the checklist items objects.
    var todos: [IListDataSource] = [ ]
    
    init( ) {
        
        //Init the IList data source instances.
         let row0Item = IListDataSource()
         let row1Item = IListDataSource()
         let row2Item = IListDataSource()
         let row3Item = IListDataSource()
         let row4Item = IListDataSource()
        
        
        row0Item.text = " Take a jog"
        row1Item.text = " Watch a movie"
        row2Item.text = "Code an app"
        row3Item.text = "Walk the Dog"
        row3Item.text = "Walk the Dog"
        row4Item.text = "Study the design pattern"
    
        //Append all the objects to the todos array.
        todos.append(row0Item)
        todos.append(row1Item)
        todos.append(row2Item)
        todos.append(row3Item)
        todos.append(row4Item)
        
        
    }
}
