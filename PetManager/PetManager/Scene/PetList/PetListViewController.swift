//
//  PetListViewController.swift
//  PetManager
//
//  Created by 이동영 on 2020/01/19.
//  Copyright © 2020 이동영. All rights reserved.
//

import UIKit

protocol PetView: AnyObject {
    func display(name: String)
    func display(typeName: String)
    func display(profileImage: UIImage)
}

protocol PetListView: AnyObject {
    var presenter: PetListPresenter? { get set }
    func refresh()
    func showAlert(name: String, cryingSound: String)
}

class PetListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
}
