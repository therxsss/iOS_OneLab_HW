//
//  ConfigurableCell.swift
//  CollectionApp
//
//  Created by Abdurakhman on 17.04.2022.
//


protocol ConfigurableCell {
    associatedtype DataType
    static var reuseIdentifier: String { get }
    func configure(data: DataType)
}

extension ConfigurableCell {
    static var reuseIdentifier: String { return String(describing: Self.self) }
}
