//
//  СharacterItemView.swift
//  Rick&Morty
//
//  Created by admin on 15.05.2024.
//

import SwiftUI
import NukeUI

struct CharacterItemView: View {
    
    var model: CharacterModel
    
    var body: some View {
        ZStack {
            VStack {
                LazyImage(url: URL(string: model.image)) { state in
                    if let image = state.image {
                        image
                            .resizable()
                            .cornerRadius(24)
                            .aspectRatio(contentMode: .fit)
                            .saturation(model.status == "Dead" ? 0 : 1.0)
                    }
                }
                HStack {
                    Text("👤")
                    Text(model.name)
                    Spacer()
                }
                
                HStack {
                    Text("🪐")
                    Text(model.location.name)
                    Spacer()
                }
            }
            .padding()
            .background(.white)
            .overlay(
                RoundedRectangle(cornerRadius: 24)
                    .stroke(.black, lineWidth: 1)
            )
            
            if model.status == "Dead" {
                Text("RIP")
                    .font(.system(size: 90).bold())
                    .foregroundStyle(.red)
            }
        }
    }
}
