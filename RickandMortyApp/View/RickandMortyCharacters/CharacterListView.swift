//
//  CharacterListView.swift
//  RickandMortyApp
//
//  Created by Laura Monfort Gomez on 15/1/23.

import SwiftUI

enum MyResult<T, E> {
    case success(T)
    case failure(E)
}

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
            case .success(let characters) :
                self.characters = characters
            case .failure(let error as NSError) where error.code == NSURLErrorNotConnectedToInternet:
                self.showRetryButton = true
                print("Error: Unable to connect to the Internet")
            default:
                self.showRetryButton = true
                print("Unknow Error")
            }
        }
    }
}
