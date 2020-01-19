//
//  VaildationError.swift
//  PetManager
//
//  Created by 이동영 on 2020/01/19.
//  Copyright © 2020 이동영. All rights reserved.
//

import Foundation

enum VaildationError: LocalizedError {
    case unfiledName
    case invaildType
    
    var errorDescription: String? {
        switch self {
        case .unfiledName:
            return "펫 이름 미기입"
        case .invaildType:
            return "펫 타입 미선택"
        }
    }
}
