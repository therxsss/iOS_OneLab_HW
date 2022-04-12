//
//  ViewController.swift
//  ProfileOneLab
//
//  Created by Abdurakhman on 11.04.2022.
//

import UIKit
import SnapKit

struct SwitchModel{
    let title: String
    var isOn: Bool
    let handler: (() -> Void)
}

struct IconModel{
    let title: String
    let icon: UIImage?
    let handler: (() -> Void)
}

struct ExitModel{
    let title: String
    let handler: (() -> Void)
}

enum ModelType{
    case switchCell(model: SwitchModel)
    case iconCell(model: IconModel)
    case exitCell(model: ExitModel)
}

struct Section{
    let options:[ModelType]
}

class ViewController: UIViewController {

    
    private let headerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        return view
    }()
    
    private let profilePhoto: UIImageView = {
        let profilePhoto = UIImageView(image: UIImage(named: "Avatar"))
        profilePhoto.contentMode = .scaleAspectFill
        return profilePhoto
    }()
    
    private let bluePhoto: UIImageView = {
        let photo = UIImageView(image: UIImage(named: "Blue"))
        return photo
    }()
    
    private let changePhoto: UIImageView = {
        let photo = UIImageView(image: UIImage(named: "Camera"))
        return photo
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Мария Атрисова"
        label.font = UIFont(descriptor: UIFontDescriptor(name: "Montserrat", size: 17), size: 17)
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = UIColor(red: 0.22, green: 0.22, blue: 0.22, alpha: 1)
        return label
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "maria.atrisova@gmail.com"
        label.font = UIFont(descriptor: UIFontDescriptor(name: "Montserrat", size: 16), size: 16)
        label.textColor = UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)
        return label
    }()
    
    var sections = [Section]()
    
    private let table: UITableView = {
        let table = UITableView()
        table.register(IconCell.self, forCellReuseIdentifier: IconCell.identifier)
        table.register(SwitchCell.self, forCellReuseIdentifier: SwitchCell.identifier)
        table.register(ExitCell.self, forCellReuseIdentifier: ExitCell.identifier)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.isScrollEnabled = false
        table.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        table.sectionIndexBackgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        table.sectionIndexBackgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        return table
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self
        configureMainView()
        configureCells()
        configureSet()
       
    }
    
    private func configureMainView(){
        view.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        self.navigationItem.title = "Профиль"
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont(descriptor: UIFontDescriptor(name: "Montserrat", size: 16), size: 16)]
    }
    
    func configureCells(){
        sections.append(Section(options: [
            .switchCell(model: SwitchModel(title: "Push уведомления", isOn: true, handler: {
                print("Push уведомления tapped")
            })),
        ]))
        sections.append(Section(options: [
            .iconCell(model: IconModel(title: "Изменить пароль", icon: UIImage(named: "Arrow"), handler: {
                print("Изменить пароль tapped")
                let vc = PasswordChangeVC()
                vc.navigationItem.largeTitleDisplayMode = .never
                self.navigationController?.pushViewController(vc, animated: true)
            })),
        ]))
        sections.append(Section(options: [
            .iconCell(model: IconModel(title: "Изменить код быстрого доступа", icon: UIImage(named: "Arrow"), handler: {
                print("Изменить код быстрого доступа tapped")
            })),
        ]))
        sections.append(Section(options: [
            .switchCell(model: SwitchModel(title: "Вход c Face/Touch ID", isOn: true, handler: {
                print("Вход c Face/Touch ID tapped")
            })),
        ]))
        sections.append(Section(options: [
            .iconCell(model: IconModel(title: "Изменить номер телефона", icon: UIImage(named: "Arrow"), handler: {
                print("Изменить номер телефона tapped")
            })),
        ]))
        sections.append(Section(options: [
            .exitCell(model: ExitModel(title: "Выход", handler: {
                print("Выход tapped")
            }))
        ]))
    }
    
    func configureSet(){
        view.addSubview(headerView)
        headerView.snp.makeConstraints {make in
            make.top.equalToSuperview().offset(90)
            make.height.equalTo(180)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
    
        headerView.addSubview(profilePhoto)
        profilePhoto.snp.makeConstraints {make in
            make.top.equalToSuperview().inset(1)
            make.left.equalToSuperview().inset(120)
            make.right.equalToSuperview().inset(120)
        }
        
        headerView.addSubview(bluePhoto)
        bluePhoto.snp.makeConstraints {make in
            make.right.equalToSuperview().inset(150)
            make.bottom.equalTo(profilePhoto.snp.bottom).inset(10)
        }
        bluePhoto.addSubview(changePhoto)
        changePhoto.snp.makeConstraints {make in
            make.center.equalToSuperview()
        }
        
        headerView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints {make in
            make.top.equalTo(profilePhoto.snp.bottom).offset(20)
            make.left.equalToSuperview().inset(130)
        }
        
        headerView.addSubview(emailLabel)
        emailLabel.snp.makeConstraints {make in
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
            make.left.equalToSuperview().inset(108)
        }
        
        view.addSubview(table)
        table.snp.makeConstraints {make in
            make.top.equalTo(headerView.snp.bottom).offset(15)
            make.height.equalTo(350)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        // Change profile photo by tapping blue button
        let gesture = UITapGestureRecognizer()
        gesture.addTarget(self, action: #selector(profilePhotoChangeButton))
        bluePhoto.addGestureRecognizer(gesture)
        bluePhoto.isUserInteractionEnabled = true
    }
    
    @objc  func profilePhotoChangeButton() {
        photoAction()
       }
    
}
extension ViewController: UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].options.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = sections[indexPath.section].options[indexPath.row]
        
        switch section.self{
        case .switchCell(let section):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: SwitchCell.identifier,
                for: indexPath) as? SwitchCell else{
                return UITableViewCell()
            }
            
            cell.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)

            cell.configure(with: section)
            return cell
        case .iconCell(let section):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: IconCell.identifier,
                for: indexPath) as? IconCell else{
                return UITableViewCell()
            }
            cell.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
            cell.configure(with: section)
            return cell
        case .exitCell(let section):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: ExitCell.identifier,
                for: indexPath) as? ExitCell else{
                return UITableViewCell()
            }
            cell.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
            cell.configure(with: section)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let type = sections[indexPath.section].options[indexPath.row]
        switch type.self{
        case .iconCell(let section):
            section.handler()
        case .switchCell(let section):
            section.handler()
        case .exitCell(let section):
            section.handler()
        }
    }
}


extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func openPhotoPicker(){
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = false
        present(vc, animated: true)
    }
    func openCamera(){
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let selectedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
            return
        }

        self.profilePhoto.image = selectedImage
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func photoAction(){
        let actionSheet = UIAlertController(title: "Фото профиля",
                                                  message: "Выберите фото",
                                                  preferredStyle: .actionSheet)
              actionSheet.addAction(UIAlertAction(title: "Отмена",
                                                  style: .cancel,
                                                  handler: nil))
              actionSheet.addAction(UIAlertAction(title: "Камера",
                                                  style: .default,
                                                  handler: { [weak self] _ in

                                                      self?.openCamera()

              }))
              actionSheet.addAction(UIAlertAction(title: "Открыть галерею",
                                                  style: .default,
                                                  handler: { [weak self] _ in

                                                      self?.openPhotoPicker()

              }))

              present(actionSheet, animated: true)
    }
}
