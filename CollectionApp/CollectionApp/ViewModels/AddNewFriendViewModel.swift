//
//  AddNewFriendViewModel.swift
//  Homework 2
//
//  Created by Lidiya Karnaukhova on 20.04.2022.
//

import Foundation

class AddNewFriendViewModel {
    
    let dataSource: AddNewFriendDataSource
    //TODO: make observable
    var items: [CellConfigurator] = []
    
    init() {
        dataSource = AddNewFriendDataSource()
    }
    
    func getItems() -> [CellConfigurator] {
        items = dataSource.getItems()
        return items
    }
}
