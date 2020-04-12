//
//  UITableViewCell.swift
//  MT1News
//
//  Created by Vinicius Mangueira Correia on 31/03/20.
//  Copyright © 2020 Vinicius Mangueira Correia. All rights reserved.
//

import UIKit

extension UITableViewCell {

    func animationToRight() {
        self.alpha = 0
        let transform = CATransform3DTranslate(CATransform3DIdentity, 250, 0, 0)
        self.layer.transform = transform
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            self.alpha = 1
            self.layer.transform = CATransform3DIdentity
        }, completion: nil)
    }
    
}

func configure<T>(
    _ value: T,
    using closure: (inout T) throws -> Void
) rethrows -> T {
    var value = value
    try closure(&value)
    return value
}
