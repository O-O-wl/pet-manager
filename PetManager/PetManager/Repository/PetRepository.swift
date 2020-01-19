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
    func modify(itemAt index: Int, to newPet: Pet, completion: @escaping (Result<Void, Error>) -> Void)
    func delete(itemAt index: Int, completion: @escaping (Result<Void, Error>) -> Void)
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
    
    func add(pet: Pet, completion: @escaping (Result<Void, Error>) -> Void) {
        pets.append(pet)
        storageService.save(pets, completion: completion)
    }
    
    func fetch(completion: @escaping (Result<[Pet], Error>) -> Void) {
        storageService.load { result in
            switch result {
            case .success(let pets):
                self.pets = pets
                completion(.success(pets))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func modify(itemAt index: Int, to newPet: Pet, completion: @escaping (Result<Void, Error>) -> Void) {
        guard index < pets.count else {
            completion(.failure(RepositoryError.notFound))
            return
        }
        
        pets[index] = newPet
        storageService.save(pets, completion: completion)
    }
    
    func delete(itemAt index: Int, completion: @escaping (Result<Void, Error>) -> Void) {
        guard index < pets.count else {
            completion(.failure(RepositoryError.notFound))
            return
        }
        
        pets.remove(at: index)
        storageService.save(pets, completion: completion)
    }
}
