//
//  PetListPresenterTests.swift
//  PetManagerTests
//
//  Created by 이동영 on 2020/01/19.
//  Copyright © 2020 이동영. All rights reserved.
//
@testable import PetManager
import XCTest

class PetListPresenterTests: XCTestCase {
    
    var pets: [Pet]!
    var petImages: [String: UIImage]!
    
    var mockPetRepository: MockPetRepository!
    var mockImageRepository: MockImageRepository!
    
    var mockPetView: MockPetView!
    var mockPetListView: MockPetListView!
    
    var sut: PetListPresenterImplementation!
    
    override func setUp() {
        super.setUp()
        
        pets = Pet.getSample()
        
        petImages = pets.map {
            ($0.type.profileImageAssetName, UIImage(named:  $0.type.profileImageAssetName)!)
        }.reduce(into: [String: UIImage]()) { $0[$1.0] = $1.1 }
        
        mockPetView = MockPetView()
        mockPetListView = MockPetListView()
        mockPetRepository = MockPetRepository(pets: pets)
        mockImageRepository = MockImageRepository(petImages)
        sut = PetListPresenterImplementation(view: mockPetListView,
                                             petRepository: mockPetRepository,
                                             imageRepository: mockImageRepository)
        mockPetListView.presenter = sut
    }
    
    override func tearDown() {
        pets = nil
        petImages = nil
        mockPetRepository = nil
        mockImageRepository = nil
        mockPetView = nil
        mockPetListView = nil
        sut = nil
        
        super.tearDown()
    }
    
    func test_numberOfPets() {
        
    }
}