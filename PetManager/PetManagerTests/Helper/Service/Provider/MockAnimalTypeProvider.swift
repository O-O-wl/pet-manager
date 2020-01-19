//
//  MockAnimalTypeProvider.swift
//  PetManagerTests
//
//  Created by 이동영 on 2020/01/19.
//  Copyright © 2020 이동영. All rights reserved.
//
@testable import PetManager
import Foundation

class MockAnimalTypeProvider: AnimalTypeProvider {
    
    var types: [Animal]
    
    init(types: [Animal]) {
        self.types = types
    }
    
    func provideAllTypes() -> [Animal] {
        return types
    }
    
    func provide(for typeName: String) -> Animal? {
        return types.first { $0.name == typeName }
    }
    
}
