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

protocol AnimalView {
    func display(typeName: String)
    func display(profileImage: UIImage)
}

protocol AddPetPresenter {
    var numberOfAnimalTypes: Int { get }
    func configure(view: AnimalView, at index: Int)
    func didSelectType(at index: Int)
    func addButtonDidTap(with parameter: AddRequest)
}

class AddPetPresenterImplementation: AddPetPresenter {
    
    // MARK: - Dependencies
    
    private unowned let view: AddPetView
    private let animalTypeProvider: AnimalTypeProvider
    private let imageRepository: ImageRepository
    private let petRepository: PetRepository
    
    // MARK: - Properties
    
    private var types: [Animal] = []
    
    var numberOfAnimalTypes: Int {
        return types.count
    }
    
    // MARK: - Initialization
    
    init(view: AddPetView,
         animalTypeProvider: AnimalTypeProvider,
         imageRepository: ImageRepository,
         petRepository: PetRepository) {
        self.view = view
        self.animalTypeProvider = animalTypeProvider
        self.imageRepository = imageRepository
        self.petRepository = petRepository
        
        types = animalTypeProvider.provideAllTypes()
    }
    
    // MARK: - Action
    
    func configure(view: AnimalView, at index: Int) {
        
    }
    
    func didSelectType(at index: Int) {
        
    }
    
    func addButtonDidTap(with parameter: AddRequest) {
        
    }
    
}
