//
//  ViewController.swift
//  Remainder
//
//  Created by Abdurakhman on 15.04.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    // Head view
    private let headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Get Groceriec"
        label.font = label.font.withSize(19)
        return label
    }()
    
    //Second view
    private let secondView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let secondLabel: UILabel = {
        let label = UILabel()
        label.text = "Remind me on a day"
        label.font = label.font.withSize(18)
        label.textColor = .darkGray
        return label
    }()
    
    // First switch
    private let switchButton = UISwitch()
    
    private let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        return view
    }()
    
    private let dataLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBlue
        return label
    }()
    
    private let secondLine: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        return view
    }()
    
    lazy var datePicker: UIDatePicker = {
        let date = UIDatePicker()
        date.preferredDatePickerStyle = UIDatePickerStyle.wheels
        date.timeZone = NSTimeZone.local
        date.backgroundColor = UIColor.white
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_us")
        formatter.dateFormat = "EEEE, MMM d, yyyy, h:mm a"
        dataLabel.text = formatter.string(from: date.date)
        return date
    }()
    
    private let thirdLine: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        return view
    }()
    
    private let secondViewLabel: UILabel = {
        let label = UILabel()
        label.text = "Repeat"
        label.font = label.font.withSize(18)
        label.textColor = .darkGray
        return label
    }()
    
    // Location remind View
    private let secondSwitch = UISwitch()
    
    private let thirdView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.text = "Remind me on a location"
        label.font = label.font.withSize(18)
        label.textColor = .darkGray
        return label
    }()
    
    // Priority view
    private let priorityView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let priorityLabel: UILabel = {
        let label = UILabel()
        label.text = "Priority"
        label.textColor = .darkGray
        label.font = label.font.withSize(18)
        return label
    }()
    
    private let priorityLine: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        return view
    }()
    
    let priorities = ["None","!","!!","!!!"]
    
    lazy var segmentControl: UISegmentedControl = {
        let segment = UISegmentedControl(items: priorities)
        segment.selectedSegmentTintColor = .systemBlue
        segment.layer.borderColor = UIColor.systemBlue.cgColor
        segment.layer.borderWidth = 1
        segment.setTitleTextAttributes(
            [NSAttributedString.Key.foregroundColor:UIColor.white],
            for: UIControl.State.selected)
        segment.setTitleTextAttributes(
            [NSAttributedString.Key.foregroundColor:UIColor.systemBlue],
            for: UIControl.State.normal)
        segment.addTarget(self, action: #selector(printPriority), for: .valueChanged)
        return segment
    }()
    
    private let notesLabel: UILabel = {
        let label = UILabel()
        label.text = "Notes"
        label.font = label.font.withSize(18)
        label.textColor = .darkGray
        return label
    }()
    
    
    // MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        configureMainView()
        configureHeader()
        configureSecondView()
        configureRemaindAtLocation()
        configurePriorityView()
        
    }
    
    //Configuring main View
    private func configureMainView(){
        view.backgroundColor = .systemGray6
        self.navigationItem.title = "Create Reminder"
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20,
                            weight: UIFont.Weight.bold)
        ]
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Done",
            style: .done,
            target: self,
            action: #selector(doneButton))
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "Cancel",
            style: .done,
            target: self,
            action: #selector(cancelButton))
    }
    
    // Configuring header view and label
    private func configureHeader(){
        
        view.addSubview(headerView)
        headerView.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.top.equalToSuperview().inset(120)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        headerView.addSubview(headerLabel)
        headerLabel.snp.makeConstraints {make in
            make.left.equalToSuperview().inset(16)
            make.top.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(10)
        }
    }
    
    // Configuring DatePicker view
    private func configureSecondView(){
        view.addSubview(secondView)
        secondView.snp.makeConstraints {make in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalTo(headerView.snp.bottom).offset(35)
            make.height.equalTo(350)
        }
        
        secondView.addSubview(secondLabel)
        secondLabel.snp.makeConstraints {make in
            make.top.equalToSuperview().inset(16)
            make.left.equalToSuperview().inset(16)
        }

        secondView.addSubview(switchButton)
        switchButton.snp.makeConstraints {make in
            make.top.equalToSuperview().inset(8)
            make.right.equalToSuperview().inset(16)
            
        }
        
        secondView.addSubview(lineView)
        lineView.snp.makeConstraints {make in
            make.top.equalTo(secondLabel.snp.bottom).offset(10)
            make.left.equalToSuperview().inset(16)
            make.right.equalToSuperview().inset(16)
            make.height.equalTo(1)
        }
        
        secondView.addSubview(dataLabel)
        dataLabel.snp.makeConstraints {make in
            make.top.equalTo(secondLabel.snp.bottom).offset(20)
            make.left.equalToSuperview().inset(16)
        }
        
        secondView.addSubview(secondLine)
        secondLine.snp.makeConstraints {make in
            make.left.equalToSuperview().inset(16)
            make.right.equalToSuperview().inset(16)
            make.height.equalTo(1)
            make.top.equalTo(dataLabel.snp.bottom).offset(10)
        }
        
        secondView.addSubview(datePicker)
        datePicker.snp.makeConstraints {make in
            make.top.equalTo(secondLine.snp.bottom).offset(5)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        secondView.addSubview(thirdLine)
        thirdLine.snp.makeConstraints {make in
            make.top.equalTo(datePicker.snp.bottom).offset(1)
            make.left.equalToSuperview().inset(16)
            make.right.equalToSuperview().inset(16)
            make.height.equalTo(1)
        }
        
        secondView.addSubview(secondViewLabel)
        secondViewLabel.snp.makeConstraints {make in
            make.top.equalTo(thirdLine.snp.bottom).offset(10)
            make.left.equalToSuperview().inset(16)
        }
    }
    
    // Configuring remaind at location View
    private func configureRemaindAtLocation(){
        view.addSubview(thirdView)
        thirdView.snp.makeConstraints {make in
            make.top.equalTo(secondView.snp.bottom).offset(40)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(50)
        }
        thirdView.addSubview(locationLabel)
        locationLabel.snp.makeConstraints {make in
            make.top.equalToSuperview().inset(16)
            make.left.equalToSuperview().inset(16)
        }
        
        thirdView.addSubview(secondSwitch)
        secondSwitch.snp.makeConstraints {make in
            make.top.equalToSuperview().inset(8)
            make.right.equalToSuperview().inset(16)
        }
    }
    
    private func configurePriorityView(){
        view.addSubview(priorityView)
        priorityView.snp.makeConstraints {make in
            make.top.equalTo(thirdView.snp.bottom).offset(40)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(140)
        }
        
        priorityView.addSubview(priorityLabel)
        priorityLabel.snp.makeConstraints {make in
            make.top.equalToSuperview().inset(10)
            make.left.equalToSuperview().inset(16)
        }
        priorityView.addSubview(segmentControl)
        segmentControl.snp.makeConstraints {make in
            make.top.equalToSuperview().inset(8)
            make.right.equalToSuperview().inset(16)
        }
        
        priorityView.addSubview(priorityLine)
        priorityLine.snp.makeConstraints {make in
            make.top.equalTo(segmentControl.snp.bottom).offset(10)
            make.left.equalToSuperview().inset(16)
            make.right.equalToSuperview().inset(16)
            make.height.equalTo(1)
        }
        
        priorityView.addSubview(notesLabel)
        notesLabel.snp.makeConstraints {make in
            make.top.equalTo(priorityLine.snp.bottom).offset(10)
            make.left.equalToSuperview().inset(16)
        }
        segmentControl.selectedSegmentIndex = .zero
    }

    @objc func printPriority(sender: UISegmentedControl){
        print(priorities[sender.selectedSegmentIndex])
    }
    @objc func doneButton(){
        print("Done button pressed")
    }
    @objc func cancelButton(){
        print("Cancel button pressed")
    }
}


