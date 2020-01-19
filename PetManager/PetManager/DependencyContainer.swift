//
//  DependencyContainer.swift
//  PetManager
//
//  Created by 이동영 on 2020/01/19.
//  Copyright © 2020 이동영. All rights reserved.
//

import Foundation

class DependencyContainer {
    
    static let shared = DependencyContainer()
    
    // MARK: - Service
    
    lazy var cacheService = ImageCacheServiceImplementation()
    lazy var assetImageService = AssetImageServiceImplementation()
    lazy var storageService = PetStoragServiceImplementation.default
    
    // MARK: - Provider
    
    lazy var animalTypeProvider = AnimalTypeProviderImplementation()
    
    // MARK: - Repository
    
    lazy var petRepository = PetRepositoryImplementation(storageService: storageService)
    lazy var imageRepository = ImageRepositoryImplementation(cacheService: cacheService,
                                                             assetImageService: assetImageService)
    
    
    private init() {}
    
}
