//
//  AddNewFriendsDataSource.swift
//  CollectionApp
//
//  Created by Abdurakhman on 27.04.2022.
//

import Foundation

class AddNewFriendDataSource {
    
    let items: [CellConfigurator] = [
        NewContactCellConfigurator(item: NewContactOption(iconTitle: "book", buttonTitle: NSLocalizedString("From Contacts", comment: ""))),
        NewContactCellConfigurator(item: NewContactOption(iconTitle: "person.circle.fill", buttonTitle: NSLocalizedString("By Username", comment: ""))),
        NewContactCellConfigurator(item: NewContactOption(iconTitle: "phone.fill", buttonTitle: NSLocalizedString("By Phone Number", comment: ""))),
        MightKnowCellConfigurator(item: MightKnow(profileImage: "Tom", statusColor: "Online", profileName: "Rakhman", friendsCount: NSLocalizedString("39 Friends", comment: ""), friendToggleLabel: NSLocalizedString("ADD", comment: ""), friendToggleImage: "plus.circle.fill")),
        MightKnowCellConfigurator(item: MightKnow(profileImage: "Ben", statusColor: "Busy", profileName: "Arman Sarvardin", friendsCount: NSLocalizedString("45 Friends", comment: ""), friendToggleLabel: NSLocalizedString("ADD", comment: ""), friendToggleImage: "plus.circle.fill")),
        MightKnowCellConfigurator(item: MightKnow(profileImage: "Heath", statusColor: "Online", profileName: "Rauan Tulek", friendsCount: NSLocalizedString("998 Friends", comment: ""), friendToggleLabel: NSLocalizedString("ADD", comment: ""), friendToggleImage: "plus.circle.fill")),
        MightKnowCellConfigurator(item: MightKnow(profileImage: "Robert", statusColor: "Offline", profileName: "Anuar Kairgaliev", friendsCount: NSLocalizedString("11K Friends", comment: ""), friendToggleLabel: NSLocalizedString("ADD", comment: ""), friendToggleImage: "plus.circle.fill"))
    ]

    func getItems() -> [CellConfigurator] {
        return items
    }
}
