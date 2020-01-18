//
//  AssetImageServiceTests.swift
//  PetManagerTests
//
//  Created by 이동영 on 2020/01/18.
//  Copyright © 2020 이동영. All rights reserved.
//
@testable import PetManager
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
    
    func test_fetch_image_success() {
        // given
        let assetName = "dog"
        
        // when
        let image = sut.fetchImage(assetName: assetName)
        
        // then
        XCTAssertEqual(image, UIImage(contentsOfFile: assetName))
    }
    
    func test_fetch_image_failure_when_assetName_is_wrong() {
        // given
        let assetName = "d"
        
        // when
        let image = sut.fetchImage(assetName: assetName)
        
        // then
        XCTAssertNil(image)
    }
}
