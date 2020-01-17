//
//  StoageService.swift
//  PetManager
//
//  Created by 이동영 on 2020/01/18.
//  Copyright © 2020 이동영. All rights reserved.
//

import Foundation

protocol PetStoageService {
    func load(completion: @escaping (Result<[Pet], Error>) -> Void)
    func save(_ pets: [Pet], completion: @escaping (Result<Void, Error>) -> Void)
}

class PetStoagServiceImplementation: PetStoageService {
    
    // MARK: - Properties
    
    private let fileURL: URL = {
        let documentURL = FileManager.default.urls(for: .documentationDirectory, in: .userDomainMask).first!
        let fileName = "pets"
        return documentURL.appendingPathComponent(fileName)
    }()
    
    // MARK: - Initalization
    
    private init() {}
    
    // MARK: - Methods
    
    func load(completion: @escaping (Result<[Pet], Error>) -> Void) {
        do {
            let data = try Data(contentsOf: fileURL)
            let pets = try JSONDecoder().decode([Pet].self, from: data)
            completion(.success(pets))
        } catch {
            completion(.failure(error))
        }
    }
    
    func save(_ pets: [Pet], completion: @escaping (Result<Void, Error>) -> Void) {
        do {
            let data = try JSONEncoder().encode(pets)
            try data.write(to: fileURL)
        } catch {
            completion(.failure(error))
        }
    }
}

// MARK: - Singletone

extension PetStoagServiceImplementation {
    static let shared = PetStoagServiceImplementation()
}
