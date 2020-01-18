//
//  AssetImageServiceTests.swift
//  PetManagerTests
//
//  Created by 이동영 on 2020/01/18.
//  Copyright © 2020 이동영. All rights reserved.
//

import XCTest

class AssetImageServiceTests: XCTestCase {
    
    var sut: AssetImageService!
    
    override func setUp() {
        super.setUp()
        
        sut = AssetImageServiceImplementation()
    }
    
    override func tearDown() {
        sut = nil
        
        super.tearDown()
    }
}
