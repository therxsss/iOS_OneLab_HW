//
//  ExitTableViewCell.swift
//  profile-acc
//
//  Created by Бексултан Нурпейс on 14.04.2022.
//

import UIKit
import SnapKit

class ExitTableViewCell: UITableViewCell {
    static let identifier = "ExitTableViewCell"
    
    let label: UILabel = {
       let label = UILabel()
       label.font = UIFont(descriptor: UIFontDescriptor(name: "Montserrat", size: 16), size: 16)
       label.textColor = UIColor(red: 1, green: 0.317, blue: 0.317, alpha: 1)
       return label
   }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    private func setup(){
        contentView.addSubview(label)
        label.snp.makeConstraints {
            $0.left.equalToSuperview().inset(19)
            $0.top.equalToSuperview().offset(17)
            $0.bottom.equalToSuperview().inset(19)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        label.text = nil

    }
    
    public func configure(with model: ExitModel){
        label.text = model.title
    }

}
