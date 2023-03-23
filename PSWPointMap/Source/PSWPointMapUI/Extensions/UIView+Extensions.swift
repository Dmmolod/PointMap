//
//  UIView+Extensions.swift
//  PSWPointMap
//
//  Created by Дмитрий Молодецкий on 23.03.2023.
//

import UIKit
import SnapKit

extension UIView {
    func addSubview(_ view: UIView, layout: (ConstraintMaker) -> Void) {
        addSubview(view)
        view.snp.makeConstraints(layout)
    }
}
