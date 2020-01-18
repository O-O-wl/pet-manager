//
//  RepositoryError.swift
//  PetManager
//
//  Created by 이동영 on 2020/01/18.
//  Copyright © 2020 이동영. All rights reserved.
//

import Foundation

enum RepositoryError: LocalizedError {
    case outOfRange
    
    var errorDescription: String? {
        switch self {
        case .outOfRange:
            return "범위를 벗어난 접근입니다."
        }
    }
}
