//
//  IconTableViewCell.swift
//  profile-acc
//
//  Created by Бексултан Нурпейс on 14.04.2022.
//

import UIKit
import SnapKit

class IconTableViewCell: UITableViewCell {
    static let identifier = "IconTableViewCell"
    
    let label: UILabel = {
       let label = UILabel()
       label.font = UIFont(descriptor: UIFontDescriptor(name: "Montserrat", size: 16), size: 16)
       label.textColor = UIColor(red: 0.325, green: 0.325, blue: 0.325, alpha: 1)
       return label
   }()
    
    private let iconImageView: UIImageView = {
        let arrow = UIImageView(image: UIImage(named: "Arrow"))
        return arrow
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
        
        contentView.addSubview(iconImageView)
        iconImageView.snp.makeConstraints {
            $0.right.equalToSuperview().inset(23)
            $0.top.equalToSuperview().offset(18)
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
        iconImageView.image = nil
    }
    
    public func configure(with model: IconModel){
        label.text = model.title
        iconImageView.image = model.icon
    }

}
