//
//  NewContactOption.swift
//  CollectionApp
//
//  Created by Abdurakhman on 17.04.2022.
//




struct NewContactOption {
    var iconTitle: String
    var buttonTitle: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(iconTitle)
        hasher.combine(buttonTitle)
    }
}
