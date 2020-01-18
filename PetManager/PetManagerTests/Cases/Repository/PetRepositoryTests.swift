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
    
    // MARK: - Given Properties
    
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
    
    // MARK: - Tests
    
    func test_add_pet() {
        // given
        let expectedPet = Pet(name: "테스트용 도마뱀", type: .lizard)
        let addSuccessExpectation = expectation(description: "add success")
        
        //when
        sut.add(expectedPet) { result in
            switch result {
            case .success(_):
                addSuccessExpectation.fulfill()
            case .failure(_):
                ()
            }
        }
        
        waitForExpectations(timeout: 2, handler: nil)
    }
    
    func test_fetch_pet_success() {
        // given
        let expectedPet = pets.first!
        let expectedPet2 = pets.last!
        let fetchSuccessExpectation = expectation(description: "fetch success")
        
        // when
        sut.fetch{ result in
            switch result {
            case .success(let pets):
                fetchSuccessExpectation.fulfill()
                
                // then
                XCTAssertEqual(pets[0], expectedPet)
                XCTAssertEqual(pets[1], expectedPet2)
            case .failure(_):
                ()
            }
        }
        
        waitForExpectations(timeout: 2, handler: nil)
    }
    
}
