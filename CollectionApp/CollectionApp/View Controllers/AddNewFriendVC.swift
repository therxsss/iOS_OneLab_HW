//
//  ViewController.swift
//  CollectionApp
//
//  Created by Abdurakhman on 17.04.2022.
//

import UIKit
import SnapKit

class AddNewFriendViewController: UIViewController {
    
    let viewModel = AddNewFriendViewModel()
    var items: [CellConfigurator] = []
    var newContactsSectionCount = 0
    
    private let tableView : UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        tableView.dataSource = self
        configureNavigationBar()
        configureNewContactsTableView()
        loadItems()
    }
    
    private func configureNavigationBar() {
        let leftNavigationItem = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"),style: .plain,target: self,action:#selector(backToMainVC))
        navigationItem.leftBarButtonItem = leftNavigationItem
        navigationItem.title = NSLocalizedString("Add New Friend", comment: "")
    }
    
    @objc private func backToMainVC() {
        let rootVC = MyFriendsViewController()
        let navigationVC = UINavigationController(rootViewController: rootVC)
        navigationVC.modalPresentationStyle = .currentContext
        present(navigationVC, animated: true)
    }
    
    private func configureNewContactsTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
                .inset(UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
        }
    }
    
    private func loadItems() {
        items = viewModel.getItems()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension AddNewFriendViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            newContactsSectionCount = items.filter { $0 is NewContactCellConfigurator }.count
            return newContactsSectionCount
        }
        return items.filter { $0 is MightKnowCellConfigurator }.count
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
