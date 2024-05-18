//
//  CharacterInfoModel.swift
//  Rick&Morty
//
//  Created by admin on 18.05.2024.
//

import Foundation

struct CharacterInfoModel: Codable {
    let info: InfoModel
    let results: [CharacterModel]
}
