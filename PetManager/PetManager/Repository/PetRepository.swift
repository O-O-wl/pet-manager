//
//  PetRepository.swift
//  PetManager
//
//  Created by 이동영 on 2020/01/18.
//  Copyright © 2020 이동영. All rights reserved.
//

import Foundation

protocol PetRepository {
    
}

class PetRepositoryImplementation: PetRepository {
    private let stoageService: PetStoageService
    
    init(stoageService: PetStoageService) {
        self.stoageService = stoageService
    }
}
