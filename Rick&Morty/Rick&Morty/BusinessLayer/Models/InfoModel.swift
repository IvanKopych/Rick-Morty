//
//  InfoModel.swift
//  Rick&Morty
//
//  Created by admin on 18.05.2024.
//

import Foundation

struct InfoModel: Codable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}
