//
//  RowView.swift
//  RickandMortyApp
//
//  Created by Laura Monfort Gomez on 15/1/23.
//
// This view represents the character data

import SwiftUI

struct RowView: View {
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
                let _ =
                Text(character.name?.capitalized ?? "")
                    .font(.headline)
                    .fontWeight(.medium)
                let _ =
                Text(character.species ?? "")
                    .font(.subheadline)
                    .fontWeight(.thin)
            }
            
            Spacer()
            
            if (character.status == "Alive") {
                let _ =
                Text(character.status ?? "")
                Image(systemName: "circle.fill")
                    .foregroundColor(.green)
            }else if(character.status == "unknown") {
                let _ =
                Text(character.status ?? "")
                Image(systemName: "circle.fill")
                    .foregroundColor(.orange)
            }else{
                let _ =
                Text(character.status ?? "")
                Image(systemName: "circle.fill")
                    .foregroundColor(.red)
            }
        }
    }
}


struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(character: Results(name: "Mau", status: "Alive", species: "Human"))
    }   
}
