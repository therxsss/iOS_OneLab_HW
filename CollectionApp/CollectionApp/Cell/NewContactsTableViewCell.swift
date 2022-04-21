//
//  NewContactsTableViewCell.swift
//  Homework 2
//
//  Created by Lidiya Karnaukhova on 20.04.2022.
//

import UIKit
import SnapKit

typealias NewContactCellConfigurator = TableCellConfigurator<NewContactsTableViewCell, NewContactOption>

class NewContactsTableViewCell: UITableViewCell, ConfigurableCell {
    
    typealias DataType = NewContactOption
    static let identifier = "NewContactsTableCell"
    
    // book, signature, phone.connection
    let icon: UIImageView = {
        let icon = UIImageView()
        icon.tintColor = .lightGray
        return icon
    }()
    
    let button: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layoutUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(data: NewContactOption) {
        icon.image = UIImage(systemName: data.iconTitle)
        button.setTitle(data.buttonTitle, for: .normal)
    }
    
    private func layoutUI() {
        contentView.addSubview(icon)
        contentView.addSubview(button)
        
        icon.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
        button.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(37)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(44)
        }
    }
}
