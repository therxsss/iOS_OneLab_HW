//
//  CategoriesWrapper.swift
//  UnsplashPremium
//
//  Created by Abdurakhman on 04.05.2022.
//

import Foundation

struct APIResponse: Codable {
    let total: Int
    let totalPages: Int
    let results: [Resulted]
    
    enum CondingKeys: String, CodingKey {
        case total, results
        case totalPages = "total_pages"
    }
}


struct Resulted: Codable {
    let id: String
    let urls: URLS
}

struct URLS: Codable {
    let regular: String
}
