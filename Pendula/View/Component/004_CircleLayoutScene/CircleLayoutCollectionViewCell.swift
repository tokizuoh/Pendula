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

        // layoutAttributesを用いてセルの中心（= 円の中心）を補正する
        // circleLayoutAttributes.anchorPoint.y は セル自体の高さを基準とした数値なので、実測値としてbound.height (= セルの高さ)をかける
        center.y += (circleLayoutAttributes.anchorPoint.y - 0.5) * bounds.height
    }

}
