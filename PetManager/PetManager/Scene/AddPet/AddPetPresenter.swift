//
//  AddPetPresenter.swift
//  PetManager
//
//  Created by 이동영 on 2020/01/19.
//  Copyright © 2020 이동영. All rights reserved.
//

import Foundation

struct AddRequest {
    let name: String
    let typeDescription: String
}

protocol AddPetView: AnyObject {
    func display(at type: String)
}

protocol AddPetPresenter {
    func requestAddition(with parameter: AddRequest)
}

class AddPetPresenterImplementation: AddPetPresenter {
    
    private unowned let view: AddPetView
    private let petRepository: PetRepository
    
    init(view: AddPetView, petRepository: PetRepository) {
        self.view = view
        self.petRepository = petRepository
    }
    
    func requestAddition(with parameter: AddRequest) {
        
    }
    
}
