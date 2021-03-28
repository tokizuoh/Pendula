//
//  VerificationTableViewCell.swift
//  Pendula
//
//  Created by tokizo on 2021/03/28.
//

import UIKit

final class VerificationTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var lastUpdatedLabel: UILabel!

    struct ViewModel {
        let title: String
        let lastUpdatedDateText: String
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
        lastUpdatedLabel.text = "最終更新日: \(viewModel.lastUpdatedDateText)"
    }

}
