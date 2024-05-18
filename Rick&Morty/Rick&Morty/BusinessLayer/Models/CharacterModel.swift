//
//  CharacterModel.swift
//  Rick&Morty
//
//  Created by admin on 18.05.2024.
//

import Foundation

struct CharacterModel: Codable, Identifiable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: CharacterOriginModel
    let location: CharacterLocationModel
    let image: String
    let episode: [String]
    let url: String
    let created: String
}
