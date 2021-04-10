//
//  CustomBezierPathView.swift
//  Pendula
//
//  Created by tokizo on 2021/04/10.
//

import UIKit

@IBDesignable final class CustomBezierPathView: UIView {

    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.close()
        UIColor.red.setStroke()
        path.stroke()
    }

}
