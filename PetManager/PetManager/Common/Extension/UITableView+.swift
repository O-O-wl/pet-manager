//
//  UITableView+.swift
//  PetManager
//
//  Created by 이동영 on 2020/01/19.
//  Copyright © 2020 이동영. All rights reserved.
//

import UIKit

extension UITableView {
    typealias ReusableCell = UITableViewCell & Reusable
    
    func register<Cell: ReusableCell>(cellType: Cell.Type) {
        register(cellType.self, forCellReuseIdentifier: cellType.reuseIdentifier)
    }
    
    func dequeueReusableCell<Cell: ReusableCell>(with type: Cell.Type, for indexPath: IndexPath) -> Cell? {
        return self.dequeueReusableCell(withIdentifier: type.reuseIdentifier, for: indexPath) as? Cell
    }
}
