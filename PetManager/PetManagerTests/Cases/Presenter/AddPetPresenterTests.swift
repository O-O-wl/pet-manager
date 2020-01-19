//
//  AddPetPresenterTests.swift
//  PetManagerTests
//
//  Created by 이동영 on 2020/01/19.
//  Copyright © 2020 이동영. All rights reserved.
//

import XCTest

class AddPetPresenterTests: XCTestCase {

    var mockPetRepository: MockPetRepository!
    var sut: AddPetPresenter!
    
    override func setUp() {
        super.setUp()
        
        mockPetRepository = MockPetRepository(pets: [])
        sut = AddPetPresenterImplementation(prtRepository: mockPetRepository)
    }

    override func tearDown() {
        mockPetRepository = nil
        sut = nil
        
        super.tearDown()
    }ㅎ

}
