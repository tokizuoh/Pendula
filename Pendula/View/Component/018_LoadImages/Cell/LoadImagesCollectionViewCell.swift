//
//  LoadImagesCollectionViewCell.swift
//  Pendula
//
//  Created by tokizo on 2021/11/26.
//

import UIKit

final class LoadImagesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var indexLabel: UILabel!

    struct ViewModel {
        let image: UIImage?
        let rowText: String
        let lapText: String
    }

    func setup(viewModel: ViewModel) {
        thumbnailImageView.image = viewModel.image
        indexLabel.text = "row: \(viewModel.rowText), laps: \(viewModel.lapText)"
    }

}
