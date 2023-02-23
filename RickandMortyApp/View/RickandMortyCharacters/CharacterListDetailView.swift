//
//  ListDetailView.swift
//  RickandMortyApp
//
//  Created by Laura Monfort Gomez on 15/1/23.

import SwiftUI

struct CharacterListDetailView: View {
    var character: Results
    
    var body: some View {
        VStack {
            characterImage
            characterName
            characterSpecies
            characterStatus
            Spacer()
        }
    }
    
    private var characterImage: some View {
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
    }
    
    private var characterName: some View {
        Text(character.name ?? "")
            .font(.largeTitle)
    }
    
    private var characterSpecies: some View {
        Text(character.species ?? "")
            .font(.title2)
            .foregroundColor(.gray)
    }
    
    private var characterStatus: some View {
        HStack {
            Text(character.status ?? "")
                .font(.title3)
                .foregroundColor(.gray)
            statusCircle
        }
    }
    
    private var statusCircle: some View {
        guard let status = CharacterStatus(rawValue: character.status ?? "") else {
            return Image(systemName: "circle.fill")
                .foregroundColor(.gray)
        }
        return Image(systemName: "circle.fill")
            .foregroundColor(status.color)
    }
}

struct CharacterListDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListDetailView (character: Results.init(name: "Name", status: "Alive", species: "String", url: "url"))
    }
}
