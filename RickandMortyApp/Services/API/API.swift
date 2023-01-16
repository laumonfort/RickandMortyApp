//
//  API.swift
//  RickandMortyApp
//
//  Created by Laura Monfort Gomez on 16/1/23.
//

import Foundation
import Alamofire

final class RickMortyApi {
    
    func loadCharacter (completion: @escaping (Result<[Results], Error>) -> ())  {
        
        AF.request("https://rickandmortyapi.com/api/character").responseDecodable(of: Character.self) { response in
            
            switch response.result {
            case .success(let charactersList):
                completion(.success(charactersList.results))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
