//
//  APIClient.swift
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
    case clientError(Int)
    case serverError(Int)
    case networkError(Error)
}

protocol RickMortyApiProtocol {
    func loadCharacter(completion: @escaping (Result<[Results]>) -> Void)
}

final class RickMortyApi: RickMortyApiProtocol {
    
    private let baseUrl = "https://rickandmortyapi.com/api/character"
    
    func loadCharacter(completion: @escaping (Result<[Results]>) -> Void) {
        AF.request(baseUrl).responseDecodable(of: CharacterResponse.self) { [weak self] response in
            switch response.result {
            case .success(let characterList):
                completion(.success(characterList.results))
            case .failure(let error):
                let networkError = self?.handleResponseError(response, error: error) ?? .networkError(error)
                completion(.failure(networkError))
            }
        }
    }
    
    private func handleResponseError(_ response: AFDataResponse<CharacterResponse>, error: Error) -> NetworkError {
        if let statusCode = response.response?.statusCode {
            
            switch statusCode {
            case 400..<500:
                return .clientError(statusCode)
            case 500..<600:
                return .serverError(statusCode)
            default:
                return .networkError(error)
            }
        } else {
            return .networkError(error)
        }
    }
}
  

