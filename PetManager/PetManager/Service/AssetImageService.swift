//
//  AssetImageService.swift
//  PetManager
//
//  Created by 이동영 on 2020/01/18.
//  Copyright © 2020 이동영. All rights reserved.
//

import UIKit

protocol AssetImageService {
    func fetchImage(assetName: String) -> UIImage?
}

class AssetImageServiceImplementation: AssetImageService {
    func fetchImage(assetName: String) -> UIImage? {
        return UIImage(named: assetName)
    }
}
