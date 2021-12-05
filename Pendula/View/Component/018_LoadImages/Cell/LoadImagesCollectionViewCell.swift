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

    private let placeholderImage = R.image.loadImages_placeholder()

    struct ViewModel {
        let image: UIImage?
        let rowText: String
        let lapText: String
    }

    func setup(viewModel: ViewModel) {
        if let image = viewModel.image {
            thumbnailImageView.image = image
        } else {
            thumbnailImageView.image = placeholderImage
        }

        indexLabel.text = "row: \(viewModel.rowText), lap: \(viewModel.lapText)"
    }

}
