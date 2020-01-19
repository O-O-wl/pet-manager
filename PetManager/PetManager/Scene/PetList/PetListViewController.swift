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
        view.addSubview(petListTableView)
        
        petListTableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    // MARK: - Attributes
    
    override func setUpAttribute() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(addButtonDidTap))
    }
    
    // MARK: - UI
    
    func refresh() {
        ()
    }
    
    func showAlert(name: String, cryingSound: String) {
        ()
    }
    
    @objc func addButtonDidTap() {
        
    }

}
