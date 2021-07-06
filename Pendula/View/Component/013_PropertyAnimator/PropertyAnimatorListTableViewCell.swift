//
//  PropertyAnimatorListTableViewCell.swift
//  Pendula
//
//  Created by tokizo on 2021/07/06.
//

import UIKit

class PropertyAnimatorListTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!

    struct ViewModel {
        let title: String
    }

    var viewModel: ViewModel?

    func setup() {
        guard let viewModel = viewModel else {
            return
        }
        titleLabel.text = viewModel.title
    }

}
