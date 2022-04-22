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
    
    private lazy var tableDirector: TableDirector = {
            let tableDirector = TableDirector(tableView: tableView, items: items)
            return tableDirector
        }()
    
    private let tableView : UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureNavigationBar()
        configureNewFriendsTableView()
        loadItems()
        cellActionHandlers()
        tableDirector.tableView.reloadData()
    }
    
    private func cellActionHandlers() {
            self.tableDirector.actionProxy
                .on(action: .didSelect) { (config: MightKnowCellConfigurator, cell) in
                }
                .on(action: .willDisplay) { (config: MightKnowCellConfigurator, cell) in
                }.on(action: .custom(MightKnowTableViewCell.didTapButtonAction)){ (config: MightKnowCellConfigurator, cell) in
                    let mightKnowCell = cell as MightKnowTableViewCell
                    mightKnowCell.friendToggleImage.image = UIImage(systemName: "checkmark.circle.fill")
                    mightKnowCell.friendToggleLabel.text = NSLocalizedString("ADDED", comment: "")
                    mightKnowCell.friendToggleLabel.textColor = .lightGray
                    mightKnowCell.friendToggleImage.tintColor = .lightGray
                    mightKnowCell.friendToggle.layer.borderColor = CGColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.33)
                    print("button did tap")
                }
    }
    
    private func configureNavigationBar() {
        let leftNavigationItem = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"),style: .plain,target: self,action: #selector(backToRootVC))
        navigationItem.leftBarButtonItem = leftNavigationItem
        navigationItem.title = NSLocalizedString("Add New Friend", comment: "")
    }
    
    @objc private  func backToRootVC() {
        let rootVC = MyFriendsViewController()
        let navigationVC = UINavigationController(rootViewController: rootVC)
        navigationVC.modalPresentationStyle = .currentContext
        present(navigationVC, animated: true)
    }
    
    private func configureNewFriendsTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
                .inset(UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
        }
    }
    
    private func loadItems() {
        items = viewModel.getItems()
    }

}



    

    
    

