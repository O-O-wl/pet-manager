//
//  BaseViewController.swift
//  PetManager
//
//  Created by 이동영 on 2020/01/19.
//  Copyright © 2020 이동영. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        initialize()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        initialize()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpLayout()
        setUpAttribute()
    }
    
    func initialize() {}
    
    func setUpLayout() {}
    
    func setUpAttribute() {
        view.backgroundColor = .white
    }
}
