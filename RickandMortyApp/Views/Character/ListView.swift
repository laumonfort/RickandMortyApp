//
//  ListView.swift
//  RickandMortyApp
//
//  Created by Laura Monfort Gomez on 15/1/23.


import SwiftUI

struct ListView: View {
    @State private var characters: [Results] = []
    
    var body: some View {
        NavigationView {
            List(characters, id: \.id) { item in
                NavigationLink(destination: ListDetailView(character: item)) {
                    RowView(character: item)
                }
            }
            .onAppear(){
                RickMortyApi().loadCharacter() { result in
                    switch result {
                    case .success(let characters):
                        self.characters = characters
                    case .failure(let error):
                        print(error)
                    }
                }
            }
            .navigationTitle("Characters List")
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
