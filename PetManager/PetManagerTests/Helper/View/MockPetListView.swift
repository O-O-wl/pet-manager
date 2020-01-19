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
    var presenter: PetListPresenter
    
    var alertIsShown = false
    
    init(presenter: PetListPresenter) {
        self.presenter = presenter
    }
    
    func refresh() {
        ()
    }
    
    func showAlert(name: String, cryingSound: String) {
        alertIsShown = true
    }
    
}
