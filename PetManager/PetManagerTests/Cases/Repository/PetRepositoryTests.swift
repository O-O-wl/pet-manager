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
    
    func test_fetch_pet_success() {
        // given
        let expectedPet = pets.first!
        let fetchSuccessExpectation = expectation(description: "fetch success")
        let indexPath = IndexPath(row: 0, section: 0)
        
        // when
        sut.fetch(at: indexPath) { result in
            switch result {
            case .success(let pet):
                fetchSuccessExpectation.fulfill()
                
                // then
                XCTAssertEqual(pet, expectedPet)
            case .failure(_):
                ()
            }
        }
        
        waitForExpectations(timeout: 2, handler: nil)
    }
    
    func test_fetch_pet_failure_when_out_of_index() {
        // given
        let fetchFailureExpectation = expectation(description: "fetch failure")
        let outOfIndexPath = IndexPath(row: pets.count, section: 0)
        
        // when
        sut.fetch(at: outOfIndexPath) { result in
            switch result {
            case .success(_):
                ()
            case .failure(_):
                fetchFailureExpectation.fulfill()
            }
        }
        
        waitForExpectations(timeout: 2, handler: nil)
    }
    
    func test_add_pet_test() {
        
    }
}
