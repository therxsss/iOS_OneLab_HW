//
//  AddNewFriendViewModel.swift
//  CollectionApp
//
//  Created by Abdurakhman on 17.04.2022.
//

class AddNewFriendViewModel {
    
    let dataSource: AddNewFriendDataSource
    var items: [CellConfigurator] = []
    
    init() {
        dataSource = AddNewFriendDataSource()
    }
    
    func getItems() -> [CellConfigurator] {
        items = dataSource.getItems()
        return items
    }
}
