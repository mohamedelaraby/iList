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
    var todos: [CheckListItem] = [ ]
    
    init( ) {
        
        //Init the IList data source instances.
         let row0Item = CheckListItem()
         let row1Item = CheckListItem()
         let row2Item = CheckListItem()
         let row3Item = CheckListItem()
         let row4Item = CheckListItem()
        
        
        row0Item.text = " Take a jog"
        row0Item.checkItem = true
        
        row1Item.text = " Watch a movie"
        row1Item.checkItem = true
        
        row2Item.text = "Code an app"
        row2Item.checkItem = true
        
        row3Item.text = "Walk the Dog"
        
        row4Item.text = "Study the design pattern"
    
        //Append all the objects to the todos array.
        todos.append(row0Item)
        todos.append(row1Item)
        todos.append(row2Item)
        todos.append(row3Item)
        todos.append(row4Item)
    
    }
    
    // [ @newTodo  ] :- Add new todo item
    func newtTodo() -> CheckListItem {
        let item = CheckListItem()
        item.text = randomTitle()
        item.checkItem = true
        todos.append(item)
        return item
    }
    
    // [ @randomTitle ] :- Return random title for new row
    private func randomTitle() -> String {
        var title = ["New Todo item", " Generic todo", "Fill me out","do","Much to do" ]
        
        let randomNumber  = Int.random(in: 0 ... title.count - 1)
        return title[randomNumber]
    }
}
