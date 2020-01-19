//
//  PetListPresenter.swift
//  PetManager
//
//  Created by 이동영 on 2020/01/19.
//  Copyright © 2020 이동영. All rights reserved.
//

import UIKit

protocol PetListPresenter {
    var numberOfPets: Int { get }
    func configure(view: PetView, at index: Int)
}


class PetListPresenterImplementation{
    
    // MARK: - Dependencies
    
    private unowned let view: PetListView
    private let petRepository: PetRepository
    private let imageRepository: ImageRepository
    
    // MARK: - Properties
    
    private var pets: [Pet] = []
    
    // MARK: - Initialization
    
    init(view: PetListView, petRepository: PetRepository, imageRepository: ImageRepository) {
        self.view = view
        self.petRepository = petRepository
        self.imageRepository = imageRepository
        
        // FIXME: - 호출할 시점 고민
        fetchPets()
    }
    
    private func fetchPets() {
        petRepository.fetch { result in
            switch result {
            case .success(let pets):
                self.pets = pets
            // FIXME:
            case .failure(_): ()
                
            }
        }
    }
}

extension PetListPresenterImplementation: PetListPresenter {
    var numberOfPets: Int {
        return pets.count
    }
    
    func configure(view: PetView, at index: Int) {
        
    }
}
