//
//  FadeAnimationTableViewCell.swift
//  Pendula
//
//  Created by tokizo on 2021/04/17.
//

import UIKit

final class FadeAnimationTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    var animationBackgroundView: UIView?

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

    func generateCustomPurple(alpha: CGFloat) -> UIColor {
        return UIColor(red: 178/255,
                       green: 161/255,
                       blue: 216/255,
                       alpha: alpha)
    }

    func configureAnimationViewWithFadeInFromLeading() {
        animationBackgroundView?.removeFromSuperview()

        animationBackgroundView = UIView(frame: CGRect(x: 0, y: 0,
                                                       width: bounds.width,
                                                       height: bounds.height))
        guard let animationBackgroundView = animationBackgroundView else {
            return
        }

        animationBackgroundView.backgroundColor = generateCustomPurple(alpha: 0.5)
        animationBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(animationBackgroundView)
        self.sendSubviewToBack(animationBackgroundView)
        self.bringSubviewToFront(textLabel!)
        animationBackgroundView.widthAnchor.constraint(equalToConstant: bounds.width).isActive = true
        animationBackgroundView.heightAnchor.constraint(equalToConstant: bounds.height).isActive = true
        animationBackgroundView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true

        let constraint = NSLayoutConstraint(item: animationBackgroundView,
                                            attribute: .leading,
                                            relatedBy: .equal,
                                            toItem: self,
                                            attribute: .leading,
                                            multiplier: 1.0,
                                            constant: 0)
        self.addConstraint(constraint)
        UIView.animate(withDuration: 1.0) {
            animationBackgroundView.center.x += self.bounds.width
        }
    }

    func removeAnimationBackgroundViewFromSuperViewWithFadeOut() {
        UIView.animate(withDuration: 1.0) {
            self.animationBackgroundView?.alpha = 0.0
        } completion: { finised in
            guard finised else {
                return
            }
            self.animationBackgroundView?.removeFromSuperview()
        }
    }

}
