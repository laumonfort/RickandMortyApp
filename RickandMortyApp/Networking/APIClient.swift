//
//  API.swift
//  RickandMortyApp
//
//  Created by Laura Monfort Gomez on 16/1/23.
//
// MARK: Rick and Morty API, Alamofire Request: an HTTP networking library written in Swift.

import Foundation
import Alamofire

enum Result<T> {
    case success(T)
    case failure(Error)
}

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case decodingError
    case serverError(Int)
    case networkError(Error)
}

protocol RickMortyApiProtocol {
    func loadCharacter(completion: @escaping (Result<[Results]>) -> Void)
}

final class RickMortyApi: RickMortyApiProtocol {
    private let baseUrl = "https://rickandmortyapi.com/api/character"

    func loadCharacter(completion: @escaping (Result<[Results]>) -> Void) {
        AF.request(baseUrl).responseDecodable(of: Character.self) { response in
            switch response.result {
            case .success(let character):
                completion(.success(character.results))
            case .failure(let error):
                if let response = response.response {
                    if 400..<500 ~= response.statusCode {
                        completion(.failure(NetworkError.serverError(response.statusCode)))
                    } else {
                        completion(.failure(NetworkError.networkError(error)))
                    }
                } else {
                    completion(.failure(NetworkError.networkError(error)))
                }
            }
        }
    }
}
