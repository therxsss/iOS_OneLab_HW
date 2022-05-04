//
//  SearchViewController.swift
//  UnsplashPremium
//
//  Created by Abdurakhman on 02.05.2022.
//

import UIKit

class SearchViewController: UIViewController {

    var categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Browse by Category"
        label.font = .systemFont(ofSize: 26, weight: .bold)
        return label
    }()
    
    var myCollectionView: UICollectionView!
    var discoverCollectionView: UICollectionView!
    var discoverLabel: UILabel = {
        let label = UILabel()
        label.text = "Discover"
        label.font = .systemFont(ofSize: 26, weight: .bold)
        return label
    }()
    var containerView: UIView = {
        let containerView = UIView()
        return containerView
    }()
    
    var results: [Resulted] = []
    var categories: [String] = ["Nature", "Black and White", "Space", "Textures", "Abstract", "Minimal", "Animals", "Sky", "Flowers", "Travel", "Underwater", "Drones", "Architecture", "Gradients"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let searchController = UISearchBar()
        searchController.placeholder = "Search photos, colections, users"
        navigationItem.titleView = searchController
        configureDiscoverCollectionView()
        configureCategoryCollectionView()
        configureUI()
        fetchPhoto()
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        myCollectionView?.frame = CGRect(x: 0, y: view.safeAreaInsets.top+55, width: view.frame.size.width, height: (view.frame.size.width/3)*2 - 4)
    }
    
    // MARK: - Configure User Interface
    private func configureUI(){
        view.addSubview(containerView)
        containerView.addSubview(categoryLabel)
        containerView.addSubview(myCollectionView)
        containerView.addSubview(discoverLabel)
        containerView.addSubview(discoverCollectionView)
        containerView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        categoryLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
        }
        myCollectionView.snp.makeConstraints { make in
            make.top.equalTo(categoryLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(myCollectionView.snp.top).offset(view.frame.size.width/3*2 - 4)
        }
        discoverLabel.snp.makeConstraints { make in
            make.top.equalTo(myCollectionView.snp.bottom).offset(40)
        }
        discoverCollectionView.snp.makeConstraints { make in
            make.top.equalTo(discoverLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(discoverCollectionView.snp.top).offset(view.frame.size.width/3*2 - 4)
        }
        
    }
    
    private func configureCategoryCollectionView(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 9
        layout.minimumInteritemSpacing = 8
        layout.itemSize = CGSize(width: view.frame.size.width/3 - 6, height: view.frame.size.width/3 - 6)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        self.myCollectionView = collectionView
        self.myCollectionView!.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: "myCell")
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func configureDiscoverCollectionView(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 9
        layout.minimumInteritemSpacing = 8
        layout.itemSize = CGSize(width: view.frame.size.width/3 - 6, height: view.frame.size.width/3 - 6)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        self.discoverCollectionView = collectionView
        self.discoverCollectionView!.register(DiscoverCell.self, forCellWithReuseIdentifier: "myDiscoverCell")
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    // MARK: - Fetch data
    
    private func fetchPhoto(){
        guard let url = URL(string: "https://api.unsplash.com/search/photos?page=1&per_page=\(categories.count)&query=random&client_id=GlUv0ULAiVxudLTp1PPNos4VHZ_TDXb8wVHiZMlkatI") else { return }
//        print(url)
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            guard let data = data, error == nil else { return }
            do{
                let jsonResult = try JSONDecoder().decode(APIResponse.self, from: data)
                print(jsonResult.results.count)
                DispatchQueue.main.async {
                    self?.results = jsonResult.results
                    self?.myCollectionView?.reloadData()
                }
                
            }catch{
                print(error)
            }
        }
        task.resume()
    }
     
    
}

// MARK: - Collection View Delegate
extension SearchViewController: UICollectionViewDelegate{
    
}

// MARK: - Collection View Data Source
extension SearchViewController: UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return results.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let imageURLString = results[indexPath.row].urls.regular
        let imageTitle = categories[indexPath.row]
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"myCell", for: indexPath) as? CategoryCollectionViewCell{
            cell.configure(with: imageURLString, text: imageTitle)
            return cell
        }
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"myDiscoverCell", for: indexPath) as? DiscoverCell{
            cell.configure(with: imageURLString, text: imageTitle)
            cell.backgroundColor = .yellow
            return cell
        }
        
        
        //        cell.layer.cornerRadius = 10
        //        cell.clipsToBounds = true
        return UICollectionViewCell()
    }
    
    
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    //        return CGSize(width: view.frame.size.width/3 - 15, height: view.frame.size.width/3 - 15)
    //    }
    
}

extension SearchViewController: UISearchBarDelegate{
    
}
