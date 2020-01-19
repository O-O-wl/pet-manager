//
//  MockPetListView.swift
//  PetManagerTests
//
//  Created by 이동영 on 2020/01/19.
//  Copyright © 2020 이동영. All rights reserved.
//

@testable import PetManager
import UIKit

class MockPetListView: PetListView {
    var presenter: PetListPresenter?
    
    var shownName = ""
    var shownCryingSound = ""
    
    func refresh() {
        ()
    }
    
    func showAlert(name: String, cryingSound: String) {
        shownName = name
        shownCryingSound = cryingSound
    }
    
}
