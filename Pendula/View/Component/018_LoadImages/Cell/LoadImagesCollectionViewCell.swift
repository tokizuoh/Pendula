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
        let image: Data?
        let rowText: String
        let lapText: String
    }

    func setup(viewModel: ViewModel) {
        if let imageData = viewModel.image,
           let image = UIImage(data: imageData) {
            thumbnailImageView.image = image
        } else {
            thumbnailImageView.image = placeholderImage
        }

        indexLabel.text = "row: \(viewModel.rowText), lap: \(viewModel.lapText)"
    }

}
