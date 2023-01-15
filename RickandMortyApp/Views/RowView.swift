//
//  RowView.swift
//  RickandMortyApp
//
//  Created by Laura Monfort Gomez on 15/1/23.

// Celda encargada de representar los datos de los personajes

import SwiftUI

struct RowView: View {
    
    var character: Character // de modo que podemos asignar un objeto de tipo character a cada celda y así poder acceder a sus datos
    var body: some View {
        HStack {
            character.image!.resizable()
                .resizable()
                .frame(width:40, height: 40).padding(10)
            VStack(alignment: .leading){
                    Text(character.name!)
                    Text(character.type!)
                    
                }
        Spacer()
        }
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(character:Character(
            id: 1,
            image: Image(systemName: "person.fill"),
            name: "Mau", type: "human"))
    }
}
