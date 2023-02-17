//
//  RowView.swift
//  RickandMortyApp
//
//  Created by Laura Monfort Gomez on 15/1/23.
//
// This view represents the character data

import SwiftUI

struct CharacterRowView: View {
    let character: Results
    
    var body: some View {
        HStack {
            AsyncImage(url: character.imageUrl) { image in
                image.resizable()
                
            } placeholder: {
                Image(systemName: "person.fill")
                    .resizable()
                    .padding()
            }
            .aspectRatio(contentMode: .fit)
            .frame(width: 60)
            .background(Color.gray.opacity(0.1))
            .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text(character.name?.capitalized ?? "")
                    .font(.headline)
                    .fontWeight(.medium)
                Text(character.species ?? "")
                    .font(.subheadline)
                    .fontWeight(.thin)
            }
            
            Spacer()
            
            if (character.status == "Alive") {
                Text(character.status ?? "")
                Image(systemName: "circle.fill")
                    .foregroundColor(.green)
            }else if(character.status == "unknown") {
                Text(character.status ?? "")
                Image(systemName: "circle.fill")
                    .foregroundColor(.orange)
            }else{
                Text(character.status ?? "")
                Image(systemName: "circle.fill")
                    .foregroundColor(.red)
            }
        }
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterRowView(character: Results(name: "Mau", status: "Alive", species: "Human"))
    }   
}
