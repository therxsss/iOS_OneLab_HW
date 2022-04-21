//
//  MyFriendsViewModel.swift
//  Homework 2
//
//  Created by Lidiya Karnaukhova on 19.04.2022.
//

import Foundation

class MyFriendsViewModel {
    
    let dataSource: MyFriendsDataSource
    //TODO: make observable
    var friends: [Friend] = []
    
    init() {
        dataSource = MyFriendsDataSource()
    }
    
    func getMyFriends() -> [Friend] {
        friends = dataSource.getMyFriends()
        return friends
    }
}
