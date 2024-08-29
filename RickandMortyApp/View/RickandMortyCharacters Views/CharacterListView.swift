//
//  CharacterListView.swift
//  RickandMortyApp
//
//  Created by Laura Monfort Gomez on 15/1/23.

import SwiftUI

struct CharacterListView: View {
    @StateObject var viewModel = CharacterListViewModel()

    var body: some View {
        NavigationView {
            if viewModel.characters.isEmpty && viewModel.showRetryButton {
                VStack {
                    Text("Unable to load data. Please check your internet connection.")
                    Button(action: {
                        viewModel.loadData()
                    }, label: {
                        Text("Retry")
                    })
                }
            } else {
                List(viewModel.characters, id: \.id) { item in
                    NavigationLink(destination: CharacterListDetailView(viewModel: CharacterDetailViewModel(character: item))) {
                        CharacterRowView(character: item)
                    }
                }
                .navigationTitle("Character List")
                .onAppear() {
                    if viewModel.characters.isEmpty {
                        viewModel.loadData()
                    }
                }
            }
        }
    }
}
