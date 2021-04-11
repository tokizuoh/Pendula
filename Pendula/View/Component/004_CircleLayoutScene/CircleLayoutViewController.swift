//
//  CircleLayoutViewController.swift
//  Pendula
//
//  Created by tokizo on 2021/04/11.
//

import UIKit

final class CircleLayoutViewController: ComponentBaseViewController {

    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.dataSource = self
            collectionView.register(R.nib.circleLayoutCollectionViewCell)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigationItem(navigationTitle: "004 CircleLayout",
                                blogURL: nil,
                                githubPRURL: nil)
    }

}

extension CircleLayoutViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: R.reuseIdentifier.circleLayoutCollectionViewCell,
                                                      for: indexPath)!
        cell.backgroundColor = .blue
        return cell
    }

}

final class CircleCollectionViewLayout: UICollectionViewLayout {
    let itemSize: CGSize = CGSize(width: 100, height: 200)
    var radius: CGFloat = 500 {
        didSet {
            invalidateLayout()
        }
    }

    var anglePerItem: CGFloat {
        return atan(itemSize.width / radius)
    }

    var attributesList = [CircleCollectionViewLayoutAttributes]()

    override var collectionViewContentSize: CGSize {
        guard let collectionView = collectionView else {
            return .zero
        }
        return CGSize(width: CGFloat(collectionView.numberOfItems(inSection: 0)) * itemSize.width,
                      height: collectionView.bounds.height)
    }

    override class var layoutAttributesClass: AnyClass {
        return CircleCollectionViewLayoutAttributes.self
    }

    override func prepare() {
        super.prepare()

        guard let collectionView = collectionView else {
            return
        }

        let centerX = collectionView.contentOffset.x + collectionView.bounds.width / 2.0
        let anchorPointY = (itemSize.height / 2 + radius) / itemSize.height

        attributesList = (0..<collectionView.numberOfItems(inSection: 0)).map { i in
            let attributes = CircleCollectionViewLayoutAttributes(forCellWith: IndexPath(row: i, section: 0))
            attributes.size = self.itemSize
            attributes.center = CGPoint(x: centerX,
                                        y: collectionView.bounds.midY)
            attributes.anchorPoint = CGPoint(x: 0.5, y: anchorPointY)
            attributes.angle = self.anglePerItem * CGFloat(i)
            return attributes
        }
    }

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return attributesList
    }

    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        guard attributesList.indices.contains(indexPath.row) else {
            return nil
        }
        return attributesList[indexPath.row]
    }
}

final class CircleCollectionViewLayoutAttributes: UICollectionViewLayoutAttributes {
    var anchorPoint: CGPoint = CGPoint(x: 0.5, y: 0.5)
    var angle: CGFloat = 0 {
        didSet {
            zIndex = Int(angle * 100000)
            transform = CGAffineTransform(rotationAngle: angle)
        }
    }

    override func copy(with zone: NSZone? = nil) -> Any {
        let attributes = super.copy(with: zone) as! CircleCollectionViewLayoutAttributes
        attributes.anchorPoint = anchorPoint
        attributes.angle = angle
        return attributes
    }
}
