//
//  VerificationTableViewCell.swift
//  Pendula
//
//  Created by tokizo on 2021/03/28.
//

import UIKit

final class VerificationTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!

    struct ViewModel {
        let title: String
    }
    var viewModel: ViewModel?

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setup() {
        guard let viewModel = viewModel else {
            return
        }
        titleLabel.text = viewModel.title
    }

}
