//
//  MightKnowTableViewCell.swift
//  CollectionApp
//
//  Created by Abdurakhman on 17.04.2022.
//

import UIKit

typealias MightKnowCellConfigurator = TableCellConfigurator<MightKnowTableViewCell, MightKnow>

class MightKnowTableViewCell: UITableViewCell, ConfigurableCell {

    typealias DataType = MightKnow
    static let identifier = "MightKnowTableCell"
    
    private let profileImage: UIImageView = {
        let profileImage = UIImageView()
        return profileImage
    }()
    
    private let profileStatus: UIView = {
        let profileStatus = UIView()
        profileStatus.layer.borderWidth = 2
        profileStatus.layer.borderColor = CGColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return profileStatus
    }()
    
    private let profileName: UILabel = {
        let profileName = UILabel()
        profileName.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        return profileName
    }()
    
    private let friendsCount: UILabel = {
        let friendsCount = UILabel()
        friendsCount.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        friendsCount.textColor = UIColor.systemGray
        return friendsCount
    }()
    
    private let friendToggle: UIButton = {
        let friendToggle = UIButton()
        friendToggle.layer.borderWidth = 1.5
        friendToggle.layer.borderColor = CGColor(red: 0, green: 0.478, blue: 1, alpha: 1)
        friendToggle.addTarget(MightKnowTableViewCell.self, action: #selector(friendTogglePressed), for: .touchUpInside)
        return friendToggle
    }()
    
    private let friendToggleLabel: UILabel = {
        let friendToggleLabel = UILabel()
        friendToggleLabel.textColor = .systemBlue
        friendToggleLabel.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        return friendToggleLabel
    }()
    
    private let friendToggleImage: UIImageView = {
        let friendToggleImage = UIImageView()
        friendToggleImage.tintColor = .systemBlue
        return friendToggleImage
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [friendToggleImage, friendToggleLabel])
        stackView.axis = .horizontal
        stackView.spacing = 2
        return stackView
    }()
    
    @objc private func friendTogglePressed() {
        friendToggleImage.image = UIImage(systemName: "checkmark.circle.fill")
        friendToggleLabel.text = NSLocalizedString("ADDED", comment: "")
        friendToggleLabel.textColor = .lightGray
        friendToggleImage.tintColor = .lightGray
        friendToggle.layer.borderColor = CGColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.33)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layoutUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(data: MightKnow) {
        profileImage.image = UIImage(named: data.profileImage ?? "Tucker")
        profileStatus.backgroundColor = UIColor(named: data.statusColor)
        profileName.text = data.profileName
        friendsCount.text = data.friendsCount
        friendToggleLabel.text = data.friendToggleLabel
        friendToggleImage.image = UIImage(systemName: data.friendToggleImage)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        profileImage.layer.cornerRadius = profileImage.bounds.width / 2
        profileImage.clipsToBounds = true
        profileStatus.layer.cornerRadius = profileStatus.bounds.width / 2
        friendToggle.layer.cornerRadius = 15
    }
    
    private func layoutUI() {
        contentView.addSubview(profileImage)
        contentView.addSubview(profileStatus)
        contentView.addSubview(profileName)
        contentView.addSubview(friendsCount)
        contentView.addSubview(friendToggle)
        friendToggle.addSubview(stackView)
        
        profileImage.snp.makeConstraints {
            $0.size.equalTo(48)
            $0.leading.centerY.equalToSuperview()
        }
        
        profileStatus.snp.makeConstraints {
            $0.size.equalTo(14)
            $0.trailing.bottom.equalTo(profileImage)
        }
        
        profileName.snp.makeConstraints {
            $0.leading.equalTo(profileImage.snp.trailing).offset(12)
            $0.top.equalToSuperview().inset(16)
            $0.height.equalTo(22)
        }
        
        friendsCount.snp.makeConstraints {
            $0.leading.equalTo(profileImage.snp.trailing).offset(12)
            $0.top.equalTo(profileName.snp.bottom)
            $0.height.equalTo(16)
        }
        
        friendToggle.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.height.equalTo(28)
            $0.width.equalTo(stackView).offset(27)
        }
        
        stackView.snp.makeConstraints {
            $0.centerY.centerX.equalToSuperview()
        }
    }
}
