//
//  MockPetStoageService.swift
//  PetManagerTests
//
//  Created by 이동영 on 2020/01/18.
//  Copyright © 2020 이동영. All rights reserved.
//
@testable import PetManager
import Foundation

class MockPetStorageService: PetStorageService {
    
    // MARK: - Dependecies
    
    var pets: [Pet]
    
     // MARK: - Initalization
    
    init(pets: [Pet]) {
        self.pets = pets
    }
    
    // MARK: - Methods
    
    func load(completion: @escaping (Result<[Pet], Error>) -> Void) {
        completion(.success(pets))
    }
    
    func save(_ pets: [Pet], completion: @escaping (Result<Void, Error>) -> Void) {
        self.pets = pets
        completion(.success(()))
    }
}
