//
//  MainCoordinator.swift
//  Rick&Morty
//
//  Created by admin on 15.05.2024.
//

import SwiftUI
import FlowStacks

struct MainCoordinator: View {
    @StateObject var viewModel: MainCoordinatorModel
    
    var body: some View {
        Router($viewModel.routes) { screen, _ in
            switch screen {
            case .main:
                AllCharactersView(viewModel: viewModel.allCharactersViewModel)
                    .navigationTitle("All Charecters")
            case .details(let model):
                CharacterDetailView(viewModel: viewModel.initCharacterDetailViewModel(model: model))
            }
        }
    }
}

#Preview {
    MainCoordinator(viewModel: MainCoordinatorModel())
}
