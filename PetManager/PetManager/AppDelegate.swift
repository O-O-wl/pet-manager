//
//  AppDelegate.swift
//  PetManager
//
//  Created by 이동영 on 2020/01/17.
//  Copyright © 2020 이동영. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        
        let cacheService = ImageCacheServiceImplementation()
        let assetImageService = AssetImageServiceImplementation()
        
        let storageService = PetStoragServiceImplementation.shared
        
        let animalTypeProvider = AnimalTypeProviderImplementation()
        let petRepository = PetRepositoryImplementation(storageService: storageService)
        let imageRepository = ImageRepositoryImplementation(cacheService: cacheService,
                                                            assetImageService: assetImageService)

        let petListVC = PetListViewController()
        
        let presenter = PetListPresenterImplementation(view: petListVC,
                                                       petRepository: petRepository,
                                                       imageRepository: imageRepository)
        petListVC.presenter = presenter
        
        let addPetVC = AddPetViewController()
        let addPetPresenter = AddPetPresenterImplementation(view: addPetVC,
                                                            animalTypeProvider: animalTypeProvider,
                                                            imageRepository: imageRepository,
                                                            petRepository: petRepository)
        addPetVC.presenter = addPetPresenter
//        let navigationVC = UINavigationController(rootViewController: petListVC)
        window?.rootViewController = addPetVC// navigationVC
        
//        petListVC.present(addPetVC, animated: true, completion: nil)
        
        window?.makeKeyAndVisible()
        return true
    }
}

