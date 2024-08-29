//
//  Character.swift
//  RickandMortyApp
//
//  Created by Laura Monfort Gomez on 15/1/23.
//
//  This model conforms to the Decodable protocol. Decodable means that it can be decoded - for example, we can transform a JSON object into this data model.

import Foundation

struct CharacterResponse: Hashable, Decodable {
    let results: [Results]
}

struct Results: Hashable, Decodable {
    var id: Int? {return Int(url?.split(separator: "/").last?.description ?? "0")}
    let name: String?
    let status: String?
    var imageUrl: URL? { return URL(string:"https://rickandmortyapi.com/api/character/avatar/\(id ?? 0).jpeg")}
    let species: String?
    var url: String?
}
