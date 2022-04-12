//
//  SwitchTableViewCell.swift
//  ProfileOneLab
//
//  Created by Abdurakhman on 11.04.2022.
//

import UIKit
import SnapKit

class SwitchCell: UITableViewCell {

    static let identifier = "SwitchCell"
    
    let label: UILabel = {
       let label = UILabel()
       label.font = UIFont(descriptor: UIFontDescriptor(name: "Montserrat", size: 16), size: 16)
       label.textColor = UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 1)
       return label
   }()
    
    private let mySwitch: UISwitch = {
        let mySwitch = UISwitch()
        mySwitch.onTintColor = .blue
        return mySwitch
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    private func configure(){
        contentView.addSubview(label)
        label.snp.makeConstraints {make in
            make.top.equalToSuperview().offset(16)
            make.left.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(20)
        }
        
        contentView.addSubview(mySwitch)
        mySwitch.snp.makeConstraints {make in
            make.top.equalToSuperview().offset(15)
            make.right.equalToSuperview().inset(16)
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
        mySwitch.isOn = false
        
    }
    
    public func configure(with model: SwitchModel){
        label.text = model.title
        mySwitch.isOn = model.isOn
    }


}
