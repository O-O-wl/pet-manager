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


class PetListPresenterImplementation: PetListPresenter {
    
    // MARK: - Dependencies
    private unowned let view: PetListView
    private let petRepository: PetRepository
    private let imageRepository: ImageRepository
    
    var numberOfPets: Int { return 0 }
    
    init(view: PetListView, petRepository: PetRepository, imageRepository: ImageRepository) {
        self.view = view
        self.petRepository = petRepository
        self.imageRepository = imageRepository
    }
    
    func configure(view: PetView, at index: Int) {
        
    }
}
