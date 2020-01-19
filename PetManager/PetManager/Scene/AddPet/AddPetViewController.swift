//
//  AddPetViewController.swift
//  PetManager
//
//  Created by 이동영 on 2020/01/19.
//  Copyright © 2020 이동영. All rights reserved.
//

import UIKit

class AddPetViewController: BaseViewController, AddPetView {
    
    // MARK: - Dependencies
    
    var presenter: AddPetPresenter?
    
    // MARK: - UI
    // FIXME:
    private let titleLabel = UILabel()
    private let petNameTextField = UITextField()
    private let animalListLabel = UILabel()
    private let selectedAnimalLabel = UILabel()
    private let animalListCollectionView = UICollectionView(frame: .zero,
                                                            collectionViewLayout: UICollectionViewFlowLayout())
    private let addButton = UIButton()
    
    // MARK: - Layouts
    
    override func setUpLayout() {
        view.do {
            $0.addSubview(titleLabel)
            $0.addSubview(petNameTextField)
            $0.addSubview(animalListLabel)
            $0.addSubview(selectedAnimalLabel)
            $0.addSubview(animalListCollectionView)
            $0.addSubview(addButton)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.centerX.equalToSuperview()
        }
        
        petNameTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.centerX.equalToSuperview()
        }
        
        animalListLabel.snp.makeConstraints {
            $0.top.equalTo(petNameTextField.snp.bottom)
            $0.centerX.equalToSuperview()
        }
        
        selectedAnimalLabel.snp.makeConstraints {
            $0.top.equalTo(animalListLabel.snp.bottom)
            $0.centerX.equalToSuperview()
        }
        
        animalListCollectionView.snp.makeConstraints {
            $0.top.equalTo(selectedAnimalLabel.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
        
        addButton.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
    }
    
    // MARK: - Attributes
    
    override func setUpAttribute() {
        titleLabel.do {
            $0.text = "펫 등록"
            $0.font = .systemFont(ofSize: 20)
        }
        
        petNameTextField.do {
            $0.placeholder = "펫의 이름을 입력해주세요."
        }
        
        animalListLabel.do {
            $0.text = "펫의 타입을 선택해주세요."
        }
        
        selectedAnimalLabel.do {
            $0.textColor = .orange
            $0.font = .systemFont(ofSize: 15)
            $0.text = "---"
        }
        
        animalListCollectionView.do {
            $0.backgroundColor = .white
        }
        
        addButton.do {
            $0.backgroundColor = .blue
            $0.setTitle("등록", for: .normal)
            $0.layer.cornerRadius = 10
        }
    }
    
    // MARK: - Action
    
    func display(selectedTypeName: String) {
        ()
    }
}
