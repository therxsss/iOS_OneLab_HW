//
//  MyFriendsDataSource.swift
//  Homework 2
//
//  Created by Lidiya Karnaukhova on 19.04.2022.
//

import Foundation
import UIKit

class MyFriendsDataSource {
    
    let friends: [Friend] = [
        Friend(photo: UIImage(named: "Tucker")!, name: "Savannah Tucker", job: NSLocalizedString("Retail Supervisor", comment: ""), statusColor: UIColor(named: "Online")!),
        Friend(photo: UIImage(named: "Murphy")!, name: "Kathryn Murphy", job: NSLocalizedString("Photographer", comment: ""), statusColor: UIColor(named: "Online")!),
        Friend(photo: UIImage(named: "Stewart")!, name: "Darrel Stewart", job: NSLocalizedString("UI/UX Designer", comment: ""), statusColor: UIColor(named: "Offline")!),
        Friend(photo: UIImage(named: "Wilson")!, name: "Jenny Wilson", job: NSLocalizedString("Model, Actress", comment: ""), statusColor: UIColor(named: "Offline")!),
        Friend(photo: UIImage(named: "Henry")!, name: "Courtney Henry", job: NSLocalizedString("Taxi Driver", comment: ""), statusColor: UIColor(named: "Busy")!),
        Friend(photo: UIImage(named: "Warren")!, name: "Jim Warren", job: NSLocalizedString("Company CEO", comment: ""), statusColor: UIColor(named: "Offline")!),
        Friend(photo: UIImage(named: "Wilkins")!, name: "Tim Wilkins", job: NSLocalizedString("Mobile Developer", comment: ""), statusColor: UIColor(named: "Busy")!)
    ]

    func getMyFriends() -> [Friend] {
        return friends
    }
}
