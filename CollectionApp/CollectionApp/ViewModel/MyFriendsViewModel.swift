//
//  MyFriendsViewModel.swift
//  CollectionApp
//
//  Created by Abdurakhman on 17.04.2022.
//

class MyFriendsViewModel {
    
    let dataSource: MyFriendsDataSource
    var friends: [Friend] = []
    
    init() {
        dataSource = MyFriendsDataSource()
    }
    
    func getMyFriends() -> [Friend] {
        friends = dataSource.getMyFriends()
        return friends
    }
}
