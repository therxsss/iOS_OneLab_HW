//
//  MightKnowDataSource.swift
//  Homework 2
//
//  Created by Lidiya Karnaukhova on 20.04.2022.
//

import Foundation
import UIKit

class AddNewFriendDataSource {
    
    let items: [CellConfigurator] = [
        NewContactCellConfigurator(item: NewContactOption(iconTitle: "book", buttonTitle: NSLocalizedString("From Contacts", comment: ""))),
        NewContactCellConfigurator(item: NewContactOption(iconTitle: "signature", buttonTitle: NSLocalizedString("By Username", comment: ""))),
        NewContactCellConfigurator(item: NewContactOption(iconTitle: "phone.connection", buttonTitle: NSLocalizedString("By Phone Number", comment: ""))),
        MightKnowCellConfigurator(item: MightKnow(profileImage: "Wilson", statusColor: "Online", profileName: "FyoN-22", friendsCount: NSLocalizedString("18 Friends", comment: ""), friendToggleLabel: NSLocalizedString("ADD", comment: ""), friendToggleImage: "plus.circle.fill")),
        MightKnowCellConfigurator(item: MightKnow(profileImage: "Wilkins", statusColor: "Busy", profileName: "Tim Wilkins", friendsCount: NSLocalizedString("467 Friends", comment: ""), friendToggleLabel: NSLocalizedString("ADD", comment: ""), friendToggleImage: "plus.circle.fill")),
        MightKnowCellConfigurator(item: MightKnow(profileImage: "Murphy", statusColor: "Online", profileName: "KathMur96", friendsCount: NSLocalizedString("12.6K Friends", comment: ""), friendToggleLabel: NSLocalizedString("ADD", comment: ""), friendToggleImage: "plus.circle.fill")),
        MightKnowCellConfigurator(item: MightKnow(profileImage: "Tucker", statusColor: "Offline", profileName: "Savannah Tucker", friendsCount: NSLocalizedString("1298 Friends", comment: ""), friendToggleLabel: NSLocalizedString("ADD", comment: ""), friendToggleImage: "plus.circle.fill")),
        MightKnowCellConfigurator(item: MightKnow(profileImage: "Warren", statusColor: "Offline", profileName: "Jimmy", friendsCount: NSLocalizedString("4.5K Friends", comment: ""), friendToggleLabel: NSLocalizedString("ADD", comment: ""), friendToggleImage: "plus.circle.fill")),
        MightKnowCellConfigurator(item: MightKnow(profileImage: "Stewart", statusColor: "Offline", profileName: "Darrell Stewart", friendsCount: NSLocalizedString("489 Friends", comment: ""), friendToggleLabel: NSLocalizedString("ADD", comment: ""), friendToggleImage: "plus.circle.fill"))
    ]

    func getItems() -> [CellConfigurator] {
        return items
    }
}
