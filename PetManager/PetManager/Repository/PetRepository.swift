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

    // MARK: - Initialization
    
    init(storageService: PetStorageService) {
        self.storageService = storageService
    }
    
    // MARK: - Methods
    
    func fetch(at indexPath: IndexPath, completion: @escaping (Result<Pet, Error>) -> Void) {
        ()
    }
    
}
