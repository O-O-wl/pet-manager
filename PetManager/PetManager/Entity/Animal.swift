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
    let profileImageData: Data
}
extension Animal {
    static let dog = Animal(name: "강아지", cryingSound: "멍 멍", profileImageData: AnimalImageData.dog)
    static let cat = Animal(name: "고양이", cryingSound: "야 옹", profileImageData: AnimalImageData.cat)
    static let parrot = Animal(name: "앵무새", cryingSound: "짹 짹", profileImageData: AnimalImageData.parrot)
    static let lizard = Animal(name: "도마뱀", cryingSound: nil, profileImageData: AnimalImageData.lizard)
    
    static let defaultCases = [Animal.dog, Animal.cat, Animal.parrot, Animal.lizard]
}
