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
    var storageService: MockPetStorageService!
    
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
        sut.add(pet: expectedPet) { result in
            switch result {
            case .success(_):
                addSuccessExpectation.fulfill()
                
                XCTAssertEqual(self.storageService.pets[0], expectedPet)
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
    
    func test_modify_pet_success() {
        // givenX
        let index = 0
        let newPet = Pet(name: "업데이트된 고양이", type: .cat)
        let updateSuccessExpectation = expectation(description: "update success")
        
        // when
        sut.modify(itemAt: index, to: newPet) { result in
            switch result {
            case .success(_):
                updateSuccessExpectation.fulfill()
                
                // then
                XCTAssertEqual(self.storageService.pets[index], newPet)
            case .failure(_):
                ()
            }
        }
        waitForExpectations(timeout: 0, handler: nil)
    }
    
    func test_modify_pet_failure_when_index_out_of_range() {
        // given
        let index = 3
        let newPet = Pet(name: "업데이트된 고양이", type: .cat)
        let updateFailureExpectation = expectation(description: "update failure")
        let expectedError = RepositoryError.outOfRange
        
        // when
        sut.modify(itemAt: index, to: newPet) { result in
            switch result {
            case .success(_):
                ()
            case .failure(let error):
                updateFailureExpectation.fulfill()
                
                // then
                let error = try? XCTUnwrap(error as? RepositoryError)
                XCTAssertEqual(error, expectedError)
            }
        }
        waitForExpectations(timeout: 2, handler: nil)
    }
    
    func test_delete_pet_success() {
        // givenX
        let index = 0
        let deleteSuccessExpectation = expectation(description: "delete success")
        let expectedPetsCount = 1
        // when
        sut.delete(itemAt: index) { result in
            switch result {
            case .success(_):
                updateSuccessExpectation.fulfill()
                
                // then
                XCTAssertEqual(self.storageService.pet.count, expectedPetsCount)
            case .failure(_):
                ()
            }
        }
        waitForExpectations(timeout: 2, handler: nil)
    }
    
    func test_delete_pet_failure_when_index_out_of_range() {
        // given
        let index = 3
        let deleteFailureExpectation = expectation(description: "delete failure")
        let expectedError = RepositoryError.outOfRange
        
        // when
        sut.delete(itemAt: index, to: newPet) { result in
            switch result {
            case .success(_):
                ()
            case .failure(let error):
                deleteFailureExpectation.fulfill()
                
                // then
                let error = try? XCTUnwrap(error as? RepositoryError)
                XCTAssertEqual(error, expectedError)
            }
        }
        waitForExpectations(timeout: 2, handler: nil)
    }
}
