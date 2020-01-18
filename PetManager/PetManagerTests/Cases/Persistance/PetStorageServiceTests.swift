//
//  PetStoageServiceTests.swift
//  PetManagerTests
//
//  Created by 이동영 on 2020/01/18.
//  Copyright © 2020 이동영. All rights reserved.
//
@testable import PetManager
import XCTest

class PetStorageServiceTests: XCTestCase {
    
    var sut: PetStoragServiceImplementation!
    
    override func setUp() {
        super.setUp()
        
        let bundle = Bundle(for: PetStorageServiceTests.self)
        let fileName = "pets"
        let fakeFileURL =  bundle.url(forResource: fileName, withExtension: "json")!
        
        sut = PetStoragServiceImplementation(fileURL: fakeFileURL)
    }
    
    override func tearDown() {
        sut = nil
        
        super.setUp()
    }
    
    func test_load_pets() {
        
        // given
        let successExpectation = expectation(description: "load success")
        let expectedPetCounts = 4
        
        // when
        sut.load { result in
            switch result {
            case .success(let pets):
                successExpectation.fulfill()
                // then
                XCTAssertEqual(pets.count, expectedPetCounts)
            case .failure(_):
                ()
            }
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func test_save_pets() {
        // given
        let saveSuccessExpectation = expectation(description: "save success")
        let loadSuccessExpectation = expectation(description: "load success")
        
        // when
        sut.save([Pet(name: "나서스", type: .dog)]) { result in
            switch result {
            case .success(_):
                saveSuccessExpectation.fulfill()
                self.sut.load { result in
                    switch result {
                    case .success(let pets):
                        loadSuccessExpectation.fulfill()
                        // then
                        XCTAssertEqual(pets.count, 1)
                    case .failure(_):
                        ()
                    }
                }
            case .failure(_):
                ()
            }
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
}
