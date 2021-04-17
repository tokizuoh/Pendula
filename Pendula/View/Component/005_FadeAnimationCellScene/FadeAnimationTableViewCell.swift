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
        let view1 = UIView(frame: CGRect(x: 0, y: 0,
                                         width: bounds.width,
                                         height: bounds.height))
        view1.backgroundColor = generateCustomPurple(colorAlpha: 0.5)
        self.addSubview(view1)
        self.sendSubviewToBack(view1)
        self.bringSubviewToFront(textLabel!)
        view1.widthAnchor.constraint(equalToConstant: bounds.width).isActive = true
        view1.heightAnchor.constraint(equalToConstant: bounds.height).isActive = true
        view1.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        view1.layer.zPosition = textLabel!.layer.zPosition - 1

        // TODO [feature/#58]: Animation
        let constraint = NSLayoutConstraint(item: view1,
                                            attribute: NSLayoutConstraint.Attribute.top,
                                            relatedBy: NSLayoutConstraint.Relation.equal,
                                            toItem: self,
                                            attribute: NSLayoutConstraint.Attribute.top,
                                            multiplier: 1.0,
                                            constant: bounds.width - 100)
    }

}
