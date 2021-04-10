//
//  ShinyColorsGalleryTableViewCell.swift
//  Pendula
//
//  Created by tokizo on 2021/04/08.
//

import UIKit

final class ShinyColorsGalleryTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var separatorView: SeparatorView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

final class SeparatorView: UIView {

    private var dotColor: UIColor = UIColor.gray

    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        path.lineCapStyle = .butt
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))

        let dashes = [path.lineWidth, path.lineWidth]
        path.setLineDash(dashes, count: dashes.count, phase: 0)

        dotColor.setStroke()
        path.stroke()
    }
}
