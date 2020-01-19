//
//  MockPetRepository.swift
//  PetManagerTests
//
//  Created by 이동영 on 2020/01/19.
//  Copyright © 2020 이동영. All rights reserved.
//
@testable import PetManager
import Foundation

class MockPetRepository: PetRepository {
    var pets: [Pet]
    
    init(pets: [Pet] = []) {
        self.pets = pets
    }
    
    func add(pet: Pet, completion: @escaping (Result<Void, Error>) -> Void) {
        pets.append(pet)
        completion(.success(()))
    }
    
    func fetch(completion: @escaping (Result<[Pet], Error>) -> Void) {
        completion(.success((pets)))
    }
    
    /// 인덱스를 넘어선 안됨
    func modify(itemAt index: Int, to newPet: Pet, completion: @escaping (Result<Void, Error>) -> Void) {
        pets[index] = newPet
        completion(.success(()))
    }
    
    /// 인덱스를 넘어선 안됨
    func delete(itemAt index: Int, completion: @escaping (Result<Void, Error>) -> Void) {
        pets.remove(at: index)
        completion(.success(()))
    }
}
