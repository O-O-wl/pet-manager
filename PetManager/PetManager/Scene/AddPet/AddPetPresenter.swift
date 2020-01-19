//
//  AddPetPresenter.swift
//  PetManager
//
//  Created by 이동영 on 2020/01/19.
//  Copyright © 2020 이동영. All rights reserved.
//

import UIKit

struct AddRequest {
    let name: String
    let typeName: String
}

protocol AddPetView: AnyObject {
}

protocol AnimalTypeView {
    func display(typeName: String)
    func display(profileImage: UIImage)
}

protocol AddPetPresenter {
    var numberOfAnimalTypes: Int { get }
    func configure(view: AddPetView)
    func didSelectType(at index: Int)
    func addButtonDidTap(with parameter: AddRequest)
}

class AddPetPresenterImplementation: AddPetPresenter {
    var numberOfAnimalTypes: Int { return 0 }
    
    func configure(view: AddPetView) {
        
    }
    
    func didSelectType(at index: Int) {
        
    }
    
    private unowned let view: AddPetView
    private let animalTypeProvider: AnimalTypeProvider
    private let imageRepository: ImageRepository
    private let petRepository: PetRepository
    
    init(view: AddPetView,
         animalTypeProvider: AnimalTypeProvider,
         imageRepository: ImageRepository,
         petRepository: PetRepository) {
        self.view = view
        self.animalTypeProvider = animalTypeProvider
        self.imageRepository = imageRepository
        self.petRepository = petRepository
    }
    
    func addButtonDidTap(with parameter: AddRequest) {
        
    }
    
}
