//
//  UICollectionView+.swift
//  PetManager
//
//  Created by 이동영 on 2020/01/19.
//  Copyright © 2020 이동영. All rights reserved.
//

import UIKit

extension UICollectionView {
    typealias ReusableCell = UICollectionViewCell & Reusable
    
    func register<Cell: ReusableCell>(cellType: Cell.Type) {
        register(cellType.self, forCellWithReuseIdentifier: cellType.reuseIdentifier)
    }
    
    func dequeueReusableCell<Cell: ReusableCell>(with type: Cell.Type, for indexPath: IndexPath) -> Cell? {
        return self.dequeueReusableCell(withReuseIdentifier: type.reuseIdentifier, for: indexPath) as? Cell
    }
}
