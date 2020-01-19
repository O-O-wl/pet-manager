//
//  PetListPresenter.swift
//  PetManager
//
//  Created by 이동영 on 2020/01/19.
//  Copyright © 2020 이동영. All rights reserved.
//

import UIKit

protocol PetListPresenter {
    var numberOfPets: Int { get }
    func configure(w: PetView, at index: Int)
}
