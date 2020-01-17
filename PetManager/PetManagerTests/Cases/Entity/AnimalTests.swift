//
//  AnimalTests.swift
//  PetManagerTests
//
//  Created by 이동영 on 2020/01/17.
//  Copyright © 2020 이동영. All rights reserved.
//
@testable import PetManager
import XCTest

class AnimalTests: XCTestCase {

//    var sut: Animal!
    
    override func setUp() {
        super.setUp()
        
    }

    override func tearDown() {
        
        super.tearDown()
    }

    func test_animal_initalization_withAllValues() {
        // given
        let name = "강아지"
        let cryingSound = "멍 - 멍 -"
        let imageData = Data()
        
        // when
        let animal = Animal(name: name,
                            cryingSound: cryingSound,
                            profileImageData: imageData)
        // then
        XCTAssertEqual(animal.name, name)
        XCTAssertEqual(animal.cryingSound, cryingSound)
        XCTAssertEqual(animal.profileImageData, imageData)
    }

    func test_animal_initalization_when_cryingSound_is_nil() {
        // given
        let name = "도마뱀"
        let cryingSound: String? = nil
        let imageData = Data()
        
        // when
        let animal = Animal(name: name,
                            cryingSound: cryingSound,
                            profileImageData: imageData)
        // then
        XCTAssertEqual(animal.name, name)
        XCTAssertNil(animal.cryingSound)
        XCTAssertEqual(animal.profileImageData, imageData)
    }
}
