//
//  Pet+.swift
//  PetManagerTests
//
//  Created by 이동영 on 2020/01/19.
//  Copyright © 2020 이동영. All rights reserved.
//
@testable import PetManager
import Foundation

extension Pet: Equatable {
    public static func == (lhs: Pet, rhs: Pet) -> Bool {
        let r1 = lhs.name == rhs.name
        let r2 = lhs.type == rhs.type
        return r1 && r2
    }
}

extension Pet {
    static func getSample() -> [Pet] {
        return [Pet(name: "Dog Sample", type: .dog),
                Pet(name: "Cat Sample", type: .cat),
                Pet(name: "Parrot Sample", type: .parrot),
                Pet(name: "Lizard Sample", type: .lizard)]
    }
}
