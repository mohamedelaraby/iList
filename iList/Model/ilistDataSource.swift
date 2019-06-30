//
//  ilistDataSource.swift
//  iList

//  info :: Ilist data source model.

//  Created by Winston on 6/28/19.
//  Copyright © 2019 Winston. All rights reserved.
//

import Foundation

class IListDataSource {
    var text = " "
    var checkItems = false
    
    //Toggle the checked item.
    func toggleChecked() {
        checkItems = !checkItems
    }
}
