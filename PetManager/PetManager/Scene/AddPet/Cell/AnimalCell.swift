//
//  AnimalCell.swift
//  PetManager
//
//  Created by 이동영 on 2020/01/19.
//  Copyright © 2020 이동영. All rights reserved.
//

import UIKit

class AnimalCell: UICollectionViewCell {
    
    // MARK: - UI
    
    private let animalNameLabel = UILabel()
    private let animalImageView = UIImageView()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpLayout()
        setUpAttribute()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setUpLayout()
        setUpAttribute()
    }
    
    // MARK: - Layouts
    
    func setUpLayout() {
        self.do {
            $0.addSubview(animalNameLabel)
            $0.addSubview(animalImageView)
        }
        
        animalNameLabel.snp.makeConstraints {
            $0.top.equalTo(animalImageView.snp.bottom).offset(5)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        animalImageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.width.equalTo(animalImageView.snp.height)
        }
    }
    
    // MARK: - Attributes
    
    func setUpAttribute() {
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
        
        animalImageView.do {
            $0.contentMode = .scaleAspectFit
            $0.clipsToBounds = true
        }
        
        animalNameLabel.do {
            $0.textAlignment = .center
        }
    }
}

// MARK: - AnimalView

extension AnimalCell: AnimalView {
    func display(typeName: String) {
        animalNameLabel.text = typeName
    }
    
    func display(profileImage: UIImage) {
        animalImageView.image = profileImage
    }
}

// MARK: - Reusable

extension AnimalCell: Reusable {}
