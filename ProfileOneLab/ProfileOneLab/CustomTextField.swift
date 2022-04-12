//
//  CustomTextField.swift
//  ProfileOneLab
//
//  Created by Abdurakhman on 13.04.2022.
//

import UIKit

class CustomTextField: UITextField, UITextFieldDelegate {
    let title = UILabel()
    let eye = UIImageView()
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    private func setup() {
        self.delegate = self
        self.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.textColor = UIColor(red: 0.06, green: 0.06, blue: 0.06, alpha: 1.0)
        self.font = UIFont(name: "Montserrat Regular", size: 16)
        self.layer.borderColor = CGColor(red: 0.8, green: 0.85, blue: 0.98, alpha: 1.0)
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 10
        self.textContentType = .password
        self.textAlignment = .left
        self.leftViewMode = .always
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.hidePassword))
        eye.addGestureRecognizer(gesture)
        eye.isUserInteractionEnabled = true
        
        self.addSubview(title)
        title.snp.makeConstraints {
            $0.top.equalToSuperview().inset(8)
            $0.leading.equalToSuperview().inset(16)
        }
        
        self.addSubview(eye)
        eye.snp.makeConstraints {
            $0.top.equalToSuperview().inset(13)
            $0.trailing.equalToSuperview().inset(16)
            $0.height.width.equalTo(24)
        }
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.layer.borderColor = CGColor(red: 0.17, green: 0.42, blue: 1.0, alpha: 1.0)
        self.title.textColor = UIColor(red: 0.04, green: 0.18, blue: 0.54, alpha: 1.0)
        
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        self.layer.borderColor = CGColor(red: 0.8, green: 0.85, blue: 0.98, alpha: 1.0)
        self.title.textColor = UIColor(red: 0.22, green: 0.22, blue: 0.22, alpha: 1.0)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.endEditing(true)
        return true
    }
    
    @objc func hidePassword(sender : UITapGestureRecognizer) {
        let isPasswordHide = self.isSecureTextEntry
        if isPasswordHide {
            eye.image = UIImage(named: "opened eye")
            self.isSecureTextEntry = false
        } else {
            eye.image = UIImage(named: "closed eye")
            self.isSecureTextEntry = true
        }
    }
    
    var padding = UIEdgeInsets(top: 23, left: 16, bottom: 9, right: 100);
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

}
