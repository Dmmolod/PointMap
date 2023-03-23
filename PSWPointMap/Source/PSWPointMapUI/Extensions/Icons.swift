//
//  Icons.swift
//  PSWPointMap
//
//  Created by Дмитрий Молодецкий on 23.03.2023.
//

import UIKit

extension UIImage {
    
    static let pswLogo = UIImage(named: "pswLogo")
    
    static let greenCheckmark = UIImage(systemName: "checkmark")?.withTintColor(.systemGreen, renderingMode: .alwaysOriginal)
    
    static let location = UIImage(systemName: "location")?.withTintColor(.black, renderingMode: .alwaysOriginal)
    
    static let highlightedLocation = UIImage(systemName: "location.fill")?.withTintColor(.black, renderingMode: .alwaysOriginal)
    
    static let setPointModeIcon = UIImage(systemName: "dot.circle.and.hand.point.up.left.fill")?.withTintColor(.black, renderingMode: .alwaysOriginal)
    
    static let focusingModeIcon = UIImage(systemName: "point.filled.topleft.down.curvedto.point.bottomright.up")?.withTintColor(.black, renderingMode: .alwaysOriginal)

}
