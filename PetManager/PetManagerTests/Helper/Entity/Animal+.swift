//
//  Animal+.swift
//  PetManagerTests
//
//  Created by 이동영 on 2020/01/17.
//  Copyright © 2020 이동영. All rights reserved.
//
@testable import PetManager
import Foundation

extension Animal: Equatable {
    public static func == (lhs: Animal, rhs: Animal) -> Bool {
        let r1 = lhs.name == rhs.name
        let r2 = lhs.cryingSound == rhs.cryingSound
        let r3 = rhs.profileImageAssetName == rhs.profileImageAssetName
        return r1 && r2 && r3
    }
}
