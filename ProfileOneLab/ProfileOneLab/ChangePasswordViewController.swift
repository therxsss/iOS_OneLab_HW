//
//  ChangePasswordViewController.swift
//  profile-acc
//
//  Created by Бексултан Нурпейс on 14.04.2022.
//

import UIKit
import SnapKit


class ChangePasswordViewController: UIViewController {

    private let currentView: UIView = {
        let view = UIView()
        view.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.804, green: 0.855, blue: 0.976, alpha: 1).cgColor
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
        password.textColor = UIColor(red: 0.058, green: 0.058, blue: 0.058, alpha: 1)
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
        view.layer.borderColor = UIColor(red: 0.804, green: 0.855, blue: 0.976, alpha: 1).cgColor
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
        password.textColor = UIColor(red: 0.058, green: 0.058, blue: 0.058, alpha: 1)
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
        view.layer.borderColor = UIColor(red: 0.804, green: 0.855, blue: 0.976, alpha: 1).cgColor
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
        password.textColor = UIColor(red: 0.058, green: 0.058, blue: 0.058, alpha: 1)
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
        label.textColor = UIColor(red: 0.229, green: 0.229, blue: 0.229, alpha: 1)
        label.attributedText = NSMutableAttributedString(string: "Забыли пароль ?", attributes: [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue])
        return label
    }()
    
    private let saveView: UIView = {
        let view = UIView()
        view.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.65, green: 0.65, blue: 0.65, alpha: 1).cgColor
        return view
    }()
    
    private let saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Сохранить", for: .normal)
        button.setTitleColor(UIColor(red: 0.65, green: 0.65, blue: 0.65, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont(name: "Montserrat", size: 20)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        self.navigationItem.title = "Изменить пароль"
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont(descriptor: UIFontDescriptor(name: "Montserrat", size: 16), size: 16)]
        passwordSetup()
    }

    
    
    @objc func passwordView(_ sender: UIButton){
        (sender ).isSelected = !(sender ).isSelected
        if (sender ).isSelected {
            self.currentPassword.isSecureTextEntry = false
            currentButton.setImage(UIImage(named: "visible"), for: .normal)
            print("show")
        } else {
            self.currentPassword.isSecureTextEntry = true
            currentButton.setImage(UIImage(named: "invisble"), for: .normal)
            print("notshow")
        }
    }
    
    @objc func newPasswordView(_ sender: UIButton){
        (sender ).isSelected = !(sender ).isSelected
        if (sender ).isSelected {
            self.newPassword.isSecureTextEntry = false
            newButton.setImage(UIImage(named: "visible"), for: .normal)
            print("show")
        } else {
            self.newPassword.isSecureTextEntry = true
            newButton.setImage(UIImage(named: "invisble"), for: .normal)
            print("notshow")
        }
    }
    
    @objc func repeatNewPasswordView(_ sender: UIButton){
        (sender ).isSelected = !(sender ).isSelected
        if (sender ).isSelected {
            self.repeatNewPassword.isSecureTextEntry = false
            repeatNewButton.setImage(UIImage(named: "visible"), for: .normal)
            print("show")
        } else {
            self.repeatNewPassword.isSecureTextEntry = true
            repeatNewButton.setImage(UIImage(named: "invisble"), for: .normal)
            print("notshow")
        }
    }
    
    
    private func passwordSetup(){
        currentButton.setImage(UIImage(named: "invisble"), for: .normal)
        currentButton.addTarget(self, action: #selector(passwordView), for: .touchUpInside)
        currentPassword.rightView = currentButton
        currentPassword.rightViewMode = .always
        
        newButton.setImage(UIImage(named: "invisble"), for: .normal)
        newButton.addTarget(self, action: #selector(newPasswordView), for: .touchUpInside)
        newPassword.rightView = newButton
        newPassword.rightViewMode = .always
        
        repeatNewButton.setImage(UIImage(named: "invisble"), for: .normal)
        repeatNewButton.addTarget(self, action: #selector(repeatNewPasswordView), for: .touchUpInside)
        repeatNewPassword.rightView = repeatNewButton
        repeatNewPassword.rightViewMode = .always
        
        view.addSubview(currentView)
        currentView.snp.makeConstraints {
            $0.left.equalToSuperview().inset(16)
            $0.right.equalToSuperview().inset(15)
            $0.top.equalToSuperview().inset(100)
            $0.height.equalTo(50)
        }
        
        currentView.addSubview(currentPassword)
        currentPassword.snp.makeConstraints {
            $0.left.equalToSuperview().inset(16)
            $0.right.equalToSuperview().inset(16)
            $0.top.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(16)
        }
        
        view.addSubview(newView)
        newView.snp.makeConstraints {
            $0.left.equalToSuperview().inset(16)
            $0.right.equalToSuperview().inset(15)
            $0.height.equalTo(50)
            $0.top.equalTo(currentView.snp.bottom).offset(16)
        }
        
        newView.addSubview(newPassword)
        newPassword.snp.makeConstraints {
            $0.left.equalToSuperview().inset(16)
            $0.right.equalToSuperview().inset(16)
            $0.top.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(16)
        }
        
        view.addSubview(repeatNewView)
        repeatNewView.snp.makeConstraints {
            $0.left.equalToSuperview().inset(16)
            $0.right.equalToSuperview().inset(15)
            $0.height.equalTo(50)
            $0.top.equalTo(newView.snp.bottom).offset(16)
        }
        
        repeatNewView.addSubview(repeatNewPassword)
        repeatNewPassword.snp.makeConstraints {
            $0.left.equalToSuperview().inset(16)
            $0.right.equalToSuperview().inset(16)
            $0.top.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(16)
        }

        view.addSubview(label)
        label.snp.makeConstraints {
            $0.top.equalTo(repeatNewView.snp.bottom).offset(32)
            $0.left.equalToSuperview().inset(135)
            $0.height.equalTo(22)
        }
        
        view.addSubview(saveView)
        saveView.snp.makeConstraints {
            $0.left.equalToSuperview().inset(16)
            $0.right.equalToSuperview().inset(15)
            $0.bottom.equalToSuperview().inset(100)
            $0.height.equalTo(50)
        }
        
        saveView.addSubview(saveButton)
        saveButton.snp.makeConstraints {
            $0.left.equalToSuperview().inset(40)
            $0.right.equalToSuperview().inset(40)
            $0.top.equalToSuperview().inset(12)
            $0.bottom.equalToSuperview().inset(12)
        }
    }
    
}
