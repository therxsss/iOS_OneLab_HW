//
//  ViewController.swift
//  CollectionApp
//
//  Created by Abdurakhman on 17.04.2022.
//

import UIKit

class MyFriendsViewController: UIViewController {
    
    let viewModel = MyFriendsViewModel()
    var friends: [Friend] = []
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        configureNavigationBar()
        configureCollectionView()
        loadFriends()
    }
    
    private func configureNavigationBar() {
        let rightNavigationItem = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: .none, action: .none)
        let leftNavigationItem = UIBarButtonItem(image: UIImage(systemName: "plus.circle"), style: .plain, target: self, action: #selector(addNewFriends))
        navigationItem.rightBarButtonItem = rightNavigationItem
        navigationItem.leftBarButtonItem = leftNavigationItem
        navigationItem.title = NSLocalizedString("My Friends", comment: "")
    }
    
    @objc private func addNewFriends() {
        let rootVC = AddNewFriendViewController()
        let navigationVC = UINavigationController(rootViewController: rootVC)
        navigationVC.modalPresentationStyle = .currentContext
        present(navigationVC, animated: true)
    }
    
    private func configureCollectionView() {
        view.addSubview(collectionView)
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
                .inset(UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
        }
        
        collectionView.register(FriendsCollectionViewCell.self, forCellWithReuseIdentifier: FriendsCollectionViewCell.identifier)
    }
    
    private func loadFriends() {
        friends = viewModel.getMyFriends()
    }
}

extension MyFriendsViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return friends.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FriendsCollectionViewCell.identifier, for: indexPath) as? FriendsCollectionViewCell else {
                return UICollectionViewCell()
        }
        let item = friends[indexPath.row]
        cell.friendName.text = item.name
        cell.friendImage.image = item.photo
        cell.friendJob.text = item.job
        cell.friendStatus.backgroundColor = item.statusColor
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let myWidth : CGFloat = (collectionView.bounds.width - 8) / 2 - 1
        return CGSize(width: myWidth, height: 192)
    }
}
