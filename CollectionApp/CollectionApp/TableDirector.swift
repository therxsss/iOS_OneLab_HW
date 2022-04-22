//
//  TableDirector.swift
//  CollectionApp
//
//  Created by Abdurakhman on 22.04.2022.
//

import UIKit

class TableDirector: NSObject {


    let tableView: UITableView
    let actionProxy = CellActionProxy()
    var newContactsSectionCount = 0
    
    
    var items = [CellConfigurator]() {
        didSet {
            self.tableView.reloadData()
        }
    }

    init(tableView: UITableView, items: [CellConfigurator]) {
        self.tableView = tableView
        super.init()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.items = items

        NotificationCenter.default.addObserver(self, selector: #selector(onActionEvent(notification:)), name: CellAction.notificationName, object: nil)
    }

    @objc fileprivate func onActionEvent(notification: Notification) {
        if let eventData = notification.userInfo?["data"] as? CellActionEventData, let cell = eventData.cell as? UITableViewCell, let indexPath = self.tableView.indexPath(for: cell) {
            actionProxy.invoke(action: eventData.action, cell: cell, configurator: self.items[indexPath.row])
        }
    }
}

extension TableDirector: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            newContactsSectionCount = items.filter { $0 is NewContactCellConfigurator }.count
            return newContactsSectionCount
        }
        return items.filter { $0 is MightKnowCellConfigurator }.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellConfig = self.items[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        guard let cell = tableView.cellForRow(at: indexPath) else {
            return
        }
        self.actionProxy.invoke(action: .didSelect, cell: cell, configurator: cellConfig)
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let cellConfig = self.items[indexPath.row]
        self.actionProxy.invoke(action: .willDisplay, cell: cell, configurator: cellConfig)
    }


    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 44
        } else {
            return 72
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var item: CellConfigurator
        if indexPath.section == 0 {
            item = items[indexPath.row]
        } else {
            item = items[indexPath.row + newContactsSectionCount]
        }
        tableView.register(type(of: item).cellClass, forCellReuseIdentifier: type(of: item).reuseId)
        let cell = tableView.dequeueReusableCell(withIdentifier: type(of: item).reuseId, for: indexPath)
        item.configure(cell: cell)
        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label: UILabel = {
            let label = UILabel()
            label.textAlignment = .left
            label.font = UIFont.systemFont(ofSize: 22, weight: .bold)

            if section == 0 {
                label.text = NSLocalizedString("Add New Contacts", comment: "")
            } else {
                label.text = NSLocalizedString("You Might Know Them", comment: "")
            }
            return label
        }()
        return label
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 28
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
}
