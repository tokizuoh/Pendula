//
//  ImosCollectionViewCell.swift
//  Pendula
//
//  Created by tokizo on 2021/04/03.
//

import UIKit

final class ImosCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var countLabel: UILabel!

    func setup(text: String) {
        countLabel.text = text
    }

}
