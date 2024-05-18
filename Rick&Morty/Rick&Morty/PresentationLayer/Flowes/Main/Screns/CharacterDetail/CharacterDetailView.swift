//
//  CharacterDetailView.swift
//  Rick&Morty
//
//  Created by admin on 15.05.2024.
//

import SwiftUI
import NukeUI

struct CharacterDetailView: View {
    
    @StateObject var viewModel: CharacterDetailViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                LazyImage(url: URL(string: viewModel.characterModel.image)) { state in
                    if let image = state.image {
                        image
                            .resizable()
                            .cornerRadius(24)
                            .aspectRatio(contentMode: .fit)
                    }
                }
                
                HStack {
                    Text("Gender")
                        .font(.title)
                    
                    Spacer()
                    
                    Text(viewModel.characterModel.gender)
                        .font(.headline)
                }
                .padding()
                
                Divider()
                
                HStack {
                    Text("Species")
                        .font(.title)
                    
                    Spacer()
                    
                    Text(viewModel.characterModel.species)
                        .font(.headline)
                }
                .padding()
                
                Divider()
                
                HStack {
                    Text("Status")
                        .font(.title)
                    
                    Spacer()
                    
                    Text(viewModel.characterModel.status)
                        .font(.headline)
                }
                .padding()
                
                Divider()
                
                HStack {
                    Text("Location")
                        .font(.title)
                    
                    Spacer()
                    
                    Text(viewModel.characterModel.location.name)
                        .font(.headline)
                }
                .padding()
                
                Divider()
                
                HStack {
                    Text("Origin")
                        .font(.title)
                    
                    Spacer()
                    
                    Text(viewModel.characterModel.origin.name)
                        .font(.headline)
                }
                .padding()  
            }
            .padding(.horizontal)
            .navigationTitle(viewModel.characterModel.name)
        }
    }
}
