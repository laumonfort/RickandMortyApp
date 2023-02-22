//
//  CharacterListView.swift
//  RickandMortyApp
//
//  Created by Laura Monfort Gomez on 15/1/23.
import SwiftUI

struct CharacterListView: View {
    @State private var characters: [Results] = []
    @State private var showRetryButton: Bool = false
    
    var body: some View {
        NavigationView {
            if characters.isEmpty && showRetryButton {
                VStack {
                    Text("Unable to load data. Please check your internet connection.")
                    Button(action: {
                        loadData()
                    }, label: {
                        Text("Retry")
                    })
                }
            } else {
                List(characters, id: \.id) { item in
                    NavigationLink(destination: CharacterListDetailView(character: item)) {
                        CharacterRowView(character: item)
                    }
                }
                .navigationTitle("Character List")
                .onAppear() {
                    if characters.isEmpty {
                        loadData()
                    }
                }
            }
        }
    }
    
    private func loadData() {
        RickMortyApi().loadCharacter() { result in
            switch result {
            case .success(let characters):
                self.characters = characters
            case .failure(let error):
                print(error)
                self.showRetryButton = true
            }
        }
    }
}

struct CharacterListView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListView()
    }
}
