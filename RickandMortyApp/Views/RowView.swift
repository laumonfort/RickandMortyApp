//
//  RowView.swift
//  RickandMortyApp
//
//  Created by Laura Monfort Gomez on 15/1/23.

// Celda encargada de representar los datos de los personajes

import SwiftUI

struct RowView: View {
    
    var character: Results // de modo que podemos asignar un objeto de tipo character a cada celda y así poder acceder a sus datos
    var body: some View {
        HStack {
            AsyncImage(url: character.imageUrl) {
                image in image.resizable()
            }placeholder:{
                Image(systemName: "person.fill")
                    .resizable()
                    .padding()
            }
            .aspectRatio(contentMode: .fit)
            .frame(width: 60)
            .background(Color.gray.opacity(0.1))
            .clipShape(Circle())
            Text(character.name!)
            Text(character.species!)
            
           /* character.image!.resizable()
                .resizable()
                .frame(width:40, height: 40).padding(10)
            VStack(alignment: .leading){
                    Text(character.name!)
                    Text(character.type!)*/
            Spacer()
        }
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(character: Results(name: "Mau", status: "Alive", species: "Human"))
                //id: 1,
            //image: Image(systemName: "person.fill"),
            //name: "Mau", type: "human"))
    }   
}
