//
//  MapUsageMode.swift
//  PSWPointMap
//
//  Created by Дмитрий Молодецкий on 24.03.2023.
//

import Foundation

enum MapUsageMode {
    case setLogo
    case focusing
    
    mutating func toggle() {
        switch self {
        case .setLogo: self = .focusing
        case .focusing: self = .setLogo
        }
    }
}
