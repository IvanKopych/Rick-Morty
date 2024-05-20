//
//  AllCharactersView.swift
//  Rick&Morty
//
//  Created by admin on 15.05.2024.
//

import SwiftUI

struct AllCharactersView: View {
    
    @StateObject var viewModel: AllCharactersViewModel
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.characters) { charecter in
                    CharacterItemView(model: charecter)
                        .padding()
                        .onAppear {
                            if viewModel.nextPage != nil {
                                if viewModel.characters.last?.id == charecter.id {
                                    Task {
                                        await viewModel.fetchCharacters()
                                    }
                                }
                            }
                        }
                        .onTapGesture {
                            viewModel.onAction(.detail(model: charecter))
                        }
                }
            }
        }
        .task { 
            await viewModel.fetchCharacters()
        }
    }
}

#Preview {
    AllCharactersView(viewModel: AllCharactersViewModel(onAction: {_ in }))
}
