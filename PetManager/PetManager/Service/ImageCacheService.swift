//
//  ImageCacheServcie.swift
//  PetManager
//
//  Created by 이동영 on 2020/01/19.
//  Copyright © 2020 이동영. All rights reserved.
//

import UIKit

protocol ImageCacheService {
    func add(_ image: UIImage, for key: String)
    func fetch(for key: String) -> UIImage?
}

class ImageCacheServiceImplementation: ImageCacheService {
    private let cache = NSCache<NSString, UIImage>()
    
    func add(_ image: UIImage, for key: String) {
        cache.setObject(image, forKey: key as NSString)
    }
    
    func fetch(for key: String) -> UIImage? {
        return cache.object(forKey: key as NSString)
    }
    
    func remove(for key: String) {
        cache.removeObject(forKey: key as NSString)
    }
}
