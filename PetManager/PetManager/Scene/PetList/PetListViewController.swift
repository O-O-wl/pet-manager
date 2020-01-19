//
//  PetListViewController.swift
//  PetManager
//
//  Created by 이동영 on 2020/01/19.
//  Copyright © 2020 이동영. All rights reserved.
//

import UIKit
import SnapKit
import Then

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

class PetListViewController: BaseViewController, PetListView {
    
    // MARK: - Dependencies
    
    var presenter: PetListPresenter?
    
    // MARK: - UI
    
    let petListTableView = UITableView()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - Layouts
    
    override func setUpLayout() {
        view.
    }
    
    // MARK: - Attributes
    
    override func setUpAttribute() {
        <#code#>
    }
    
    // MARK: - UI
    
    func refresh() {
        <#code#>
    }
    
    func showAlert(name: String, cryingSound: String) {
        <#code#>
    }
    

}
