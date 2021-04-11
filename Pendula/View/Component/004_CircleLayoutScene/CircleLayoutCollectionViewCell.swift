//
//  CircleLayoutCollectionViewCell.swift
//  Pendula
//
//  Created by tokizo on 2021/04/11.
//

import UIKit

final class CircleLayoutCollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
        guard let circleLayoutAttributes = layoutAttributes as? CircleCollectionViewLayoutAttributes else {
            return
        }
        layer.anchorPoint = circleLayoutAttributes.anchorPoint
        center.y += (circleLayoutAttributes.anchorPoint.y - 0.5) * bounds.height
    }

}
