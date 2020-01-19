//
//  MockAnimalView.swift
//  PetManagerTests
//
//  Created by 이동영 on 2020/01/19.
//  Copyright © 2020 이동영. All rights reserved.
//
@testable import PetManager
import UIKit

class MockAnimalView: AnimalView {
    var displayedTypeName = ""
    var displayedImage = UIImage()
    
    func display(typeName: String) {
        displayedTypeName = typeName
    }
    
    func display(profileImage: UIImage) {
        displayedImage = profileImage
    }
}
