//
//  RepositoryTests.swift
//  PetManagerTests
//
//  Created by 이동영 on 2020/01/18.
//  Copyright © 2020 이동영. All rights reserved.
//
@testable import PetManager
import XCTest

class RepositoryTests: XCTestCase {

    // given
    var stoageService: PetStoageService!
    
    var sut: PetRepository!
    
    override func setUp() {
        super.setUp()
        
        stoageService = PetStoageServiceImplmentation.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
}
