//
//  ImageCacheServiceTests.swift
//  PetManagerTests
//
//  Created by 이동영 on 2020/01/19.
//  Copyright © 2020 이동영. All rights reserved.
//
@testable import PetManager
import XCTest
import UIKit

class ImageCacheServiceTests: XCTestCase {
    
    var sampleImageKey1: String!
    var sampleImageKey2: String!
    
    var sampleImage1: UIImage!
    var sampleImage2: UIImage!
    
    var sut: ImageCacheService!
    
    override func setUp() {
        super.setUp()
        
        sampleImageKey1 = "dog"
        sampleImageKey2 = "cat"
        sampleImage1 = UIImage(named: "dog")
        sampleImage2 = UIImage(named: "cat")
        sut = ImageCacheServiceImplementation()
    }

    override func tearDown() {
        sampleImageKey1 = nil
        sampleImageKey2 = nil
        sampleImage1 = nil
        sampleImage2 = nil
        sut = nil
        
        super.tearDown()
    }
    
    func test_cache_save_success() {
        //given
        let expectedResult: Result<Void, Error> = .success(())
        
        //when
        let addResult = sut.add(sampleImage1, forKey: sampleImageKey1)
        
        //then
        XCTAssertEqual(addResult, expectedResult)
    }
}
