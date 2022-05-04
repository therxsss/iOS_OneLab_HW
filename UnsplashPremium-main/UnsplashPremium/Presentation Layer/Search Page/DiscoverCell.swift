//
//  DiscoverCell.swift
//  MyUnsplash
//
//  Created by Abdurakhman on 02.05.2022.
//

import UIKit

class DiscoverCell: UICollectionViewCell {
    
    static let identifier = "myDiscoverCell"
    
    private var titleLabel: UILabel = {
        let title = UILabel()
        title.text = "Title"
        title.font = .systemFont(ofSize: 20, weight: .semibold)
        title.numberOfLines = 3
        title.textAlignment = .center
        return title
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .purple
        return imageView
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        contentView.layer.cornerRadius = 10
        contentView.clipsToBounds = true
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        configureLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
    private func configureLabel(){
        titleLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    func configure(with urlString: String, text: String){
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async {
                let image = UIImage(data: data)
                self?.imageView.image = image
                self?.titleLabel.text = text
            }
        }
        task.resume()
    }
}
