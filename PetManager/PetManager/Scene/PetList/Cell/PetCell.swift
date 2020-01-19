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
    
    private let profileImage = UIImageView()
    private let nameLabel  = UILabel()
    private let typeNameLabel = UILabel()
    
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
            $0.addSubview(profileImage)
            $0.addSubview(nameLabel)
            $0.addSubview(typeNameLabel)
        }
        
        profileImage.snp.makeConstraints {
            $0.top.leading.bottom.equalToSuperview().inset(5)
            $0.width.equalTo(profileImage.snp.height)
        }
        
        nameLabel.snp.makeConstraints {
            $0.leading.equalTo(profileImage.snp.trailing).offset(15)
            $0.top.equalTo(profileImage)
        }
        
        typeNameLabel.snp.makeConstraints {
            $0.leading.equalTo(profileImage.snp.trailing).offset(15)
            $0.top.equalTo(nameLabel.snp.bottom)
            $0.bottom.equalTo(profileImage)
        }
    }
    
    // MARK: - Attributes
    
    func setupAttribute() {
        profileImage.do {
            $0.contentMode = .scaleAspectFill
        }
        
        typeNameLabel.do {
            $0.textColor = .systemBackground
        }
    }
}
