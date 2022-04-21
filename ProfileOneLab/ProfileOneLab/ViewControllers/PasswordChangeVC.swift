//
//  PasswordChangeVC.swift
//  ProfileOneLab
//
//  Created by Abdurakhman on 11.04.2022.
//

import UIKit
import SnapKit


class PasswordChangeVC: UIViewController {

    private let currentView: UIView = {
        let view = UIView()
        view.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        view.layer.borderColor = UIColor(red: 0.8, green: 0.8, blue: 1, alpha: 1).cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        return view
    }()
    
     private let currentPassword: UITextField = {
        let password = UITextField()
        password.placeholder = "Текущий пароль"
        password.isSecureTextEntry = true
        password.backgroundColor = UIColor.white
        password.autocorrectionType = UITextAutocorrectionType.no
        password.keyboardType = UIKeyboardType.default
        password.returnKeyType = UIReturnKeyType.done
        password.textColor = UIColor(red: 0.05, green: 0.05, blue: 0.05, alpha: 1)
        return password
    }()
    
    private let currentButton: UIButton = {
        let button = UIButton(type: .custom)
        return button
    }()
    
    private let newView: UIView = {
        let view = UIView()
        view.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.8, green: 0.8, blue: 1, alpha: 1).cgColor
        return view
    }()
    
    private let newPassword: UITextField = {
        let password = UITextField()
        password.placeholder = "Новый пароль"
        password.backgroundColor = UIColor.white
        password.isSecureTextEntry = true
        password.autocorrectionType = UITextAutocorrectionType.no
        password.keyboardType = UIKeyboardType.default
        password.returnKeyType = UIReturnKeyType.done
        password.textColor = UIColor(red: 0.05, green: 0.05, blue: 0.05, alpha: 1)
        return password
    }()
    
    private let newButton: UIButton = {
        let button = UIButton(type: .custom)
        return button
    }()
    
    private let repeatNewView: UIView = {
        let view = UIView()
        view.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.8, green: 0.8, blue: 1, alpha: 1).cgColor
        return view
    }()
    
    private let repeatNewPassword: UITextField = {
        let password = UITextField()
        password.placeholder = "Повторить новый пароль"
        password.backgroundColor = UIColor.white
        password.isSecureTextEntry = true
        password.autocorrectionType = UITextAutocorrectionType.no
        password.keyboardType = UIKeyboardType.default
        password.returnKeyType = UIReturnKeyType.done
        password.textColor = UIColor(red: 0.05, green: 0.05, blue: 0.05, alpha: 1)
        return password
    }()
    
    private let repeatNewButton: UIButton = {
        let button = UIButton(type: .custom)
        return button
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Забыли пароль ?"
        label.font = UIFont(descriptor: UIFontDescriptor(name: "Montserrat", size: 14), size: 14)
        label.textColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        label.attributedText = NSMutableAttributedString(string: "Забыли пароль ?", attributes: [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue])
        return label
    }()
    
    private let saveView: UIView = {
        let view = UIView()
        view.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1).cgColor
        return view
    }()
    
    private let saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Сохранить", for: .normal)
        button.setTitleColor(UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont(name: "Montserrat", size: 20)
        button.addTarget(PasswordChangeVC.self, action: #selector(savePressed), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        self.navigationItem.title = "Изменить пароль"
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont(descriptor: UIFontDescriptor(name: "Montserrat", size: 16), size: 16)]
        passwordSetup()
    }

    
    
    @objc func currentPasswordVisibility(_ sender: UIButton){
        (sender ).isSelected = !(sender).isSelected
        if (sender ).isSelected {
            self.currentPassword.isSecureTextEntry = false
            currentButton.setImage(UIImage(named: "VisibleMode"), for: .normal)
            print("Password visible")
        } else {
            self.currentPassword.isSecureTextEntry = true
            currentButton.setImage(UIImage(named: "InvisibleMode"), for: .normal)
            print("Passsword invisible")
        }
    }
    
    @objc func newPasswordVisibility(_ sender: UIButton){
        (sender ).isSelected = !(sender).isSelected
        if (sender ).isSelected {
            self.newPassword.isSecureTextEntry = false
            newButton.setImage(UIImage(named: "VisibleMode"), for: .normal)
            print("New Password visible")
        } else {
            self.newPassword.isSecureTextEntry = true
            newButton.setImage(UIImage(named: "InvisibleMode"), for: .normal)
            print("New Passsword invisible")
        }
    }
    
    @objc func repeatNewPasswordVisibility(_ sender: UIButton){
        (sender ).isSelected = !(sender).isSelected
        if (sender ).isSelected {
            self.repeatNewPassword.isSecureTextEntry = false
            repeatNewButton.setImage(UIImage(named: "VisibleMode"), for: .normal)
            print("Repeat new Password visible")
        } else {
            self.repeatNewPassword.isSecureTextEntry = true
            repeatNewButton.setImage(UIImage(named: "InvisibleMode"), for: .normal)
            print("Repeat new Passsword invisible")
        }
    }
    
    @objc func savePressed(){
        print("Save tapped")
        navigationController?.popToRootViewController(animated: true)
    }
    
    private func passwordSetup(){
        currentButton.setImage(UIImage(named: "InvisibleMode"), for: .normal)
        currentButton.addTarget(self, action: #selector(currentPasswordVisibility), for: .touchUpInside)
        currentPassword.rightView = currentButton
        currentPassword.rightViewMode = .always
        
        newButton.setImage(UIImage(named: "InvisibleMode"), for: .normal)
        newButton.addTarget(self, action: #selector(newPasswordVisibility), for: .touchUpInside)
        newPassword.rightView = newButton
        newPassword.rightViewMode = .always
        
        repeatNewButton.setImage(UIImage(named: "InvisibleMode"), for: .normal)
        repeatNewButton.addTarget(self, action: #selector(repeatNewPasswordVisibility), for: .touchUpInside)
        repeatNewPassword.rightView = repeatNewButton
        repeatNewPassword.rightViewMode = .always
        
        view.addSubview(currentView)
        currentView.snp.makeConstraints {make in
            make.top.equalToSuperview().inset(100)
            make.height.equalTo(50)
            make.left.equalToSuperview().inset(16)
            make.right.equalToSuperview().inset(16)
        }
        
        currentView.addSubview(currentPassword)
        currentPassword.snp.makeConstraints {make in
            make.top.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(16)
            make.left.equalToSuperview().inset(16)
            make.right.equalToSuperview().inset(16)
        }
        
        view.addSubview(newView)
        newView.snp.makeConstraints {make in
            make.top.equalTo(currentView.snp.bottom).offset(16)
            make.height.equalTo(50)
            make.left.equalToSuperview().inset(16)
            make.right.equalToSuperview().inset(16)
        }
        
        newView.addSubview(newPassword)
        newPassword.snp.makeConstraints {make in
            make.top.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(16)
            make.left.equalToSuperview().inset(16)
            make.right.equalToSuperview().inset(16)
        }
        
        view.addSubview(repeatNewView)
        repeatNewView.snp.makeConstraints {make in
            make.top.equalTo(newView.snp.bottom).offset(16)
            make.height.equalTo(50)
            make.left.equalToSuperview().inset(16)
            make.right.equalToSuperview().inset(16)
        }
        
        repeatNewView.addSubview(repeatNewPassword)
        repeatNewPassword.snp.makeConstraints {make in
            make.top.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(16)
            make.left.equalToSuperview().inset(16)
            make.right.equalToSuperview().inset(16)
        }

        view.addSubview(label)
        label.snp.makeConstraints {make in
            make.top.equalTo(repeatNewView.snp.bottom).offset(32)
            make.height.equalTo(22)
            make.left.equalToSuperview().inset(135)
        }
        
        view.addSubview(saveView)
        saveView.snp.makeConstraints {make in
            make.bottom.equalToSuperview().inset(100)
            make.height.equalTo(50)
            make.left.equalToSuperview().inset(16)
            make.right.equalToSuperview().inset(16)
        }
        
        saveView.addSubview(saveButton)
        saveButton.snp.makeConstraints {make in
            make.top.equalToSuperview().inset(12)
            make.bottom.equalToSuperview().inset(12)
            make.left.equalToSuperview().inset(40)
            make.right.equalToSuperview().inset(40)
        }
    }
    
}
