//
//  AllCharactersViewModel.swift
//  Rick&Morty
//
//  Created by admin on 15.05.2024.
//

import Foundation
import Dependencies
import Nuke

final class AllCharactersViewModel: ObservableObject {
    
    enum Action {
        case detail(model: CharacterModel)
    }
    
    // MARK: - Published
    
    @Published var characters: [CharacterModel] = []
    var page = 1
    var nextPage: String?
    
    @Dependency(NetworkService.self) var networkService
    
    var onAction: (Action) -> Void
    
    init(onAction: @escaping (Action) -> Void) {
        self.onAction = onAction
    }
    
    // MARK: - Methods(Public)
    
    func fetchCharacters() async {
        do {
            let data = try await networkService.getAllCharacters(page: page)
            await MainActor.run {
                self.characters.append(contentsOf: data.results)
                self.nextPage = data.info.next
                self.page += 1
            }
            
        } catch {
            print(error)
        }
    }
}

