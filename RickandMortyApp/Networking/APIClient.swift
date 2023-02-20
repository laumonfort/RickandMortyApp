//
//  API.swift
//  RickandMortyApp
//
//  Created by Laura Monfort Gomez on 16/1/23.


import Foundation
import Alamofire

// MARK: Rick and Morty API, Alamofire Request: an HTTP networking library written in Swift.
final class RickMortyApi {
    private let baseUrl = "https://rickandmortyapi.com/api/character"
    
    func loadCharacter(completion: @escaping (Result<[Results], Error>) -> Void) {
            AF.request(baseUrl).responseDecodable(of: Character.self) { response in
                switch response.result {
                case .success(let charactersList):
                    completion(.success(charactersList.results))
                case .failure(let error):
                    if let data = response.data, let apiError = try? JSONDecoder().decode(APIError.self, from: data) {
                        completion(.failure(apiError))
                    } else {
                        completion(.failure(error))
                    }
                }
            }
        }
    }

    struct APIError: Error, Decodable {
        let error: String
    }

