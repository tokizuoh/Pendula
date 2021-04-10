//
//  CustomBezierPathView.swift
//  Pendula
//
//  Created by tokizo on 2021/04/10.
//

import UIKit

@IBDesignable final class CustomBezierPathView: UIView {

    var drawHandler: ((_ rect: CGRect) -> Void)? {
        didSet {
            layoutIfNeeded()
        }
    }

    override func draw(_ rect: CGRect) {
        drawHandler?(rect)
    }

}
