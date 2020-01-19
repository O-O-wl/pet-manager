//
//  StoageService.swift
//  PetManager
//
//  Created by 이동영 on 2020/01/18.
//  Copyright © 2020 이동영. All rights reserved.
//

import Foundation

protocol PetStorageService {
    func load(completion: @escaping (Result<[Pet], Error>) -> Void)
    func save(_ pets: [Pet], completion: @escaping (Result<Void, Error>) -> Void)
}

class PetStoragServiceImplementation: PetStorageService {
    
    // MARK: - Properties
    
    private let fileURL: URL
    
    // MARK: - Initalization
    
    init(fileURL: URL) {
        self.fileURL = fileURL
    }
    
    // MARK: - Methods
    
    func load(completion: @escaping (Result<[Pet], Error>) -> Void) {
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: self.fileURL)
                let pets = try JSONDecoder().decode([Pet].self, from: data)
                completion(.success(pets))
                
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    func save(_ pets: [Pet], completion: @escaping (Result<Void, Error>) -> Void) {
        DispatchQueue.global().async {
            do {
                let data = try JSONEncoder().encode(pets)
                try data.write(to: self.fileURL)
                completion(.success(()))
            } catch {
                completion(.failure(error))
            }
        }
    }
}

// MARK: - Singletone plus

extension PetStoragServiceImplementation {
    static let fileURL: URL = {
        let documentationDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileName = "pets"
        return documentationDirectory.appendingPathComponent(fileName)
    }()
    
    static let `default` = PetStoragServiceImplementation(fileURL: fileURL)
}
