//
//  ConfigurableCell.swift
//  Homework 2
//
//  Created by Lidiya Karnaukhova on 20.04.2022.
//

import Foundation

protocol ConfigurableCell {
    associatedtype DataType
    static var reuseIdentifier: String { get }
    func configure(data: DataType)
}

extension ConfigurableCell {
    static var reuseIdentifier: String { return String(describing: Self.self) }
}
