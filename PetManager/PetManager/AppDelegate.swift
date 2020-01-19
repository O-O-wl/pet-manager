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
        guard let window = window else { return false }
        
        let navigationController = UINavigationController()
        window.rootViewController = navigationController
        
        let petListViewController = PetListViewController()
        let imageRepository = DependencyContainer.shared.imageRepository
        let petRepository = DependencyContainer.shared.petRepository
        
        let addPetPresenter = PetListPresenterImplementation(view: petListViewController,
                                                             petRepository: petRepository,
                                                             imageRepository: imageRepository)
        petListViewController.presenter = addPetPresenter
        
        navigationController.pushViewController(petListViewController, animated: true)
        
        window.makeKeyAndVisible()
        return true
    }
}
