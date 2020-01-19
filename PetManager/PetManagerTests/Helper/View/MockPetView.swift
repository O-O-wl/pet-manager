//
//  PetViewStub.swift
//  PetManagerTests
//
//  Created by 이동영 on 2020/01/19.
//  Copyright © 2020 이동영. All rights reserved.
//
@testable import PetManager
import UIKit

class MockPetView: PetView {
    var displayedName : String = ""
    var displayedTypeName : String = ""
    var displayedProfileImage: UIImage = UIImage()
    
    func display(name: String) {
        displayedName = name
    }
    
    func display(typeName: String) {
        displayedTypeName = typeName
    }
    
    func display(profileImage: UIImage) {
        displayedProfileImage = profileImage
    }
}
