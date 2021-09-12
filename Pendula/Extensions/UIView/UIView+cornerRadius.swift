//
//  UIView+cornerRadius.swift
//  Pendula
//
//  Created by tokizo on 2021/09/12.
//

import UIKit

extension UIView {

    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }

}
