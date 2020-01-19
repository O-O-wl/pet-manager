//
//  ImageRepository.swift
//  PetManager
//
//  Created by 이동영 on 2020/01/19.
//  Copyright © 2020 이동영. All rights reserved.
//

import UIKit

protocol ImageRepository {
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
    
    func fetch(for key: String, completion: @escaping (Result<UIImage, Error>) -> Void) {
        if let cachedImage = cacheService.fetch(for: key) {
            completion(.success(cachedImage))
            return
        } else if let assetImage = assetImageService.fetchImage(assetName: key) {
            completion(.success(assetImage))
            return
        }
        completion(.failure(RepositoryError.badRequest))
    }
    
}
