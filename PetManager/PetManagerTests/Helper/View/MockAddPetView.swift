//
//  MockAddPetView.swift
//  PetManagerTests
//
//  Created by 이동영 on 2020/01/19.
//  Copyright © 2020 이동영. All rights reserved.
//
@testable import PetManager
import Foundation

class MockAddPetView: AddPetView {
    var presenter: AddPetPresenter?
    
    var displayedTypeName = ""
    
    func display(selectedTypeName: String) {
        displayedTypeName = selectedTypeName
    }
}
