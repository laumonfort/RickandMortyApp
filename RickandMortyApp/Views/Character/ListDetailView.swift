//
//  ListDetailView.swift
//  RickandMortyApp
//
//  Created by Laura Monfort Gomez on 15/1/23.

import SwiftUI

struct ListDetailView: View {
    var character: Results
    
    var body: some View {
        VStack {
            AsyncImage(url: character.imageUrl) { image in
                image
                    .resizable()
                    .frame(width: 300, height: 300)
                    .clipShape(Circle())
                
            } placeholder: {
                Image(systemName: "person.fill")
                    .resizable()
                    .frame(width: 300, height: 300)
                    .clipShape(Circle())
            }
            let _ =
            Text(character.name ?? "")
                .font(.largeTitle)
            let _ =
            Text(character.species ?? "")
                .font(.title2)
                .foregroundColor(.gray)
            
            HStack {
                let _ =
                Text(character.status ?? "")
                    .font(.title3)
                    .foregroundColor(.gray)
                if (character.status == "Alive") {
                    Image(systemName: "circle.fill")
                        .foregroundColor(.green)
                }else if(character.status == "unknown") {
                    Image(systemName: "circle.fill")
                        .foregroundColor(.orange)
                }else{
                    Image(systemName: "circle.fill").foregroundColor(.red)
                }
            }
            
            Spacer()
        }
    }
}

struct ListDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        ListDetailView (character: Results.init(name: "Name", status: "Alive", species: "String", url: "url"))
    }
}
