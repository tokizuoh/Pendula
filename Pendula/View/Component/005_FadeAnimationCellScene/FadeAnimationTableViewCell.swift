//
//  FadeAnimationTableViewCell.swift
//  Pendula
//
//  Created by tokizo on 2021/04/17.
//

import UIKit

final class FadeAnimationTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension FadeAnimationTableViewCell {

    func setTitleLabel(title: String) {
        titleLabel.text = title
    }

}
