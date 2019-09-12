//
//  CheckList.swift
//  iList
//
//  Created by Winston on 8/20/19.
//  Copyright © 2019 Winston. All rights reserved.
//

import Foundation

class CheckListItem {

    var text = " "
    var checkItem = false
    
    //Toggle the checked item.
    func toggleChecked() {
        checkItem = !checkItem
    }
}
