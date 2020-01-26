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
    
    private let titleLabel = UILabel()
    private let petNameTextField = UITextField()
    private let guideMessageLabel = UILabel()
    private let selectedAnimalLabel = UILabel()
    private let animalListCollectionView = UICollectionView(frame: .zero,
                                                            collectionViewLayout: UICollectionViewFlowLayout())
    
    // MARK: - Layouts
    
    override func setUpLayout() {
        super.setUpAttribute()
        
        view.do {
            $0.addSubview(titleLabel)
            $0.addSubview(petNameTextField)
            $0.addSubview(guideMessageLabel)
            $0.addSubview(selectedAnimalLabel)
            $0.addSubview(animalListCollectionView)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(50)
            $0.centerX.equalToSuperview()
        }
        
        petNameTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
        
        guideMessageLabel.snp.makeConstraints {
            $0.top.equalTo(petNameTextField.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
        
        selectedAnimalLabel.snp.makeConstraints {
            $0.top.equalTo(guideMessageLabel.snp.bottom).offset(5)
            $0.centerX.equalToSuperview()
        }
        
        animalListCollectionView.snp.makeConstraints {
            $0.top.equalTo(selectedAnimalLabel.snp.bottom).offset(5)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalToSuperview().dividedBy(4)
        }
    }
    
    // MARK: - Attributes
    
    override func setUpAttribute() {
        super.setUpAttribute()
        
        titleLabel.do {
            $0.text = "펫 등록"
            $0.font = .boldSystemFont(ofSize: 20)
        }
        
        petNameTextField.do {
            $0.placeholder = "펫의 이름을 입력해주세요."
            $0.borderStyle = .roundedRect
        }
        
        guideMessageLabel.do {
            $0.text = "펫의 타입을 선택해주세요."
        }
        
        selectedAnimalLabel.do {
            $0.textColor = .systemBlue
            $0.font = .systemFont(ofSize: 15)
            $0.text = "---"
        }
        
        animalListCollectionView.do {
            $0.backgroundColor = .white
            $0.register(cellType: AnimalCell.self)
            $0.dataSource = self
            $0.delegate = self
        }
        
        navigationItem.do {
            $0.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done,
                                                    target: self,
                                                    action: #selector(addButtonDidTap))
        }
    }
    
    // MARK: - Action
    
    func display(selectedTypeName: String) {
        selectedAnimalLabel.text = selectedTypeName
    }
    
    func showAlert(message: String) {
        DispatchQueue.main.async {
            UIAlertController(title: nil, message: message, preferredStyle: .alert).do {
                $0.addAction(.init(title: "확인", style: .default, handler: nil))
                self.present($0, animated: true, completion: nil)
            }
        }
    }
    
    func dismiss() {
        DispatchQueue.main.async {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @objc func addButtonDidTap() {
        let request = AddRequest(name: petNameTextField.text, typeName: selectedAnimalLabel.text)
        presenter?.addButtonDidTap(with: request)
    }
    
}

// MARK: - UICollectionViewDataSource

extension AddPetViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.numberOfAnimalTypes ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(with: AnimalCell.self, for: indexPath) else {
            return AnimalCell()
        }
        
        presenter?.configure(view: cell, at: indexPath.row)
        return cell
    }
    
}

// MARK: - UICollectionViewDelegate

extension AddPetViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) else { return }
        
        cell.backgroundColor = .gray
        UIView.animate(withDuration: 0.3){
            cell.backgroundColor = .white
        }
        presenter?.didSelectType(at: indexPath.item)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension AddPetViewController: UICollectionViewDelegateFlowLayout {
    var padding: CGFloat {
        return 1.0
    }
    var itemsPerRow: CGFloat {
        return CGFloat(animalListCollectionView.numberOfItems(inSection: 0))
    }
    var sectionInsets: UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return padding
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem * 1.3)
    }
}
