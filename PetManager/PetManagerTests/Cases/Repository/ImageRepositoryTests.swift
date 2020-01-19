//
//  ImageRepositoryTests.swift
//  PetManagerTests
//
//  Created by 이동영 on 2020/01/19.
//  Copyright © 2020 이동영. All rights reserved.
//
@testable import PetManager
import XCTest

class ImageRepositoryTests: XCTestCase {
    
    // given
    var key1ForCache: String!
    var key2ForCache: String!
    var key1ForAssetService: String!
    var key2ForAssetService: String!
    
    var fakeImageForCache: UIImage!
    var fakeImageForAssetService: UIImage!
    
    var mockAssetImageService: MockAssetImageService!
    var mockImageCacheService: MockImageCacheService!
    
    var sut: ImageRepositoryImplementation!
    
    override func setUp() {
        super.setUp()
        
        key1ForCache = "캐시키1"
        key2ForCache = "캐시키2"
        key1ForAssetService = "에셋키1"
        key2ForAssetService = "에셋키2"
        
        fakeImageForCache = UIImage()
        fakeImageForAssetService = UIImage()
        
        mockImageCacheService = MockImageCacheService(
            registerdAssetName: key1ForCache, key1ForCache,
            fakeImage: fakeImageForCache
        )
        mockAssetImageService = MockAssetImageService(
            registerdAssetName: key1ForAssetService, key2ForAssetService,
            fakeImage: fakeImageForAssetService
        )
        
        sut = ImageRepositoryImplementation(
            cacheService: mockImageCacheService,
            assetImageService: mockAssetImageService
        )
    }
    
    override func tearDown() {
        key1ForCache = nil
        key2ForCache = nil
        key1ForAssetService = nil
        key2ForAssetService = nil
        
        fakeImageForCache = nil
        fakeImageForAssetService = nil
        
        mockImageCacheService = nil
        mockAssetImageService = nil
        
        sut = nil
        
        super.tearDown()
    }
    
    func test_add_image_success() {
        // given
        let newKey = "새로운 키"
        let sampleImage = UIImage()
        let addSuccessExpectation = expectation(description: "add success expectation")
        
        // when
        sut.add(sampleImage, for: newKey) { result in
            switch result {
            case .success(_):
                addSuccessExpectation.fulfill()
                
            case .failure(_):
                ()
            }
        }
        waitForExpectations(timeout: 2, handler: nil)
    }
    
    func test_add_image_success_when_with_already_registered_key() {
        // given
        let oldKey = key2ForCache!
        let sampleImage = UIImage()
        let addSuccessExpectation = expectation(description: "add success expectation")
        
        // when
        sut.add(sampleImage, for: oldKey) { result in
            switch result {
            case .success(_):
                addSuccessExpectation.fulfill()
                
            case .failure(_):
                ()
            }
        }
        waitForExpectations(timeout: 2, handler: nil)
    }
    
    func test_fetch_Image_success_when_with_key_for_cache() {
        // given
        let expectedImage = fakeImageForCache
        let fetchSuccessExpectation = expectation(description: "fetch success expectation")
        
        // when
        sut.fetch(for: key1ForCache) { result in
            switch result {
            case .success(let image):
                fetchSuccessExpectation.fulfill()
                
                // then
                XCTAssertEqual(image, expectedImage)
            case .failure(_):
                ()
            }
        }
        waitForExpectations(timeout: 2, handler: nil)
    }
    
    func test_fetch_Image_success_when_with_key_for_assetName() {
        // given
        let expectedImage = fakeImageForAssetService
        let fetchSuccessExpectation = expectation(description: "fetch success expectation")
        
        // when
        sut.fetch(for: key2ForAssetService) { result in
            switch result {
            case .success(let image):
                fetchSuccessExpectation.fulfill()
                
                // then
                XCTAssertEqual(image, expectedImage)
            case .failure(_):
                ()
            }
        }
        waitForExpectations(timeout: 2, handler: nil)
    }
    
    func test_fetch_Image_failure() {
        // given
        let unRegisteredKey = "미등록 키"
        let expectedError = RepositoryError.notFound
        let fetchFailureExpectation = expectation(description: "fetch failure expectation")
        
        // when
        sut.fetch(for: unRegisteredKey) { result in
            switch result {
            case .success(_):
                ()
            case .failure(let error):
                fetchFailureExpectation.fulfill()
                
                // then
                XCTAssertEqual(error as? RepositoryError, expectedError)
            }
        }
        waitForExpectations(timeout: 2, handler: nil)
    }
}
