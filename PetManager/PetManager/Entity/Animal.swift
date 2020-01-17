//
//  Animal.swift
//  PetManager
//
//  Created by 이동영 on 2020/01/17.
//  Copyright © 2020 이동영. All rights reserved.
//

import Foundation

struct Animal {
    let name: String
    let cryingSound: String?
    let profileAssetName: String
}
extension Animal {
    static let dog = Animal(name: "강아지", cryingSound: "멍 멍", profileAssetName: ImageAsset.Name.dog)
    static let cat = Animal(name: "고양이", cryingSound: "야 옹", profileAssetName: ImageAsset.Name.cat)
    static let parrot = Animal(name: "앵무새", cryingSound: "짹 짹", profileAssetName: ImageAsset.Name.parrot)
    static let lizard = Animal(name: "도마뱀", cryingSound: nil, profileAssetName: ImageAsset.Name.lizard)

    static let defaultCases = [Animal.dog, Animal.cat, Animal.parrot, Animal.lizard]
}
