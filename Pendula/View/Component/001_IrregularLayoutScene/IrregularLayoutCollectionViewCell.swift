//
//  IrregularLayoutCollectionViewCell.swift
//  Pendula
//
//  Created by tokizo on 2021/03/31.
//

import UIKit

final class IrregularLayoutCollectionViewCell: UICollectionViewCell {

    var item: IrregularLayoutCellItem? {
        didSet {
            setup()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    private func setup() {

    }

}
