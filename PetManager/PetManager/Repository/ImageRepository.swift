//
//  ImageRepository.swift
//  PetManager
//
//  Created by 이동영 on 2020/01/19.
//  Copyright © 2020 이동영. All rights reserved.
//

import UIKit

protocol ImageRepository {
    
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
}
