//
//  CharacterRowView.swift
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
            characterImage
            characterDetails
            Spacer()
            characterStatus
        }
    }
    
    enum CharacterStatus: String {
        case alive = "Alive"
        case unknown = "unknown"
        case dead = "Dead"
        
        var color: Color {
            switch self {
            case .alive:
                return .green
            case .unknown:
                return .orange
            case .dead:
                return .red
            }
        }
    }

    private var characterImage: some View {
        AsyncImage(url: character.imageUrl) { image in
            image
                .resizable()
        } placeholder: {
            Image(systemName: "person.fill")
                .resizable()
                .padding()
        }
        .aspectRatio(contentMode: .fit)
        .frame(width: 60)
        .background(Color.gray.opacity(0.1))
        .clipShape(Circle())
    }

    private var characterDetails: some View {
        VStack(alignment: .leading) {
            Text(character.name?.capitalized ?? "")
                .font(.headline)
                .fontWeight(.medium)
            Text(character.species ?? "")
                .font(.subheadline)
                .fontWeight(.thin)
        }
    }

    private var characterStatus: some View {
        if let status = CharacterStatus(rawValue: character.status ?? "") {
            return AnyView(
                HStack {
                    Text(status.rawValue)
                    Image(systemName: "circle.fill")
                        .foregroundColor(status.color)
                }
            )
        } else {
            return AnyView(Text("Unknown status"))
        }
    }
}

struct CharacterRowView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterRowView(character: Results(name: "Mau", status: "Alive", species: "Human"))
    }
}
