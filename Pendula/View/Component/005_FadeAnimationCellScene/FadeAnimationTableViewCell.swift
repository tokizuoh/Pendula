//
//  FadeAnimationTableViewCell.swift
//  Pendula
//
//  Created by tokizo on 2021/04/17.
//

import UIKit

final class FadeAnimationTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var fadeAnimationBackgroundView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()

        fadeAnimationBackgroundView.backgroundColor = generateCustomPurple(colorAlpha: 0.0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

extension FadeAnimationTableViewCell {

    func setTitleLabel(title: String) {
        titleLabel.text = title
    }

    func generateCustomPurple(colorAlpha: CGFloat) -> UIColor {
        return UIColor(red: 178/255,
                       green: 161/255,
                       blue: 216/255,
                       alpha: colorAlpha)
    }

    func fadeAnimateBackgroundView(alpha: CGFloat) {
        fadeAnimationBackgroundView.backgroundColor = generateCustomPurple(colorAlpha: alpha)
    }

}
