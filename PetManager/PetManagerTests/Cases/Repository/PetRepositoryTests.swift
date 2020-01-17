//
//  RepositoryTests.swift
//  PetManagerTests
//
//  Created by 이동영 on 2020/01/18.
//  Copyright © 2020 이동영. All rights reserved.
//
@testable import PetManager
import XCTest

class PetRepositoryTests: XCTestCase {
    
    // given
    var pets: [Pet]!
    var storageService: PetStorageService!
    
    var sut: PetRepository!
    
    override func setUp() {
        super.setUp()
        
        pets = [Pet(name: "테스트용 고양이", type: .cat),
                Pet(name: "테스트용 강아지", type: .dog)]
        storageService = MockPetStorageService(pets: pets)
        
        sut = PetRepositoryImplementation(storageService: storageService)
    }
    
    override func tearDown() {
        pets = nil
        storageService = nil
        sut = nil
        
        super.tearDown()
    }
}
