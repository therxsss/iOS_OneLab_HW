//
//  MyFriendsDataSource.swift
//  CollectionApp
//
//  Created by Abdurakhman on 27.04.2022.
//

import UIKit


class MyFriendsDataSource {
    
    let friends: [Friend] = [
        Friend(photo: UIImage(named: "Elizabeth")!, name: "Elizabeth Olsen", job: NSLocalizedString("Actor", comment: ""), statusColor: UIColor(named: "Online")!),
        Friend(photo: UIImage(named: "Tom")!, name: "Tom Hiddlestone", job: NSLocalizedString("Shoot", comment: ""), statusColor: UIColor(named: "Online")!),
        Friend(photo: UIImage(named: "Henry")!, name: "Henry Cavill", job: NSLocalizedString("Man!", comment: ""), statusColor: UIColor(named: "Offline")!),
        Friend(photo: UIImage(named: "Ben")!, name: "Ben Affleck", job: NSLocalizedString("Batman", comment: ""), statusColor: UIColor(named: "Offline")!),
        Friend(photo: UIImage(named: "Heath")!, name: "Heath Ledger", job: NSLocalizedString("Joker", comment: ""), statusColor: UIColor(named: "Busy")!),
        Friend(photo: UIImage(named: "Robert")!, name: "Robert Downey jr", job: NSLocalizedString("Iron Man", comment: ""), statusColor: UIColor(named: "Busy")!)
    ]

    func getMyFriends() -> [Friend] {
        return friends
    }
}
