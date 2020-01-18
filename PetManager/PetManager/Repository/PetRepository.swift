//
//  PetRepository.swift
//  PetManager
//
//  Created by 이동영 on 2020/01/18.
//  Copyright © 2020 이동영. All rights reserved.
//

import Foundation

protocol PetRepository {
    func add(pet: Pet, completion: @escaping (Result<Void, Error>) -> Void)
    func fetch(completion: @escaping (Result<[Pet], Error>) -> Void)
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
    
    // MARK: - CRUD
    
    func add(pet: Pet, completion: @escaping (Result<Void, Error>) -> Void) {
        pets.append(pet)
        storageService.save(pets, completion: completion)
    }
    
    func fetch(completion: @escaping (Result<[Pet], Error>) -> Void) {
        storageService.load { result in
            switch result {
            case .success(let pets):
                completion(.success(pets))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
