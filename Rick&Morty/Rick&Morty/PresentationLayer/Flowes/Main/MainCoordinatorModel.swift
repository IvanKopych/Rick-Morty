//
//  MainCoordinatorModel.swift
//  Rick&Morty
//
//  Created by admin on 15.05.2024.
//

import Foundation
import FlowStacks

final class MainCoordinatorModel: ObservableObject {
    enum Screen {
        case main
        case details(model: CharacterModel)
    }
    
    // MARK: - Published

    @Published var routes: Routes<Screen> = [.root(.main, embedInNavigationView: true)]
    @Published var allCharactersViewModel = AllCharactersViewModel(onAction: {_ in })
    
    init() {
        allCharactersViewModel.onAction = { [weak self] action in
            switch action {
            case .detail(model: let model):
                self?.showDetails(for: model)
            }
        }
    }
    
    private func showDetails(for model: CharacterModel) {
        routes.push(.details(model: model))
    }
    
    func initCharacterDetailViewModel(model: CharacterModel) -> CharacterDetailViewModel {
        let viewModel = CharacterDetailViewModel(characterModel: model)
        return viewModel
    }
}
