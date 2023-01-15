//
//  ListView.swift
//  RickandMortyApp
//
//  Created by Laura Monfort Gomez on 15/1/23.
// Pintamos una lista

import SwiftUI

private let characters = [Character(
    id: 1,
    image: Image(systemName: "person.fill"),
    name: "Mau", type: "human"), Character(
        id: 2,
        image: Image(systemName: "person.fill"),
        name: "Meu", type: "human"),]

struct ListView: View {
    var body: some View {
        List(characters, id: \.id) { character in RowView(character: character)
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
