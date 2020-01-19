//
//  AnimalProvideService.swift
//  PetManager
//
//  Created by 이동영 on 2020/01/19.
//  Copyright © 2020 이동영. All rights reserved.
//

import Foundation

protocol AnimalTypeProvider {
    func provideAllTypes() -> [Animal]
    func provide(for typeName: String) -> Animal?
}
