//
//  StoageService.swift
//  PetManager
//
//  Created by 이동영 on 2020/01/18.
//  Copyright © 2020 이동영. All rights reserved.
//

import Foundation

protocol PetStoageService {
    func load(completion: @escaping (Result<[Pet], Error>) -> Void)
    func save(_ pets: [Pet], completion: @escaping (Result<Void, Error>) -> Void)
}
