//
//  NewContact.swift
//  Homework 2
//
//  Created by Lidiya Karnaukhova on 20.04.2022.
//

import Foundation
import UIKit

struct NewContactOption {
    var iconTitle: String
    var buttonTitle: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(iconTitle)
        hasher.combine(buttonTitle)
    }
}
