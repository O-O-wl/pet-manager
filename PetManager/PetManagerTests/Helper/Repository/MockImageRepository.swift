//
//  MockImageRepository.swift
//  PetManagerTests
//
//  Created by 이동영 on 2020/01/19.
//  Copyright © 2020 이동영. All rights reserved.
//
@testable import PetManager
import UIKit

class MockImageRepository: ImageRepository {
    
    var images: [String: UIImage]
    
    init(_ images: [String: UIImage]) {
        self.images = images
    }
    
    func add(_ image: UIImage, for key: String, completion: @escaping (Result<Void, Error>) -> Void) {
        ()
    }
    
    func fetch(for key: String, completion: @escaping (Result<UIImage, Error>) -> Void) {
        guard let image = images[key] else {
            completion(.failure(RepositoryError.notFound))
            return
        }
        completion(.success(image))
    }
}
