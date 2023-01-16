//
//  Character.swift
//  RickandMortyApp
//
//  Created by Laura Monfort Gomez on 15/1/23.
//
//  This model conforms to the Identifiable and Decodable protocols. Identifiable means that each item has a unique ID. Decodable means that it can be decoded - for example, we can transform a JSON object into this data model.

import Foundation
//import SwiftUI

struct Character: Hashable, Decodable {
    
    let results: [Results]
    
}

struct Results: Hashable, Decodable {
    
    var id: Int? {return Int(url!.split(separator: "/").last?.description ?? "0")}
    
    let name: String?
    let status: String?
    var imageUrl: URL? { return URL(string:"https://rickandmortyapi.com/api/character/avatar/\(id ?? 0).jpeg")}
    let species: String?
    var url: String?
    //let type: String?
     
}
    
        //let created: String?
        //let episode: [String]?
        //let gender: String?
        //let id: Int?
        //let image: Image?
        //let location: Location?
        //let name: String?
        //let origin: Origin?
        //let species: String?
        //let status: Status?
        //let type: String?
        //let url: String?
    

