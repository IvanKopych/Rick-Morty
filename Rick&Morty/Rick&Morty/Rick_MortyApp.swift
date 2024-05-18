//
//  Rick_MortyApp.swift
//  Rick&Morty
//
//  Created by admin on 15.05.2024.
//

import SwiftUI

@main
struct Rick_MortyApp: App {
    var body: some Scene {
        WindowGroup {
            MainCoordinator(viewModel: MainCoordinatorModel())
        }
    }
}
