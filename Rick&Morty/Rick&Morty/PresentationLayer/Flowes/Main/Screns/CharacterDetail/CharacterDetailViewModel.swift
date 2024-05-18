//
//  CharacterDetailViewModel.swift
//  Rick&Morty
//
//  Created by admin on 15.05.2024.
//

import Foundation

final class CharacterDetailViewModel: ObservableObject {

    @Published var characterModel: CharacterModel
    
    init(characterModel: CharacterModel) {
        self.characterModel = characterModel
    }
}
