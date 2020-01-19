//
//  AddPetPresenterTests.swift
//  PetManagerTests
//
//  Created by 이동영 on 2020/01/19.
//  Copyright © 2020 이동영. All rights reserved.
//
@testable import PetManager
import XCTest

class AddPetPresenterTests: XCTestCase {
    
    
    var sampleTypeName1: String!
    var sampleTypeName2: String!
    
    var sampleCryingSound1: String?
    var sampleCryingSound2: String?
    
    var sampleProfileImageAssetName1: String!
    var sampleProfileImageAssetName2: String!
    
    var sampleAnimalImage1: UIImage!
    var sampleAnimalImage2: UIImage!
    
    var sampleAnimalType1: Animal!
    var sampleAnimalType2: Animal!
    
    var mockAddPetView: MockAddPetView!
    var mockAnimalProvider: MockAnimalTypeProvider!
    var mockImageRepository: MockImageRepository!
    var mockPetRepository: MockPetRepository!
    
    var sut: AddPetPresenter!
    
    override func setUp() {
        super.setUp()
        sampleTypeName1 = "달팽이"
        sampleTypeName2 = "부엉이"
        
        sampleCryingSound1 = nil
        sampleCryingSound2 = "부엉 부엉"
        
        sampleProfileImageAssetName1 = "snail"
        sampleProfileImageAssetName2 = "owl"
        
        sampleAnimalImage1 = UIImage()
        sampleAnimalImage2 = UIImage()
        
        sampleAnimalType1 = Animal(name: sampleTypeName1,
                                   cryingSound: sampleCryingSound1,
                                   profileImageAssetName: sampleProfileImageAssetName1)
        sampleAnimalType2 = Animal(name: sampleTypeName2,
                                   cryingSound: sampleCryingSound2,
                                   profileImageAssetName: sampleProfileImageAssetName2)
        
        mockAddPetView = MockAddPetView()
        mockAnimalProvider = MockAnimalTypeProvider(types: [sampleAnimalType1, sampleAnimalType2])
        let images = [sampleProfileImageAssetName1!: sampleAnimalImage1!,
                      sampleProfileImageAssetName2!: sampleAnimalImage2!]
        mockImageRepository = MockImageRepository(images)
        mockPetRepository = MockPetRepository(pets: [])
        
        sut = AddPetPresenterImplementation(view: mockAddPetView,
                                            animalTypeProvider: mockAnimalProvider,
                                            imageRepository: mockImageRepository,
                                            petRepository: mockPetRepository)
    }
    
    override func tearDown() {
        sampleTypeName1 = nil
        sampleTypeName2 = nil
        sampleCryingSound1  = nil
        sampleCryingSound2 = nil
        sampleProfileImageAssetName1 = nil
        sampleProfileImageAssetName2 = nil
        sampleAnimalImage1 = nil
        sampleAnimalImage2 = nil
        sampleAnimalType1 = nil
        sampleAnimalType2 = nil
        mockAddPetView = nil
        mockAnimalProvider = nil
        mockImageRepository = nil
        mockPetRepository = nil
        sut = nil
        
        super.tearDown()
    }
    
    func test_request_add_pet() throws {
        // given
        let expectedAddionalPetName = "새로 추가된 고양이"
        let expectedAddionalPetTyleName = "고양이"
        let expectedAddionalPetType = Animal.cat
        
        let addRequest = AddRequest(name: expectedAddionalPetName,
                                    typeName: expectedAddionalPetTyleName)
        
        // when
        sut.addButtonDidTap(with: addRequest)
        
        // then
        let addionalPet = try XCTUnwrap(mockPetRepository.pets.last)
        XCTAssertEqual(addionalPet.name, expectedAddionalPetName)
        XCTAssertEqual(addionalPet.type, expectedAddionalPetType)
        XCTAssertEqual(addionalPet.type.name, expectedAddionalPetTyleName)
    }
    
    
}
