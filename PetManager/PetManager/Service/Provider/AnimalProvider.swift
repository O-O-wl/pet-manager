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

class AnimalTypeProviderImplementation: AnimalTypeProvider {
    
    private let defaultTypes: [Animal] = [.dog, .cat, .parrot, .lizard]
    
    func provideAllTypes() -> [Animal] {
        return defaultTypes
    }
    
    func provide(for typeName: String) -> Animal? {
        return defaultTypes.first { $0.name == typeName }
    }
}

