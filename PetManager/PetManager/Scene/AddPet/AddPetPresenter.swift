//
//  AddPetPresenter.swift
//  PetManager
//
//  Created by 이동영 on 2020/01/19.
//  Copyright © 2020 이동영. All rights reserved.
//

import UIKit

struct AddRequest {
    let name: String?
    let typeName: String?
}

protocol AddPetView: UIViewController {
    var presenter: AddPetPresenter? { get set }
    func display(selectedTypeName: String)
    func showAlert(message: String)
    func dismiss()
}

protocol AnimalView: AnyObject{
    func display(typeName: String)
    func display(profileImage: UIImage)
}

protocol AddPetPresenter: AnyObject {
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
    
    // MARK: - Methods
    
    func configure(view: AnimalView, at index: Int) {
        guard index < types.count else { return }
        
        let animal = types[index]
        view.display(typeName: animal.name)
        imageRepository.fetch(for: animal.profileImageAssetName) { result in
            switch result {
            case .success(let image):
                view.display(profileImage: image)
            case .failure(let error):
                self.view.showAlert(message: error.localizedDescription)
            }
        }
    }
    
    func didSelectType(at index: Int) {
        guard index < types.count else { return }
        
        let animal = types[index]
        view.display(selectedTypeName: animal.name)
    }
    
    func addButtonDidTap(with parameter: AddRequest) {
        do {
            let pet = try vaild(request: parameter)
            requestAddtion(pet: pet)
        } catch {
            view.showAlert(message: error.localizedDescription)
        }
    }
    
    private func vaild(request: AddRequest) throws -> Pet {
        guard let petName = request.name,
            petName.isEmpty == false else {
                throw VaildationError.unfiledName
        }
        
        guard let typeName = request.typeName,
            let type = animalTypeProvider.provide(for: typeName) else {
                throw  VaildationError.invaildType
        }
        
        return Pet(name: petName, type: type)
    }
    
   private func requestAddtion(pet: Pet) {
        petRepository.add(pet: pet) { result in
            switch result {
            case .success(_):
                self.view.dismiss()
            case .failure(let error):
                self.view.showAlert(message: error.localizedDescription)
            }
        }
    }
}
