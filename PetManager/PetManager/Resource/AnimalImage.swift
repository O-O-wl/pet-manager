//
//  UIImage+.swift
//  PetManager
//
//  Created by 이동영 on 2020/01/17.
//  Copyright © 2020 이동영. All rights reserved.
//

import UIKit

enum AnimalImage {
    static let dog = #imageLiteral(resourceName: "dog")
    static let cat = #imageLiteral(resourceName: "cat")
    static let parrot = #imageLiteral(resourceName: "parrot")
    static let lizard = #imageLiteral(resourceName: "lizard")
}

enum AnimalImageData {
    static let dog = AnimalImage.dog.pngData()!
    static let cat = AnimalImage.cat.pngData()!
    static let parrot = AnimalImage.parrot.pngData()!
    static let lizard = AnimalImage.lizard.pngData()!
}
