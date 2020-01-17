//
//  PetRepository.swift
//  PetManager
//
//  Created by 이동영 on 2020/01/18.
//  Copyright © 2020 이동영. All rights reserved.
//

import Foundation

protocol PetRepository {
    func fetch(at indexPath: IndexPath, completion: @escaping (Result<Pet, Error>) -> Void)
}

class PetRepositoryImplementation: PetRepository {
    
    // MARK: - Dependencies
    
    private let storageService: PetStorageService
    
    // MARK: - Properties
    
    private var pets: [Pet] = []
    
    // MARK: - Initialization
    
    init(storageService: PetStorageService) {
        self.storageService = storageService
    }
    
    // MARK: - Methods
    
    func fetch(at indexPath: IndexPath, completion: @escaping (Result<Pet, Error>) -> Void) {
        let index = indexPath.row
        if pets.count <= index {
            reload(completion: { result in
                switch result {
                case .success(_):
                    if self.pets.count > index {
                        completion(.success(self.pets[index]))
                    } else {
                        completion(.failure(RepositoryError.outOfRange))
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
            })
        } else {
            completion(.success(self.pets[index]))
        }
    }
    
    private func reload(completion: @escaping (Result<Void, Error>) -> Void) {
        storageService.load { [weak self] result in
            switch result {
            case .success(let pets):
                self?.pets = pets
                completion(.success(()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}

// MARK: - RepositoryError

enum RepositoryError: Error {
    case outOfRange
}
