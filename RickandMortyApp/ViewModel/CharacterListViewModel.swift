//
//  CharacterListViewModel.swift
//  RickandMortyApp
//
//  Created by Laura Monfort on 29/8/24.
//

import Foundation

class CharacterListViewModel: ObservableObject {
    @Published var characters: [Results] = []
    @Published var showRetryButton: Bool = false
    private let apiClient: RickMortyApiProtocol

    init(apiClient: RickMortyApiProtocol = RickMortyApi()) {
        self.apiClient = apiClient
    }

    func loadData() {
        apiClient.loadCharacter { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let characters):
                    self?.characters = characters
                    self?.showRetryButton = false
                case .failure(let error as NSError) where error.code == NSURLErrorNotConnectedToInternet:
                    self?.showRetryButton = true
                    print("Error: Unable to connect to the Internet")
                default:
                    self?.showRetryButton = true
                    print("Unknown Error")
                }
            }
        }
    }
}
