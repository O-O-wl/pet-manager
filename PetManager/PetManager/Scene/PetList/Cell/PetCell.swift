//
//  PetCell.swift
//  PetManager
//
//  Created by 이동영 on 2020/01/19.
//  Copyright © 2020 이동영. All rights reserved.
//

import UIKit

class PetCell: UITableViewCell {
    
    // MARK: - UI
    
    private let nameLabel  = UILabel()
    private let typeNameLabel = UILabel()
    private let profileImageView = UIImageView()
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupLayout()
        setupAttribute()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupLayout()
        setupAttribute()
    }
    
    // MARK: - Layouts
    
    func setupLayout() {
        self.do {
            $0.addSubview(nameLabel)
            $0.addSubview(typeNameLabel)
            $0.addSubview(profileImageView)
        }
        
        nameLabel.snp.makeConstraints {
            $0.leading.equalTo(profileImageView.snp.trailing).offset(15)
            $0.top.equalTo(profileImageView)
        }
        
        typeNameLabel.snp.makeConstraints {
            $0.leading.equalTo(profileImageView.snp.trailing).offset(15)
            $0.top.equalTo(nameLabel.snp.bottom)
            $0.bottom.equalTo(profileImageView)
        }
        
        profileImageView.snp.makeConstraints {
            $0.top.leading.bottom.equalToSuperview().inset(5)
            $0.width.equalTo(profileImageView.snp.height)
        }
        
    }
    
    // MARK: - Attributes
    
    func setupAttribute() {
        profileImageView.do {
            $0.contentMode = .scaleAspectFill
        }
        
        typeNameLabel.do {
            $0.textColor = .systemBackground
        }
    }
}

// MARK: - PetView

extension PetCell: PetView {
    func display(name: String) {
        nameLabel.text = name
    }
    
    func display(typeName: String) {
        typeNameLabel.text = typeName
    }
    
    func display(profileImage: UIImage) {
        profileImageView.image = profileImage
    }
}

// MARK: - Reusable

extension PetCell: Reusable {}
