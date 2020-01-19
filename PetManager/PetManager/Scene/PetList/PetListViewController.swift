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
    func showAlert(message: String)
    func present(addPetView: AddPetView)
}

enum PetListViewState {
    case isloading
    case didLoad
}

class PetListViewController: BaseViewController, PetListView {
    
    // MARK: - Dependencies
    
    var presenter: PetListPresenter?
    
    // MARK: - UI
    
    private let petListTableView = UITableView()
    
    // MARK: - Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter?.updatePetList()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Layouts
    
    override func setUpLayout() {
        super.setUpAttribute()
        
        view.addSubview(petListTableView)
        
        petListTableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    // MARK: - Attributes
    
    override func setUpAttribute() {
        super.setUpAttribute()
        
        navigationItem.do {
            $0.title = "🐶 나의 펫 목록 🐱"
            $0.rightBarButtonItem = UIBarButtonItem(title: "Add",
                                                    style: .plain,
                                                    target: self,
                                                    action: #selector(addButtonDidTap))
        }
        
        petListTableView.do {
            $0.register(cellType: PetCell.self)
            $0.dataSource = self
            $0.delegate = self
            $0.rowHeight = 100
        }
    }
    
    // MARK: - Action
    
    func refresh() {
        DispatchQueue.main.async {
            self.petListTableView.reloadData()
        }
    }
    
    func showAlert(name: String, cryingSound: String) {
        UIAlertController(title: name, message: cryingSound, preferredStyle: .alert).do {
            $0.addAction(.init(title: "확인", style: .default, handler: nil))
            present($0, animated: true, completion: nil)
        }
    }
    
    func showAlert(message: String) {
        UIAlertController(title: nil, message: message, preferredStyle: .alert).do {
            $0.addAction(.init(title: "확인", style: .default, handler: nil))
            present($0, animated: true, completion: nil)
        }
    }
    
    func present(addPetView: AddPetView) {
        
        navigationController?.pushViewController(addPetView, animated: true)
    }
    
    @objc func addButtonDidTap() {
        presenter?.addButtonDidTap()
    }
    
}

// MARK: - UITableViewDataSource

extension PetListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfPets ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(with: PetCell.self, for: indexPath) else {
            return PetCell()
        }
        
        presenter?.configure(view: cell, at: indexPath.row)
        return cell
    }
}

// MARK: - UITableViewDelegate

extension PetListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter?.didSelect(at: indexPath.row)
    }
}
