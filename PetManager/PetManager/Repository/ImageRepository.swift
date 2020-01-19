//
//  ImageRepository.swift
//  PetManager
//
//  Created by 이동영 on 2020/01/19.
//  Copyright © 2020 이동영. All rights reserved.
//

import UIKit

protocol ImageRepository {
    func add(_ image: UIImage, for key: String, completion: @escaping (Result<Void, Error>) -> Void)
    func fetch(for key: String, completion: @escaping (Result<UIImage, Error>) -> Void)
}

class ImageRepositoryImplementation: ImageRepository {
    
    // MARK: - Dependencies
    
    private let cacheService: ImageCacheService
    private let assetImageService: AssetImageService
    
    // MARK: - Initialization
    
    init(cacheService: ImageCacheService, assetImageService: AssetImageService) {
        self.cacheService = cacheService
        self.assetImageService = assetImageService
    }
    
    // MARK: - Methods
    
    func add(_ image: UIImage, for key: String, completion: @escaping (Result<Void, Error>) -> Void) {
        cacheService.add(image, for: key)
        completion(.success(()))
    }
    
    func fetch(for key: String, completion: @escaping (Result<UIImage, Error>) -> Void) {
        if let cachedImage = cacheService.fetch(for: key) {
            completion(.success(cachedImage))
            return
        } else if let assetImage = assetImageService.fetchImage(assetName: key) {
            completion(.success(assetImage))
            cacheService.add(assetImage, for: key)
            return
        }
        completion(.failure(RepositoryError.notFound))
    }
    
}
