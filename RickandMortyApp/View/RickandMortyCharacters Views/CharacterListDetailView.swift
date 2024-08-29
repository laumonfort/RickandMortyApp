//
//  ListDetailView.swift
//  RickandMortyApp
//
//  Created by Laura Monfort Gomez on 15/1/23.

import SwiftUI

struct CharacterListDetailView: View {
    @ObservedObject var viewModel: CharacterDetailViewModel

    var body: some View {
        VStack {
            characterImage
            characterName
            characterSpecies
            characterStatus
            Spacer()
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
        AsyncImage(url: viewModel.character.imageUrl) { image in
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
        Text(viewModel.character.name ?? "")
            .font(.largeTitle)
    }

    private var characterSpecies: some View {
        Text(viewModel.character.species ?? "")
            .font(.title2)
            .foregroundColor(.gray)
    }

    private var characterStatus: some View {
        HStack {
            Text(viewModel.character.status ?? "")
                .font(.title3)
                .foregroundColor(.gray)
            statusCircle
        }
    }

    private var statusCircle: some View {
        guard let status = CharacterStatus(rawValue: viewModel.character.status ?? "") else {
            return Image(systemName: "circle.fill")
                .foregroundColor(.gray)
        }
        return Image(systemName: "circle.fill")
            .foregroundColor(status.color)
    }
}

struct CharacterListDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListDetailView(viewModel: CharacterDetailViewModel(character: Results(name: "Name", status: "Alive", species: "String", url: "url")))
    }
}
