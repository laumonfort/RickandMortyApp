//
//  CharacterDetailViewModel.swift
//  RickandMortyApp
//
//  Created by Laura Monfort on 29/8/24.
//

import Foundation

import Foundation

class CharacterDetailViewModel: ObservableObject {
    @Published var character: Results

    init(character: Results) {
        self.character = character
    }
}
