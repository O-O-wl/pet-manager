//
//  MockImageCache.swift
//  PetManagerTests
//
//  Created by 이동영 on 2020/01/19.
//  Copyright © 2020 이동영. All rights reserved.
//

@testable import PetManager
import UIKit

class MockImageCacheService: ImageCacheService {
    
    private let registerdAssetName: [String]
    private let fakeImage: UIImage
    
    init(registerdAssetName: String..., fakeImage: UIImage) {
        self.registerdAssetName = registerdAssetName.map{ $0 }
        self.fakeImage = fakeImage
    }
    
    func add(_ image: UIImage, for key: String) {
        ()
    }
    
    func fetch(for key: String) -> UIImage? {
        return registerdAssetName.contains(key) ? fakeImage : nil
    }
}
