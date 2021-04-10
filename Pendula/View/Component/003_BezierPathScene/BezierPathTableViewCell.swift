//
//  BezierPathTableViewCell.swift
//  Pendula
//
//  Created by tokizo on 2021/04/10.
//

import UIKit

final class BezierPathTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bezierPathView: CustomBezierPathView!

    var drawHandler: ((_ rect: CGRect) -> Void)? {
        didSet {
            bezierPathView.drawHandler = drawHandler
        }
    }

    var cellHeight: CGFloat = 110

}
