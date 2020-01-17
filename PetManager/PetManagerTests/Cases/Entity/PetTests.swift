//
//  PetTests.swift
//  PetManagerTests
//
//  Created by 이동영 on 2020/01/17.
//  Copyright © 2020 이동영. All rights reserved.
//
@testable import PetManager
import XCTest

class PetTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_pet_initialzation() {
        // given
        let name = "나르"
        let type = Animal.dog
        
        // when
        let pet = Pet(name: name, type: type)
        
        // then
        XCTAssertEqual(pet.name, name)
        XCTAssertEqual(pet.type, type)
    }
}
