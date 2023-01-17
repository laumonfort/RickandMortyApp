//
//  ListView.swift
//  RickandMortyApp
//
//  Created by Laura Monfort Gomez on 15/1/23.

// Pintamos una lista

import SwiftUI

    /*id: 1,
    image: Image(systemName: "person.fill"),
    name: "Mau", type: "human"), Character(
        id: 2,
        image: Image(systemName: "person.fill"),
        name: "Meu", type: "human"),]*/

struct ListView: View {
    
    @State private var characters: [Results] = []
   // @State private var showFavorites = false
    
    var body: some View {
        NavigationView {
            List(characters, id: \.id) { item in
                NavigationLink(destination: ListDetailView(character: item)) {// Navegation between screens
                    RowView(character: item)
                }
            }
            .onAppear(){
                RickMortyApi().loadCharacter { result in
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



